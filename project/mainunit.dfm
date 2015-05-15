object Form1: TForm1
  Left = 204
  Top = 126
  Width = 716
  Height = 539
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #20027#30028#38754
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 56
    Width = 580
    Height = 65
    Alignment = taCenter
    AutoSize = False
    Caption = #26680#30005#21378#24310#23551#31649#29702#26631#20934#25968#25454#24211
    Color = clBtnFace
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -48
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 552
    Top = 480
    Width = 137
    Height = 16
    AutoSize = False
    Caption = 'Made by SunYecheng'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Button1: TButton
    Left = 432
    Top = 152
    Width = 200
    Height = 65
    BiDiMode = bdLeftToRight
    Caption = #26816#32034#21450#32463#39564#21453#39304
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 232
    Width = 200
    Height = 65
    Caption = #32463#39564#21453#39304#23457#26680
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 432
    Top = 312
    Width = 200
    Height = 65
    Caption = 'LRA'#21450#30003#35831#27969#31243
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object ConnectButton: TButton
    Left = 120
    Top = 376
    Width = 75
    Height = 25
    Caption = 'ConnectButton'
    TabOrder = 3
    OnClick = ConnectButtonClick
  end
  object UserIDEdit: TEdit
    Left = 128
    Top = 272
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'UserIDEdit'
  end
  object PasswordEdit: TEdit
    Left = 128
    Top = 304
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'PasswordEdit'
  end
  object FtpServerEdit: TEdit
    Left = 128
    Top = 336
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'FtpServerEdit'
  end
  object DebugListBox: TListBox
    Left = 272
    Top = 256
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 7
  end
  object Button4: TButton
    Left = 432
    Top = 392
    Width = 200
    Height = 65
    Caption = 'LRA'#23457#26680
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button4Click
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 120
    Top = 176
  end
end
