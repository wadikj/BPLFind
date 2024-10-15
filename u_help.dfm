object frmHelp: TfrmHelp
  Left = 613
  Top = 353
  Hint = 'Help'
  BorderStyle = bsSizeToolWin
  Caption = 'Help'
  ClientHeight = 453
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 632
    Height = 453
    Align = alClient
    Lines.Strings = (
      
        'The program is designed to search for bpl files of various versi' +
        'ons of FastReport.'
      ''
      
        'At startup, the program determines its bit depth and in which ve' +
        'rsion of RAD Studio was compiled and displays this '
      
        'in the header of the form. The same version of RAD Studio is imp' +
        'loringly displayed in combo versions.'
      ''
      
        'The BPL'#39's is searched in the directories defined in the OS PATH ' +
        'variable, as well as in VirtuslStore and SysWOW64'
      'Assigning controls'
      
        'Combo - allows you to choose which version of RAD Studio package' +
        's will be searched for.'
      'Checkboxes'
      
        'Include IDE Paths - adds the paths specified in the RAD Studio s' +
        'ettings to the search paths.'
      
        'Show Extra info - at the end of the search, displays a window wi' +
        'th additional information about the found files. For '
      
        'each found file name, the path where it is located, the size and' +
        ' the date of creation are shown'
      
        'Include SubDirs - searches not only in PATH directories, but als' +
        'o in their subdirectories (the search will take much '
      'longer)'
      ''
      'Buttons'
      
        'Check Reg - scans the registry and searches for the installed Fa' +
        'stReport files for the selected RAD Studio'
      'Find BPLs - search for a DLL'
      'Clear Log - clearing the work log'
      ''
      
        'Try Load Lib - tries to load the dll first as a RAD Studio packa' +
        'ge, and then as just a dll. Depending on the compiler '
      
        'versions of the program and the dll, there may be different resu' +
        'lts. But if everything is compiled by the same '
      
        'compiler and the bit sizes match, then the operation is usually ' +
        'successful (if the system can find a dll to load and '
      
        'the Include IDE Paths flag is not taken into account). If nothin' +
        'g is indicated next to it in the code stack, then the '
      
        'program tries to download frxXX.bpl (the currently selected vers' +
        'ion of RAD Studio).'
      ''
      
        '!!! It should be noted that the results of running the program i' +
        'n the IDE and without the IDE are different (the IDE '
      
        'adds additional values to the PATH variable). In some cases, it ' +
        'makes sense to run the program from a folder in your '
      'application, the operation of which you want to check.')
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
  end
end
