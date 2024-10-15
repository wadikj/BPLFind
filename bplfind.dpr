program bplfind;

uses
  Vcl.Forms,
  main in 'main.pas' {frmMain},
  u_consts in 'u_consts.pas',
  u_ExtraInfo in 'u_ExtraInfo.pas' {frmExtra},
  u_help in 'u_help.pas' {frmHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmExtra, frmExtra);
  Application.CreateForm(TfrmHelp, frmHelp);
  Application.Run;
end.
