object frmExtra: TfrmExtra
  Left = 0
  Top = 0
  Caption = 'Extra Info of Founded packages'
  ClientHeight = 598
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 493
    Width = 878
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 369
    ExplicitWidth = 229
  end
  object lb: TListBox
    Left = 0
    Top = 0
    Width = 878
    Height = 493
    Align = alClient
    ItemHeight = 15
    Sorted = True
    TabOrder = 0
    OnClick = lbClick
    OnKeyUp = lbKeyUp
    ExplicitWidth = 874
    ExplicitHeight = 492
  end
  object mmPathes: TMemo
    Left = 0
    Top = 496
    Width = 878
    Height = 102
    Align = alBottom
    Lines.Strings = (
      'mmPathes')
    TabOrder = 1
    ExplicitTop = 495
    ExplicitWidth = 874
  end
end
