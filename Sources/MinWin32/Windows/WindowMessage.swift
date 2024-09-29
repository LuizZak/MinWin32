import WinSDK

public struct WindowMessage: @unchecked Sendable {
    public var uMsg: UINT
    public var wParam: WPARAM
    public var lParam: LPARAM

    @_transparent
    public init(uMsg: UINT, wParam: WPARAM, lParam: LPARAM) {
        self.uMsg = uMsg
        self.wParam = wParam
        self.lParam = lParam
    }
}

extension WindowMessage {
    public var uMsgDescription: String {
        Self.debugDescription(for: uMsg)
    }

    public static func debugDescription(for uMsg: UINT) -> String {
        return messages[Int(uMsg)] ?? "Unknown Message"
    }

    static let messages: [Int:String] = [
        0    : "WM_NULL",
        1    : "WM_CREATE",
        2    : "WM_DESTROY",
        3    : "WM_MOVE",
        5    : "WM_SIZE",
        6    : "WM_ACTIVATE",
        7    : "WM_SETFOCUS",
        8    : "WM_KILLFOCUS",
        10   : "WM_ENABLE",
        11   : "WM_SETREDRAW",
        12   : "WM_SETTEXT",
        13   : "WM_GETTEXT",
        14   : "WM_GETTEXTLENGTH",
        15   : "WM_PAINT",
        16   : "WM_CLOSE",
        17   : "WM_QUERYENDSESSION",
        18   : "WM_QUIT",
        19   : "WM_QUERYOPEN",
        20   : "WM_ERASEBKGND",
        21   : "WM_SYSCOLORCHANGE",
        22   : "WM_ENDSESSION",
        24   : "WM_SHOWWINDOW",
        25   : "WM_CTLCOLOR",
        26   : "WM_WININICHANGE",
        27   : "WM_DEVMODECHANGE",
        28   : "WM_ACTIVATEAPP",
        29   : "WM_FONTCHANGE",
        30   : "WM_TIMECHANGE",
        31   : "WM_CANCELMODE",
        32   : "WM_SETCURSOR",
        33   : "WM_MOUSEACTIVATE",
        34   : "WM_CHILDACTIVATE",
        35   : "WM_QUEUESYNC",
        36   : "WM_GETMINMAXINFO",
        38   : "WM_PAINTICON",
        39   : "WM_ICONERASEBKGND",
        40   : "WM_NEXTDLGCTL",
        42   : "WM_SPOOLERSTATUS",
        43   : "WM_DRAWITEM",
        44   : "WM_MEASUREITEM",
        45   : "WM_DELETEITEM",
        46   : "WM_VKEYTOITEM",
        47   : "WM_CHARTOITEM",
        48   : "WM_SETFONT",
        49   : "WM_GETFONT",
        50   : "WM_SETHOTKEY",
        51   : "WM_GETHOTKEY",
        55   : "WM_QUERYDRAGICON",
        57   : "WM_COMPAREITEM",
        61   : "WM_GETOBJECT",
        65   : "WM_COMPACTING",
        68   : "WM_COMMNOTIFY",
        70   : "WM_WINDOWPOSCHANGING",
        71   : "WM_WINDOWPOSCHANGED",
        72   : "WM_POWER",
        73   : "WM_COPYGLOBALDATA",
        74   : "WM_COPYDATA",
        75   : "WM_CANCELJOURNAL",
        78   : "WM_NOTIFY",
        80   : "WM_INPUTLANGCHANGEREQUEST",
        81   : "WM_INPUTLANGCHANGE",
        82   : "WM_TCARD",
        83   : "WM_HELP",
        84   : "WM_USERCHANGED",
        85   : "WM_NOTIFYFORMAT",
        123  : "WM_CONTEXTMENU",
        124  : "WM_STYLECHANGING",
        125  : "WM_STYLECHANGED",
        126  : "WM_DISPLAYCHANGE",
        127  : "WM_GETICON",
        128  : "WM_SETICON",
        129  : "WM_NCCREATE",
        130  : "WM_NCDESTROY",
        131  : "WM_NCCALCSIZE",
        132  : "WM_NCHITTEST",
        133  : "WM_NCPAINT",
        134  : "WM_NCACTIVATE",
        135  : "WM_GETDLGCODE",
        136  : "WM_SYNCPAINT",
        160  : "WM_NCMOUSEMOVE",
        161  : "WM_NCLBUTTONDOWN",
        162  : "WM_NCLBUTTONUP",
        163  : "WM_NCLBUTTONDBLCLK",
        164  : "WM_NCRBUTTONDOWN",
        165  : "WM_NCRBUTTONUP",
        166  : "WM_NCRBUTTONDBLCLK",
        167  : "WM_NCMBUTTONDOWN",
        168  : "WM_NCMBUTTONUP",
        169  : "WM_NCMBUTTONDBLCLK",
        171  : "WM_NCXBUTTONDOWN",
        172  : "WM_NCXBUTTONUP",
        173  : "WM_NCXBUTTONDBLCLK",
        176  : "EM_GETSEL",
        177  : "EM_SETSEL",
        178  : "EM_GETRECT",
        179  : "EM_SETRECT",
        180  : "EM_SETRECTNP",
        181  : "EM_SCROLL",
        182  : "EM_LINESCROLL",
        183  : "EM_SCROLLCARET",
        185  : "EM_GETMODIFY",
        187  : "EM_SETMODIFY",
        188  : "EM_GETLINECOUNT",
        189  : "EM_LINEINDEX",
        190  : "EM_SETHANDLE",
        191  : "EM_GETHANDLE",
        192  : "EM_GETTHUMB",
        193  : "EM_LINELENGTH",
        194  : "EM_REPLACESEL",
        195  : "EM_SETFONT",
        196  : "EM_GETLINE",
        197  : "EM_LIMITTEXT || EM_SETLIMITTEXT",
        198  : "EM_CANUNDO",
        199  : "EM_UNDO",
        200  : "EM_FMTLINES",
        201  : "EM_LINEFROMCHAR",
        202  : "EM_SETWORDBREAK",
        203  : "EM_SETTABSTOPS",
        204  : "EM_SETPASSWORDCHAR",
        205  : "EM_EMPTYUNDOBUFFER",
        206  : "EM_GETFIRSTVISIBLELINE",
        207  : "EM_SETREADONLY",
        208  : "EM_SETWORDBREAKPROC",
        209  : "EM_GETWORDBREAKPROC",
        210  : "EM_GETPASSWORDCHAR",
        211  : "EM_SETMARGINS",
        212  : "EM_GETMARGINS",
        213  : "EM_GETLIMITTEXT",
        214  : "EM_POSFROMCHAR",
        215  : "EM_CHARFROMPOS",
        216  : "EM_SETIMESTATUS",
        217  : "EM_GETIMESTATUS",
        224  : "SBM_SETPOS",
        225  : "SBM_GETPOS",
        226  : "SBM_SETRANGE",
        227  : "SBM_GETRANGE",
        228  : "SBM_ENABLE_ARROWS",
        230  : "SBM_SETRANGEREDRAW",
        233  : "SBM_SETSCROLLINFO",
        234  : "SBM_GETSCROLLINFO",
        235  : "SBM_GETSCROLLBARINFO",
        240  : "BM_GETCHECK",
        241  : "BM_SETCHECK",
        242  : "BM_GETSTATE",
        243  : "BM_SETSTATE",
        244  : "BM_SETSTYLE",
        245  : "BM_CLICK",
        246  : "BM_GETIMAGE",
        247  : "BM_SETIMAGE",
        248  : "BM_SETDONTCLICK",
        255  : "WM_INPUT",
        256  : "WM_KEYDOWN",
        257  : "WM_KEYUP",
        258  : "WM_CHAR",
        259  : "WM_DEADCHAR",
        260  : "WM_SYSKEYDOWN",
        261  : "WM_SYSKEYUP",
        262  : "WM_SYSCHAR",
        263  : "WM_SYSDEADCHAR",
        265  : "WM_UNICHAR || WM_WNT_CONVERTREQUESTEX",
        266  : "WM_CONVERTREQUEST",
        267  : "WM_CONVERTRESULT",
        268  : "WM_INTERIM",
        269  : "WM_IME_STARTCOMPOSITION",
        270  : "WM_IME_ENDCOMPOSITION",
        271  : "WM_IME_COMPOSITION",
        272  : "WM_INITDIALOG",
        273  : "WM_COMMAND",
        274  : "WM_SYSCOMMAND",
        275  : "WM_TIMER",
        276  : "WM_HSCROLL",
        277  : "WM_VSCROLL",
        278  : "WM_INITMENU",
        279  : "WM_INITMENUPOPUP",
        280  : "WM_SYSTIMER",
        287  : "WM_MENUSELECT",
        288  : "WM_MENUCHAR",
        289  : "WM_ENTERIDLE",
        290  : "WM_MENURBUTTONUP",
        291  : "WM_MENUDRAG",
        292  : "WM_MENUGETOBJECT",
        293  : "WM_UNINITMENUPOPUP",
        294  : "WM_MENUCOMMAND",
        295  : "WM_CHANGEUISTATE",
        296  : "WM_UPDATEUISTATE",
        297  : "WM_QUERYUISTATE",
        306  : "WM_CTLCOLORMSGBOX",
        307  : "WM_CTLCOLOREDIT",
        308  : "WM_CTLCOLORLISTBOX",
        309  : "WM_CTLCOLORBTN",
        310  : "WM_CTLCOLORDLG",
        311  : "WM_CTLCOLORSCROLLBAR",
        312  : "WM_CTLCOLORSTATIC",
        512  : "WM_MOUSEMOVE",
        513  : "WM_LBUTTONDOWN",
        514  : "WM_LBUTTONUP",
        515  : "WM_LBUTTONDBLCLK",
        516  : "WM_RBUTTONDOWN",
        517  : "WM_RBUTTONUP",
        518  : "WM_RBUTTONDBLCLK",
        519  : "WM_MBUTTONDOWN",
        520  : "WM_MBUTTONUP",
        521  : "WM_MBUTTONDBLCLK",
        522  : "WM_MOUSEWHEEL",
        523  : "WM_XBUTTONDOWN",
        524  : "WM_XBUTTONUP",
        525  : "WM_XBUTTONDBLCLK",
        526  : "WM_MOUSEHWHEEL",
        528  : "WM_PARENTNOTIFY",
        529  : "WM_ENTERMENULOOP",
        530  : "WM_EXITMENULOOP",
        531  : "WM_NEXTMENU",
        532  : "WM_SIZING",
        533  : "WM_CAPTURECHANGED",
        534  : "WM_MOVING",
        536  : "WM_POWERBROADCAST",
        537  : "WM_DEVICECHANGE",
        544  : "WM_MDICREATE",
        545  : "WM_MDIDESTROY",
        546  : "WM_MDIACTIVATE",
        547  : "WM_MDIRESTORE",
        548  : "WM_MDINEXT",
        549  : "WM_MDIMAXIMIZE",
        550  : "WM_MDITILE",
        551  : "WM_MDICASCADE",
        552  : "WM_MDIICONARRANGE",
        553  : "WM_MDIGETACTIVE",
        560  : "WM_MDISETMENU",
        561  : "WM_ENTERSIZEMOVE",
        562  : "WM_EXITSIZEMOVE",
        563  : "WM_DROPFILES",
        564  : "WM_MDIREFRESHMENU",
        640  : "WM_IME_REPORT",
        641  : "WM_IME_SETCONTEXT",
        642  : "WM_IME_NOTIFY",
        643  : "WM_IME_CONTROL",
        644  : "WM_IME_COMPOSITIONFULL",
        645  : "WM_IME_SELECT",
        646  : "WM_IME_CHAR",
        648  : "WM_IME_REQUEST",
        656  : "WM_IME_KEYDOWN",
        657  : "WM_IME_KEYUP",
        672  : "WM_NCMOUSEHOVER",
        673  : "WM_MOUSEHOVER",
        674  : "WM_NCMOUSELEAVE",
        675  : "WM_MOUSELEAVE",
        768  : "WM_CUT",
        769  : "WM_COPY",
        770  : "WM_PASTE",
        771  : "WM_CLEAR",
        772  : "WM_UNDO",
        773  : "WM_RENDERFORMAT",
        774  : "WM_RENDERALLFORMATS",
        775  : "WM_DESTROYCLIPBOARD",
        776  : "WM_DRAWCLIPBOARD",
        777  : "WM_PAINTCLIPBOARD",
        778  : "WM_VSCROLLCLIPBOARD",
        779  : "WM_SIZECLIPBOARD",
        780  : "WM_ASKCBFORMATNAME",
        781  : "WM_CHANGECBCHAIN",
        782  : "WM_HSCROLLCLIPBOARD",
        783  : "WM_QUERYNEWPALETTE",
        784  : "WM_PALETTEISCHANGING",
        785  : "WM_PALETTECHANGED",
        786  : "WM_HOTKEY",
        791  : "WM_PRINT",
        792  : "WM_PRINTCLIENT",
        793  : "WM_APPCOMMAND",
        856  : "WM_HANDHELDFIRST",
        863  : "WM_HANDHELDLAST",
        864  : "WM_AFXFIRST",
        895  : "WM_AFXLAST",
        896  : "WM_PENWINFIRST",
        897  : "WM_RCRESULT",
        898  : "WM_HOOKRCRESULT",
        899  : "WM_GLOBALRCCHANGE || WM_PENMISCINFO",
        900  : "WM_SKB",
        901  : "WM_HEDITCTL || WM_PENCTL",
        902  : "WM_PENMISC",
        903  : "WM_CTLINIT",
        904  : "WM_PENEVENT",
        911  : "WM_PENWINLAST",
        1024 : "DDM_SETFMT || DM_GETDEFID || NIN_SELECT || TBM_GETPOS || WM_PSD_PAGESETUPDLG || WM_USER",
        1025 : "CBEM_INSERTITEMA || DDM_DRAW || DM_SETDEFID || HKM_SETHOTKEY || PBM_SETRANGE || RB_INSERTBANDA || SB_SETTEXTA || TB_ENABLEBUTTON || TBM_GETRANGEMIN || TTM_ACTIVATE || WM_CHOOSEFONT_GETLOGFONT || WM_PSD_FULLPAGERECT",
        1026 : "CBEM_SETIMAGELIST || DDM_CLOSE || DM_REPOSITION || HKM_GETHOTKEY || PBM_SETPOS || RB_DELETEBAND || SB_GETTEXTA || TB_CHECKBUTTON || TBM_GETRANGEMAX || WM_PSD_MINMARGINRECT",
        1027 : "CBEM_GETIMAGELIST || DDM_BEGIN || HKM_SETRULES || PBM_DELTAPOS || RB_GETBARINFO || SB_GETTEXTLENGTHA || TBM_GETTIC || TB_PRESSBUTTON || TTM_SETDELAYTIME || WM_PSD_MARGINRECT",
        1028 : "CBEM_GETITEMA || DDM_END || PBM_SETSTEP || RB_SETBARINFO || SB_SETPARTS || TB_HIDEBUTTON || TBM_SETTIC || TTM_ADDTOOLA || WM_PSD_GREEKTEXTRECT",
        1029 : "CBEM_SETITEMA || PBM_STEPIT || TB_INDETERMINATE || TBM_SETPOS || TTM_DELTOOLA || WM_PSD_ENVSTAMPRECT",
        1030 : "CBEM_GETCOMBOCONTROL || PBM_SETRANGE32 || PBM_SETRANGE32 || RB_SETBANDINFOA || SB_GETPARTS || TB_MARKBUTTON || TBM_SETRANGE || TTM_NEWTOOLRECTA || WM_PSD_YAFULLPAGERECT",
        1031 : "CBEM_GETEDITCONTROL || PBM_GETRANGE || RB_SETPARENT || SB_GETBORDERS || TBM_SETRANGEMIN || TTM_RELAYEVENT",
        1032 : "CBEM_SETEXSTYLE || PBM_GETPOS || RB_HITTEST || SB_SETMINHEIGHT || TBM_SETRANGEMAX || TTM_GETTOOLINFOA",
        1033 : "CBEM_GETEXSTYLE || CBEM_GETEXTENDEDSTYLE || PBM_SETBARCOLOR || RB_GETRECT || SB_SIMPLE || TB_ISBUTTONENABLED || TBM_CLEARTICS || TTM_SETTOOLINFOA",
        1034 : "CBEM_HASEDITCHANGED || RB_INSERTBANDW || SB_GETRECT || TB_ISBUTTONCHECKED || TBM_SETSEL || TTM_HITTESTA || WIZ_QUERYNUMPAGES",
        1035 : "CBEM_INSERTITEMW || RB_SETBANDINFOW || SB_SETTEXTW || TB_ISBUTTONPRESSED || TBM_SETSELSTART || TTM_GETTEXTA || WIZ_NEXT",
        1036 : "CBEM_SETITEMW || RB_GETBANDCOUNT || SB_GETTEXTLENGTHW || TB_ISBUTTONHIDDEN || TBM_SETSELEND || TTM_UPDATETIPTEXTA || WIZ_PREV",
        1037 : "CBEM_GETITEMW || RB_GETROWCOUNT || SB_GETTEXTW || TB_ISBUTTONINDETERMINATE || TTM_GETTOOLCOUNT",
        1038 : "CBEM_SETEXTENDEDSTYLE || RB_GETROWHEIGHT || SB_ISSIMPLE || TB_ISBUTTONHIGHLIGHTED || TBM_GETPTICS || TTM_ENUMTOOLSA",
        1039 : "SB_SETICON || TBM_GETTICPOS || TTM_GETCURRENTTOOLA",
        1040 : "RB_IDTOINDEX || SB_SETTIPTEXTA || TBM_GETNUMTICS || TTM_WINDOWFROMPOINT",
        1041 : "RB_GETTOOLTIPS || SB_SETTIPTEXTW || TBM_GETSELSTART || TB_SETSTATE || TTM_TRACKACTIVATE",
        1042 : "RB_SETTOOLTIPS || SB_GETTIPTEXTA || TB_GETSTATE || TBM_GETSELEND || TTM_TRACKPOSITION",
        1043 : "RB_SETBKCOLOR || SB_GETTIPTEXTW || TB_ADDBITMAP || TBM_CLEARSEL || TTM_SETTIPBKCOLOR",
        1044 : "RB_GETBKCOLOR || SB_GETICON || TB_ADDBUTTONSA || TBM_SETTICFREQ || TTM_SETTIPTEXTCOLOR",
        1045 : "RB_SETTEXTCOLOR || TB_INSERTBUTTONA || TBM_SETPAGESIZE || TTM_GETDELAYTIME",
        1046 : "RB_GETTEXTCOLOR || TB_DELETEBUTTON || TBM_GETPAGESIZE || TTM_GETTIPBKCOLOR",
        1047 : "RB_SIZETORECT || TB_GETBUTTON || TBM_SETLINESIZE || TTM_GETTIPTEXTCOLOR",
        1048 : "RB_BEGINDRAG || TB_BUTTONCOUNT || TBM_GETLINESIZE || TTM_SETMAXTIPWIDTH",
        1049 : "RB_ENDDRAG || TB_COMMANDTOINDEX || TBM_GETTHUMBRECT || TTM_GETMAXTIPWIDTH",
        1050 : "RB_DRAGMOVE || TBM_GETCHANNELRECT || TB_SAVERESTOREA || TTM_SETMARGIN",
        1051 : "RB_GETBARHEIGHT || TB_CUSTOMIZE || TBM_SETTHUMBLENGTH || TTM_GETMARGIN",
        1052 : "RB_GETBANDINFOW || TB_ADDSTRINGA || TBM_GETTHUMBLENGTH || TTM_POP",
        1053 : "RB_GETBANDINFOA || TB_GETITEMRECT || TBM_SETTOOLTIPS || TTM_UPDATE",
        1054 : "RB_MINIMIZEBAND || TB_BUTTONSTRUCTSIZE || TBM_GETTOOLTIPS || TTM_GETBUBBLESIZE",
        1055 : "RB_MAXIMIZEBAND || TBM_SETTIPSIDE || TB_SETBUTTONSIZE || TTM_ADJUSTRECT",
        1056 : "TBM_SETBUDDY || TB_SETBITMAPSIZE || TTM_SETTITLEA",
        1057 : "MSG_FTS_JUMP_VA || TB_AUTOSIZE || TBM_GETBUDDY || TTM_SETTITLEW",
        1058 : "RB_GETBANDBORDERS",
        1059 : "MSG_FTS_JUMP_QWORD || RB_SHOWBAND || TB_GETTOOLTIPS",
        1060 : "MSG_REINDEX_REQUEST || TB_SETTOOLTIPS",
        1061 : "MSG_FTS_WHERE_IS_IT || RB_SETPALETTE || TB_SETPARENT",
        1062 : "RB_GETPALETTE",
        1063 : "RB_MOVEBAND || TB_SETROWS",
        1064 : "TB_GETROWS",
        1065 : "TB_GETBITMAPFLAGS",
        1066 : "TB_SETCMDID",
        1067 : "RB_PUSHCHEVRON || TB_CHANGEBITMAP",
        1068 : "TB_GETBITMAP",
        1069 : "MSG_GET_DEFFONT || TB_GETBUTTONTEXTA",
        1070 : "TB_REPLACEBITMAP",
        1071 : "TB_SETINDENT",
        1072 : "TB_SETIMAGELIST",
        1073 : "TB_GETIMAGELIST",
        1074 : "TB_LOADIMAGES || EM_CANPASTE || TTM_ADDTOOLW",
        1075 : "EM_DISPLAYBAND || TB_GETRECT || TTM_DELTOOLW",
        1076 : "EM_EXGETSEL || TB_SETHOTIMAGELIST || TTM_NEWTOOLRECTW",
        1077 : "EM_EXLIMITTEXT || TB_GETHOTIMAGELIST || TTM_GETTOOLINFOW",
        1078 : "EM_EXLINEFROMCHAR || TB_SETDISABLEDIMAGELIST || TTM_SETTOOLINFOW",
        1079 : "EM_EXSETSEL || TB_GETDISABLEDIMAGELIST || TTM_HITTESTW",
        1080 : "EM_FINDTEXT || TB_SETSTYLE || TTM_GETTEXTW",
        1081 : "EM_FORMATRANGE || TB_GETSTYLE || TTM_UPDATETIPTEXTW",
        1082 : "EM_GETCHARFORMAT || TB_GETBUTTONSIZE || TTM_ENUMTOOLSW",
        1083 : "EM_GETEVENTMASK || TB_SETBUTTONWIDTH || TTM_GETCURRENTTOOLW",
        1084 : "EM_GETOLEINTERFACE || TB_SETMAXTEXTROWS",
        1085 : "EM_GETPARAFORMAT || TB_GETTEXTROWS",
        1086 : "EM_GETSELTEXT || TB_GETOBJECT",
        1087 : "EM_HIDESELECTION || TB_GETBUTTONINFOW",
        1088 : "EM_PASTESPECIAL || TB_SETBUTTONINFOW",
        1089 : "EM_REQUESTRESIZE || TB_GETBUTTONINFOA",
        1090 : "EM_SELECTIONTYPE || TB_SETBUTTONINFOA",
        1091 : "EM_SETBKGNDCOLOR || TB_INSERTBUTTONW",
        1092 : "EM_SETCHARFORMAT || TB_ADDBUTTONSW",
        1093 : "EM_SETEVENTMASK || TB_HITTEST",
        1094 : "EM_SETOLECALLBACK || TB_SETDRAWTEXTFLAGS",
        1095 : "EM_SETPARAFORMAT || TB_GETHOTITEM",
        1096 : "EM_SETTARGETDEVICE || TB_SETHOTITEM",
        1097 : "EM_STREAMIN || TB_SETANCHORHIGHLIGHT",
        1098 : "EM_STREAMOUT || TB_GETANCHORHIGHLIGHT",
        1099 : "EM_GETTEXTRANGE || TB_GETBUTTONTEXTW",
        1100 : "EM_FINDWORDBREAK || TB_SAVERESTOREW",
        1101 : "EM_SETOPTIONS || TB_ADDSTRINGW",
        1102 : "EM_GETOPTIONS || TB_MAPACCELERATORA",
        1103 : "EM_FINDTEXTEX || TB_GETINSERTMARK",
        1104 : "EM_GETWORDBREAKPROCEX || TB_SETINSERTMARK",
        1105 : "EM_SETWORDBREAKPROCEX || TB_INSERTMARKHITTEST",
        1106 : "EM_SETUNDOLIMIT || TB_MOVEBUTTON",
        1107 : "TB_GETMAXSIZE",
        1108 : "EM_REDO || TB_SETEXTENDEDSTYLE",
        1109 : "EM_CANREDO || TB_GETEXTENDEDSTYLE",
        1110 : "EM_GETUNDONAME || TB_GETPADDING",
        1111 : "EM_GETREDONAME || TB_SETPADDING",
        1112 : "EM_STOPGROUPTYPING || TB_SETINSERTMARKCOLOR",
        1113 : "EM_SETTEXTMODE || TB_GETINSERTMARKCOLOR",
        1114 : "EM_GETTEXTMODE || TB_MAPACCELERATORW",
        1115 : "EM_AUTOURLDETECT || TB_GETSTRINGW",
        1116 : "EM_GETAUTOURLDETECT || TB_GETSTRINGA",
        1117 : "EM_SETPALETTE",
        1118 : "EM_GETTEXTEX",
        1119 : "EM_GETTEXTLENGTHEX",
        1120 : "EM_SHOWSCROLLBAR",
        1121 : "EM_SETTEXTEX",
        1123 : "TAPI_REPLY",
        1124 : "ACM_OPENA || BFFM_SETSTATUSTEXTA || CDM_GETSPEC || EM_SETPUNCTUATION || IPM_CLEARADDRESS || WM_CAP_UNICODE_START",
        1125 : "ACM_PLAY || BFFM_ENABLEOK || CDM_GETFILEPATH || EM_GETPUNCTUATION || IPM_SETADDRESS || PSM_SETCURSEL || UDM_SETRANGE || WM_CHOOSEFONT_SETLOGFONT",
        1126 : "ACM_STOP || BFFM_SETSELECTIONA || CDM_GETFOLDERPATH || EM_SETWORDWRAPMODE || IPM_GETADDRESS || PSM_REMOVEPAGE || UDM_GETRANGE || WM_CAP_SET_CALLBACK_ERRORW || WM_CHOOSEFONT_SETFLAGS",
        1127 : "ACM_OPENW || BFFM_SETSELECTIONW || CDM_GETFOLDERIDLIST || EM_GETWORDWRAPMODE || IPM_SETRANGE || PSM_ADDPAGE || UDM_SETPOS || WM_CAP_SET_CALLBACK_STATUSW",
        1128 : "BFFM_SETSTATUSTEXTW || CDM_SETCONTROLTEXT || EM_SETIMECOLOR || IPM_SETFOCUS || PSM_CHANGED || UDM_GETPOS",
        1129 : "CDM_HIDECONTROL || EM_GETIMECOLOR || IPM_ISBLANK || PSM_RESTARTWINDOWS || UDM_SETBUDDY",
        1130 : "CDM_SETDEFEXT || EM_SETIMEOPTIONS || PSM_REBOOTSYSTEM || UDM_GETBUDDY",
        1131 : "EM_GETIMEOPTIONS || PSM_CANCELTOCLOSE || UDM_SETACCEL",
        1132 : "EM_CONVPOSITION || PSM_QUERYSIBLINGS || UDM_GETACCEL",
        1133 : "MCIWNDM_GETZOOM || PSM_UNCHANGED || UDM_SETBASE",
        1134 : "PSM_APPLY || UDM_GETBASE",
        1135 : "PSM_SETTITLEA || UDM_SETRANGE32",
        1136 : "PSM_SETWIZBUTTONS || UDM_GETRANGE32 || WM_CAP_DRIVER_GET_NAMEW",
        1137 : "PSM_PRESSBUTTON || UDM_SETPOS32 || WM_CAP_DRIVER_GET_VERSIONW",
        1138 : "PSM_SETCURSELID || UDM_GETPOS32",
        1139 : "PSM_SETFINISHTEXTA",
        1140 : "PSM_GETTABCONTROL",
        1141 : "PSM_ISDIALOGMESSAGE",
        1142 : "MCIWNDM_REALIZE || PSM_GETCURRENTPAGEHWND",
        1143 : "MCIWNDM_SETTIMEFORMATA || PSM_INSERTPAGE",
        1144 : "EM_SETLANGOPTIONS || MCIWNDM_GETTIMEFORMATA || PSM_SETTITLEW || WM_CAP_FILE_SET_CAPTURE_FILEW",
        1145 : "EM_GETLANGOPTIONS || MCIWNDM_VALIDATEMEDIA || PSM_SETFINISHTEXTW || WM_CAP_FILE_GET_CAPTURE_FILEW",
        1146 : "EM_GETIMECOMPMODE",
        1147 : "EM_FINDTEXTW || MCIWNDM_PLAYTO || WM_CAP_FILE_SAVEASW",
        1148 : "EM_FINDTEXTEXW || MCIWNDM_GETFILENAMEA",
        1149 : "EM_RECONVERSION || MCIWNDM_GETDEVICEA || PSM_SETHEADERTITLEA || WM_CAP_FILE_SAVEDIBW",
        1150 : "EM_SETIMEMODEBIAS || MCIWNDM_GETPALETTE || PSM_SETHEADERTITLEW",
        1151 : "EM_GETIMEMODEBIAS || MCIWNDM_SETPALETTE || PSM_SETHEADERSUBTITLEA",
        1152 : "MCIWNDM_GETERRORA || PSM_SETHEADERSUBTITLEW",
        1153 : "PSM_HWNDTOINDEX",
        1154 : "PSM_INDEXTOHWND",
        1155 : "MCIWNDM_SETINACTIVETIMER || PSM_PAGETOINDEX",
        1156 : "PSM_INDEXTOPAGE",
        1157 : "DL_BEGINDRAG || MCIWNDM_GETINACTIVETIMER || PSM_IDTOINDEX",
        1158 : "DL_DRAGGING || PSM_INDEXTOID",
        1159 : "DL_DROPPED || PSM_GETRESULT",
        1160 : "DL_CANCELDRAG || PSM_RECALCPAGESIZES",
        1164 : "MCIWNDM_GET_SOURCE",
        1165 : "MCIWNDM_PUT_SOURCE",
        1166 : "MCIWNDM_GET_DEST",
        1167 : "MCIWNDM_PUT_DEST",
        1168 : "MCIWNDM_CAN_PLAY",
        1169 : "MCIWNDM_CAN_WINDOW",
        1170 : "MCIWNDM_CAN_RECORD",
        1171 : "MCIWNDM_CAN_SAVE",
        1172 : "MCIWNDM_CAN_EJECT",
        1173 : "MCIWNDM_CAN_CONFIG",
        1174 : "IE_GETINK || MCIWNDM_PALETTEKICK",
        1175 : "IE_SETINK",
        1176 : "IE_GETPENTIP",
        1177 : "IE_SETPENTIP",
        1178 : "IE_GETERASERTIP",
        1179 : "IE_SETERASERTIP",
        1180 : "IE_GETBKGND",
        1181 : "IE_SETBKGND",
        1182 : "IE_GETGRIDORIGIN",
        1183 : "IE_SETGRIDORIGIN",
        1184 : "IE_GETGRIDPEN",
        1185 : "IE_SETGRIDPEN",
        1186 : "IE_GETGRIDSIZE",
        1187 : "IE_SETGRIDSIZE",
        1188 : "IE_GETMODE",
        1189 : "IE_SETMODE",
        1190 : "IE_GETINKRECT || WM_CAP_SET_MCI_DEVICEW",
        1191 : "WM_CAP_GET_MCI_DEVICEW",
        1204 : "WM_CAP_PAL_OPENW",
        1205 : "WM_CAP_PAL_SAVEW",
        1208 : "IE_GETAPPDATA",
        1209 : "IE_SETAPPDATA",
        1210 : "IE_GETDRAWOPTS",
        1211 : "IE_SETDRAWOPTS",
        1212 : "IE_GETFORMAT",
        1213 : "IE_SETFORMAT",
        1214 : "IE_GETINKINPUT",
        1215 : "IE_SETINKINPUT",
        1216 : "IE_GETNOTIFY",
        1217 : "IE_SETNOTIFY",
        1218 : "IE_GETRECOG",
        1219 : "IE_SETRECOG",
        1220 : "IE_GETSECURITY",
        1221 : "IE_SETSECURITY",
        1222 : "IE_GETSEL",
        1223 : "IE_SETSEL",
        1224 : "EM_SETBIDIOPTIONS || IE_DOCOMMAND || MCIWNDM_NOTIFYMODE",
        1225 : "EM_GETBIDIOPTIONS || IE_GETCOMMAND",
        1226 : "EM_SETTYPOGRAPHYOPTIONS || IE_GETCOUNT",
        1227 : "EM_GETTYPOGRAPHYOPTIONS || IE_GETGESTURE || MCIWNDM_NOTIFYMEDIA",
        1228 : "EM_SETEDITSTYLE || IE_GETMENU",
        1229 : "EM_GETEDITSTYLE || IE_GETPAINTDC || MCIWNDM_NOTIFYERROR",
        1230 : "IE_GETPDEVENT",
        1231 : "IE_GETSELCOUNT",
        1232 : "IE_GETSELITEMS",
        1233 : "IE_GETSTYLE",
        1243 : "MCIWNDM_SETTIMEFORMATW",
        1244 : "EM_OUTLINE || MCIWNDM_GETTIMEFORMATW",
        1245 : "EM_GETSCROLLPOS",
        1246 : "EM_SETSCROLLPOS",
        1247 : "EM_SETFONTSIZE",
        1248 : "EM_GETZOOM || MCIWNDM_GETFILENAMEW",
        1249 : "EM_SETZOOM || MCIWNDM_GETDEVICEW",
        1250 : "EM_GETVIEWKIND",
        1251 : "EM_SETVIEWKIND",
        1252 : "EM_GETPAGE || MCIWNDM_GETERRORW",
        1253 : "EM_SETPAGE",
        1254 : "EM_GETHYPHENATEINFO",
        1255 : "EM_SETHYPHENATEINFO",
        1259 : "EM_GETPAGEROTATE",
        1260 : "EM_SETPAGEROTATE",
        1261 : "EM_GETCTFMODEBIAS",
        1262 : "EM_SETCTFMODEBIAS",
        1264 : "EM_GETCTFOPENSTATUS",
        1265 : "EM_SETCTFOPENSTATUS",
        1266 : "EM_GETIMECOMPTEXT",
        1267 : "EM_ISIME",
        1268 : "EM_GETIMEPROPERTY",
        1293 : "EM_GETQUERYRTFOBJ",
        1294 : "EM_SETQUERYRTFOBJ",
        1536 : "FM_GETFOCUS",
        1537 : "FM_GETDRIVEINFOA",
        1538 : "FM_GETSELCOUNT",
        1539 : "FM_GETSELCOUNTLFN",
        1540 : "FM_GETFILESELA",
        1541 : "FM_GETFILESELLFNA",
        1542 : "FM_REFRESH_WINDOWS",
        1543 : "FM_RELOAD_EXTENSIONS",
        1553 : "FM_GETDRIVEINFOW",
        1556 : "FM_GETFILESELW",
        1557 : "FM_GETFILESELLFNW",
        1625 : "WLX_WM_SAS",
        2024 : "SM_GETSELCOUNT || UM_GETSELCOUNT || WM_CPL_LAUNCH",
        2025 : "SM_GETSERVERSELA || UM_GETUSERSELA || WM_CPL_LAUNCHED",
        2026 : "SM_GETSERVERSELW || UM_GETUSERSELW",
        2027 : "SM_GETCURFOCUSA || UM_GETGROUPSELA",
        2028 : "SM_GETCURFOCUSW || UM_GETGROUPSELW",
        2029 : "SM_GETOPTIONS || UM_GETCURFOCUSA",
        2030 : "UM_GETCURFOCUSW",
        2031 : "UM_GETOPTIONS",
        2032 : "UM_GETOPTIONS2",
        4096 : "LVM_GETBKCOLOR",
        4097 : "LVM_SETBKCOLOR",
        4098 : "LVM_GETIMAGELIST",
        4099 : "LVM_SETIMAGELIST",
        4100 : "LVM_GETITEMCOUNT",
        4101 : "LVM_GETITEMA",
        4102 : "LVM_SETITEMA",
        4103 : "LVM_INSERTITEMA",
        4104 : "LVM_DELETEITEM",
        4105 : "LVM_DELETEALLITEMS",
        4106 : "LVM_GETCALLBACKMASK",
        4107 : "LVM_SETCALLBACKMASK",
        4108 : "LVM_GETNEXTITEM",
        4109 : "LVM_FINDITEMA",
        4110 : "LVM_GETITEMRECT",
        4111 : "LVM_SETITEMPOSITION",
        4112 : "LVM_GETITEMPOSITION",
        4113 : "LVM_GETSTRINGWIDTHA",
        4114 : "LVM_HITTEST",
        4115 : "LVM_ENSUREVISIBLE",
        4116 : "LVM_SCROLL",
        4117 : "LVM_REDRAWITEMS",
        4118 : "LVM_ARRANGE",
        4119 : "LVM_EDITLABELA",
        4120 : "LVM_GETEDITCONTROL",
        4121 : "LVM_GETCOLUMNA",
        4122 : "LVM_SETCOLUMNA",
        4123 : "LVM_INSERTCOLUMNA",
        4124 : "LVM_DELETECOLUMN",
        4125 : "LVM_GETCOLUMNWIDTH",
        4126 : "LVM_SETCOLUMNWIDTH",
        4127 : "LVM_GETHEADER",
        4129 : "LVM_CREATEDRAGIMAGE",
        4130 : "LVM_GETVIEWRECT",
        4131 : "LVM_GETTEXTCOLOR",
        4132 : "LVM_SETTEXTCOLOR",
        4133 : "LVM_GETTEXTBKCOLOR",
        4134 : "LVM_SETTEXTBKCOLOR",
        4135 : "LVM_GETTOPINDEX",
        4136 : "LVM_GETCOUNTPERPAGE",
        4137 : "LVM_GETORIGIN",
        4138 : "LVM_UPDATE",
        4139 : "LVM_SETITEMSTATE",
        4140 : "LVM_GETITEMSTATE",
        4141 : "LVM_GETITEMTEXTA",
        4142 : "LVM_SETITEMTEXTA",
        4143 : "LVM_SETITEMCOUNT",
        4144 : "LVM_SORTITEMS",
        4145 : "LVM_SETITEMPOSITION32",
        4146 : "LVM_GETSELECTEDCOUNT",
        4147 : "LVM_GETITEMSPACING",
        4148 : "LVM_GETISEARCHSTRINGA",
        4149 : "LVM_SETICONSPACING",
        4150 : "LVM_SETEXTENDEDLISTVIEWSTYLE",
        4151 : "LVM_GETEXTENDEDLISTVIEWSTYLE",
        4152 : "LVM_GETSUBITEMRECT",
        4153 : "LVM_SUBITEMHITTEST",
        4154 : "LVM_SETCOLUMNORDERARRAY",
        4155 : "LVM_GETCOLUMNORDERARRAY",
        4156 : "LVM_SETHOTITEM",
        4157 : "LVM_GETHOTITEM",
        4158 : "LVM_SETHOTCURSOR",
        4159 : "LVM_GETHOTCURSOR",
        4160 : "LVM_APPROXIMATEVIEWRECT",
        4161 : "LVM_SETWORKAREAS",
        4162 : "LVM_GETSELECTIONMARK",
        4163 : "LVM_SETSELECTIONMARK",
        4164 : "LVM_SETBKIMAGEA",
        4165 : "LVM_GETBKIMAGEA",
        4166 : "LVM_GETWORKAREAS",
        4167 : "LVM_SETHOVERTIME",
        4168 : "LVM_GETHOVERTIME",
        4169 : "LVM_GETNUMBEROFWORKAREAS",
        4170 : "LVM_SETTOOLTIPS",
        4171 : "LVM_GETITEMW",
        4172 : "LVM_SETITEMW",
        4173 : "LVM_INSERTITEMW",
        4174 : "LVM_GETTOOLTIPS",
        4179 : "LVM_FINDITEMW",
        4183 : "LVM_GETSTRINGWIDTHW",
        4191 : "LVM_GETCOLUMNW",
        4192 : "LVM_SETCOLUMNW",
        4193 : "LVM_INSERTCOLUMNW",
        4211 : "LVM_GETITEMTEXTW",
        4212 : "LVM_SETITEMTEXTW",
        4213 : "LVM_GETISEARCHSTRINGW",
        4214 : "LVM_EDITLABELW",
        4235 : "LVM_GETBKIMAGEW",
        4236 : "LVM_SETSELECTEDCOLUMN",
        4237 : "LVM_SETTILEWIDTH",
        4238 : "LVM_SETVIEW",
        4239 : "LVM_GETVIEW",
        4241 : "LVM_INSERTGROUP",
        4243 : "LVM_SETGROUPINFO",
        4245 : "LVM_GETGROUPINFO",
        4246 : "LVM_REMOVEGROUP",
        4247 : "LVM_MOVEGROUP",
        4250 : "LVM_MOVEITEMTOGROUP",
        4251 : "LVM_SETGROUPMETRICS",
        4252 : "LVM_GETGROUPMETRICS",
        4253 : "LVM_ENABLEGROUPVIEW",
        4254 : "LVM_SORTGROUPS",
        4255 : "LVM_INSERTGROUPSORTED",
        4256 : "LVM_REMOVEALLGROUPS",
        4257 : "LVM_HASGROUP",
        4258 : "LVM_SETTILEVIEWINFO",
        4259 : "LVM_GETTILEVIEWINFO",
        4260 : "LVM_SETTILEINFO",
        4261 : "LVM_GETTILEINFO",
        4262 : "LVM_SETINSERTMARK",
        4263 : "LVM_GETINSERTMARK",
        4264 : "LVM_INSERTMARKHITTEST",
        4265 : "LVM_GETINSERTMARKRECT",
        4266 : "LVM_SETINSERTMARKCOLOR",
        4267 : "LVM_GETINSERTMARKCOLOR",
        4269 : "LVM_SETINFOTIP",
        4270 : "LVM_GETSELECTEDCOLUMN",
        4271 : "LVM_ISGROUPVIEWENABLED",
        4272 : "LVM_GETOUTLINECOLOR",
        4273 : "LVM_SETOUTLINECOLOR",
        4275 : "LVM_CANCELEDITLABEL",
        4276 : "LVM_MAPINDEXTOID",
        4277 : "LVM_MAPIDTOINDEX",
        4278 : "LVM_ISITEMVISIBLE",
        8192 : "OCM__BASE",
        8197 : "LVM_SETUNICODEFORMAT",
        8198 : "LVM_GETUNICODEFORMAT",
        8217 : "OCM_CTLCOLOR",
        8235 : "OCM_DRAWITEM",
        8236 : "OCM_MEASUREITEM",
        8237 : "OCM_DELETEITEM",
        8238 : "OCM_VKEYTOITEM",
        8239 : "OCM_CHARTOITEM",
        8249 : "OCM_COMPAREITEM",
        8270 : "OCM_NOTIFY",
        8465 : "OCM_COMMAND",
        8468 : "OCM_HSCROLL",
        8469 : "OCM_VSCROLL",
        8498 : "OCM_CTLCOLORMSGBOX",
        8499 : "OCM_CTLCOLOREDIT",
        8500 : "OCM_CTLCOLORLISTBOX",
        8501 : "OCM_CTLCOLORBTN",
        8502 : "OCM_CTLCOLORDLG",
        8503 : "OCM_CTLCOLORSCROLLBAR",
        8504 : "OCM_CTLCOLORSTATIC",
        8720 : "OCM_PARENTNOTIFY",
        32768: "WM_APP",
        52429: "WM_RASDIALEVENT"
    ]
}
