// Copyright © 2020 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3-Clause

import ucrt
import WinSDK

public struct Win32Error: Swift.Error {
    private enum ErrorCode {
        case errno(errno_t)
        case win32(DWORD)
        case nt(DWORD)
        case hresult(DWORD)
    }

    private let code: ErrorCode

    public init(win32 error: DWORD) {
        code = .win32(error)
    }

    public init(nt error: DWORD) {
        code = .nt(error)
    }

    public init(hresult hr: DWORD) {
        code = .hresult(hr)
    }

    public init(hresult hr: HRESULT) {
        code = .hresult(DWORD(hr))
    }

    public init(errno: errno_t) {
        code = .errno(errno)
    }
}

extension Win32Error: CustomStringConvertible {
    public var description: String {
        let dwFlags: DWORD = DWORD(FORMAT_MESSAGE_ALLOCATE_BUFFER)
            | DWORD(FORMAT_MESSAGE_FROM_SYSTEM)
            | DWORD(FORMAT_MESSAGE_IGNORE_INSERTS)

        let short: String
        let dwResult: DWORD
        var buffer: UnsafeMutablePointer<WCHAR>?

        switch self.code {
        case .errno(let errno):
            short = "errno \(errno)"

            struct Error: Swift.Error {
            }

            do {
                let description = try String(decodingWideCStringBufferLength: 80) { buffer in
                    guard let pointer = buffer.baseAddress else {
                        throw Error()
                    }

                    guard _wcserror_s(pointer, buffer.count, errno) == 0 else {
                        throw Error()
                    }
                }

                return "\(short) - \(description)"
            } catch {
                return short
            }

        case .win32(let error):
            short = "Win32 Error \(error)"

            dwResult = withUnsafeMutablePointer(to: &buffer) {
                $0.withMemoryRebound(to: WCHAR.self, capacity: 2) {
                    FormatMessageW(
                        dwFlags,
                        nil,
                        error,
                        MAKELANGID(WORD(LANG_NEUTRAL),
                        WORD(SUBLANG_DEFAULT)),
                        $0,
                        0,
                        nil
                    )
                }
            }

        case .nt(let status):
            short = "NTSTATUS 0x\(String(status, radix: 16))"

            dwResult = withUnsafeMutablePointer(to: &buffer) {
                $0.withMemoryRebound(to: WCHAR.self, capacity: 2) {
                    FormatMessageW(
                        dwFlags,
                        nil,
                        status,
                        MAKELANGID(WORD(LANG_NEUTRAL),
                        WORD(SUBLANG_DEFAULT)),
                        $0,
                        0,
                        nil
                    )
                }
            }

        case .hresult(let hr):
            short = "HRESULT 0x\(String(hr, radix: 16))"

            dwResult = withUnsafeMutablePointer(to: &buffer) {
                $0.withMemoryRebound(to: WCHAR.self, capacity: 2) {
                    FormatMessageW(
                        dwFlags,
                        nil,
                        hr,
                        MAKELANGID(WORD(LANG_NEUTRAL),
                        WORD(SUBLANG_DEFAULT)),
                        $0,
                        0,
                        nil
                    )
                }
            }
        }

        guard dwResult > 0, let message = buffer else { return short }
        defer { LocalFree(buffer) }
        return "\(short) - \(String(decodingCString: message, as: UTF16.self))"
    }
}

@_transparent
internal func MAKELANGID(_ p: WORD, _ s: WORD) -> DWORD {
    return DWORD((s << 10) | p)
}
