object frmMain: TfrmMain
  Left = 694
  Top = 291
  Caption = 'frmMain'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowHint = True
  OnCreate = FormCreate
  DesignSize = (
    628
    442)
  TextHeight = 15
  object btLoadLib: TButton
    Left = 8
    Top = 409
    Width = 89
    Height = 25
    Hint = 'Try to load the library specified in the editor on the right'
    Anchors = [akLeft, akBottom]
    Caption = 'Try Load Lib'
    TabOrder = 0
    OnClick = btLoadLibClick
    ExplicitTop = 408
  end
  object mmLog: TMemo
    Left = 8
    Top = 80
    Width = 612
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitWidth = 608
    ExplicitHeight = 312
  end
  object cbVer: TComboBox
    Left = 8
    Top = 8
    Width = 331
    Height = 23
    Hint = 'Select Delphi version'
    Style = csDropDownList
    TabOrder = 2
    OnCloseUp = cbVerCloseUp
  end
  object btCheckReg: TButton
    Left = 8
    Top = 37
    Width = 75
    Height = 25
    Hint = 'Shows all installed FastReport components'
    Caption = 'Check Reg'
    TabOrder = 3
    OnClick = btCheckRegClick
  end
  object btFind: TButton
    Left = 89
    Top = 37
    Width = 75
    Height = 25
    Hint = 'Search on disk FastReport bpl'#39's'
    Caption = 'Find BPLs'
    TabOrder = 4
    OnClick = btFindClick
  end
  object cbIDE: TCheckBox
    Left = 360
    Top = 8
    Width = 153
    Height = 17
    Hint = 'Add paths specified in the IDE'
    Caption = 'Include IDE Pathes'
    TabOrder = 5
  end
  object leDllPath: TLabeledEdit
    Left = 163
    Top = 411
    Width = 457
    Height = 23
    Hint = 'The path and name of the library to load'
    Anchors = [akLeft, akRight, akBottom]
    EditLabel.Width = 50
    EditLabel.Height = 23
    EditLabel.Caption = 'BPL Path '
    LabelPosition = lpLeft
    TabOrder = 6
    Text = ''
    ExplicitTop = 410
    ExplicitWidth = 453
  end
  object btClearLog: TButton
    Left = 170
    Top = 37
    Width = 75
    Height = 25
    Hint = 'Clear log'
    Caption = 'Clear Log'
    TabOrder = 7
    OnClick = btClearLogClick
  end
  object cbExtra: TCheckBox
    Left = 360
    Top = 28
    Width = 113
    Height = 17
    Hint = 'Show extended information about found files'
    Caption = 'Show Extra Info'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object cbSubDirs: TCheckBox
    Left = 360
    Top = 51
    Width = 145
    Height = 17
    Hint = 'Also search in subdirectories'
    Caption = 'Include SubDirs'
    TabOrder = 9
  end
  object bbHelp: TBitBtn
    Left = 592
    Top = 8
    Width = 28
    Height = 25
    Hint = 'Help'
    Anchors = [akTop, akRight]
    Caption = '&'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 10
    OnClick = bbHelpClick
    ExplicitLeft = 588
  end
end
