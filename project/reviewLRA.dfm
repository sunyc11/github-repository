object Form7: TForm7
  Left = 182
  Top = 20
  Width = 1070
  Height = 689
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'LRA'#23457#26680
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 480
    Top = 80
    Width = 30
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Item'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label16: TLabel
    Left = 456
    Top = 112
    Width = 81
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = 'Structure and/or Component'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label17: TLabel
    Left = 744
    Top = 128
    Width = 61
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Material'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label18: TLabel
    Left = 456
    Top = 200
    Width = 83
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'Environment'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label14: TLabel
    Left = 712
    Top = 184
    Width = 129
    Height = 49
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aging Effect/Mechanism'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label5: TLabel
    Left = 432
    Top = 264
    Width = 129
    Height = 65
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aging Management Program(AMP) of Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label6: TLabel
    Left = 456
    Top = 440
    Width = 81
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Further Evaluation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label1: TLabel
    Left = 744
    Top = 472
    Width = 81
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Review'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label2: TLabel
    Left = 736
    Top = 72
    Width = 81
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Group'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label7: TLabel
    Left = 640
    Top = 16
    Width = 225
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 'LRA'#21450#23457#26597
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBackground
    Font.Height = -27
    Font.Name = #24494#36719#38597#40657
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 432
    Top = 336
    Width = 129
    Height = 73
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aging Management Program(AMP) from GALL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Label8: TLabel
    Left = 736
    Top = 432
    Width = 97
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = 'Classfication'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Layout = tlCenter
    WordWrap = True
  end
  object Panel4: TPanel
    Left = 824
    Top = 504
    Width = 121
    Height = 145
    Color = clBlue
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 96
      Width = 75
      Height = 25
      Caption = #19981#21516
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 600
    Top = 512
    Width = 129
    Height = 137
    HelpType = htKeyword
    Color = clAqua
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 425
    Height = 642
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnClick = TreeView1Click
    OnCustomDrawItem = TreeView1CustomDrawItem
  end
  object Button2: TButton
    Left = 624
    Top = 520
    Width = 89
    Height = 25
    Caption = #21152#36733#26412#22320'LRA'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 624
    Top = 560
    Width = 89
    Height = 25
    Caption = #25171#24320'LRA'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 624
    Top = 600
    Width = 89
    Height = 25
    Caption = #36820#22238
    TabOrder = 5
    OnClick = Button5Click
  end
  object Material: TMemo
    Left = 840
    Top = 104
    Width = 153
    Height = 57
    ReadOnly = True
    TabOrder = 6
  end
  object environment: TMemo
    Left = 560
    Top = 168
    Width = 145
    Height = 73
    ReadOnly = True
    TabOrder = 7
  end
  object sc: TMemo
    Left = 560
    Top = 104
    Width = 145
    Height = 57
    ReadOnly = True
    TabOrder = 8
  end
  object Item: TMemo
    Left = 560
    Top = 72
    Width = 145
    Height = 25
    ReadOnly = True
    TabOrder = 9
  end
  object ae: TMemo
    Left = 840
    Top = 168
    Width = 153
    Height = 73
    ReadOnly = True
    TabOrder = 10
  end
  object amp: TMemo
    Left = 560
    Top = 256
    Width = 433
    Height = 73
    ReadOnly = True
    TabOrder = 11
  end
  object Further: TMemo
    Left = 560
    Top = 424
    Width = 145
    Height = 73
    ReadOnly = True
    TabOrder = 12
  end
  object Button3: TButton
    Left = 848
    Top = 520
    Width = 75
    Height = 25
    Caption = #23457#26680#36890#36807
    TabOrder = 13
    OnClick = Button3Click
  end
  object Button6: TButton
    Left = 840
    Top = 560
    Width = 89
    Height = 25
    Caption = #23457#26680#19981#36890#36807
    TabOrder = 14
    OnClick = Button6Click
  end
  object review: TMemo
    Left = 840
    Top = 472
    Width = 145
    Height = 25
    ReadOnly = True
    TabOrder = 15
  end
  object gp: TMemo
    Left = 840
    Top = 72
    Width = 153
    Height = 25
    ReadOnly = True
    TabOrder = 16
  end
  object ampgall: TMemo
    Left = 560
    Top = 336
    Width = 433
    Height = 73
    ReadOnly = True
    TabOrder = 17
  end
  object cl: TMemo
    Left = 840
    Top = 424
    Width = 145
    Height = 41
    ReadOnly = True
    TabOrder = 18
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=GALLnew.mdb;Persist' +
      ' Security Info=False'
    Parameters = <>
    Left = 112
    Top = 72
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LRA.mdb;Persist Sec' +
      'urity Info=False'
    Parameters = <>
    Left = 144
    Top = 72
  end
  object OpenDialog1: TOpenDialog
    Left = 112
    Top = 104
  end
  object ADOQuery3: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LRA.mdb;Persist Sec' +
      'urity Info=False'
    Parameters = <>
    Left = 176
    Top = 72
  end
  object ADOQuery4: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=LRA.mdb;Persist Sec' +
      'urity Info=False'
    Parameters = <>
    Left = 208
    Top = 72
  end
end
