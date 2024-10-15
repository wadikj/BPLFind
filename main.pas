unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IOUtils, Types,
  u_consts, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    btLoadLib: TButton;
    mmLog: TMemo;
    cbVer: TComboBox;
    btCheckReg: TButton;
    btFind: TButton;
    cbIDE: TCheckBox;
    leDllPath: TLabeledEdit;
    btClearLog: TButton;
    cbExtra: TCheckBox;
    cbSubDirs: TCheckBox;
    bbHelp: TBitBtn;
    procedure btLoadLibClick(Sender: TObject);
    procedure cbVerCloseUp(Sender: TObject);
    procedure btCheckRegClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btFindClick(Sender: TObject);
    procedure btClearLogClick(Sender: TObject);
    procedure bbHelpClick(Sender: TObject);
  private
    { Private declarations }
    FSelectedCompiler:TCompilerData;
    procedure Log(const S:string);overload;
    procedure Log(const A:TStringDynArray);overload;
    procedure Log(const A:TStrings);overload;
    procedure CLog(const S:string);


    function GetDllFolders:TStrings;
    procedure FillCombo;
    procedure CheckRegistry;
    function FindBPLs:TStrings;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

{

НАФИГА ОНА НУЖНА

1. ИНСТАЛЛЕР НЕ ПОКАЗЫВАЕТ, где он находит bpl старых версий
  прога должна это сделать
  (ищем bpl в путях поиска бибилиотек (PATH), а также в ключах борланда)
  что такое virtualSore - понятно, что
  а также все пути, откуда может загрузиться эти bpl


2. может быть ситуация, когда у нас есть bpl старой версии, но она где то
  заныкана, но при этом она грузится вместо той, которая нужна. Надо их отслеживать и
  показывать юзеру

3. Можно попробовать заргузить какую то bpl и показать юзеру, откуда оно загрузилось
  фактически



в качестве базовых bpl прога берет bpl, которые находятся в настройках RAD (если там что то есть)

для этого оно лезет в реестр, смотрит, какие версии Delphi установлены и предлагает
пользователю выбрать, с какой дельфей работать    \

при загрузке смотрит, чем ее скомпилироали, и предлагает по умолчанию эту версию RAD

это можно настроить злобным ifdefом (и нужно)


в качестве путей поиска bpl также лезем в VirtualStore Folder



при загрузке - смотрит, какой версией дельфи ее скомилировали, и ставит ее по умолчанию
хотя можно выбрать любую другую  - должен быть список выбора 

далее пользователь может запустить поиск бпл как по путям поиска длл, так и по всем дискам

после этого пользователь получает список найденных бпл, в котором отмечено, сколько раз каждая бпл найдена
и пользователь может попробовать запустить каждую из найденных БПЛ  - при этом 
можно поробовать интегрировать в приложение маленький пустой отчет?

или запустить бпл без пути и вывести полный путь того, что запустилось

а также путь будет опция checking - не надо

и пусть показывает для любой версии Delphi, какие там bpl установлены - при загрузке


}


implementation

{$R *.dfm}

uses Registry, u_ExtraInfo, u_help;

procedure TfrmMain.btLoadLibClick(Sender: TObject);
var H:THandle;
    I:Integer;
    S,MN:string;
begin
  if leDllPath.Text<>''  then
    S:=leDllPath.Text
  else
    S:='frx'+IntToStr(FSelectedCompiler.PkgVer)+'.bpl';
  MN:='';

  try
    Log('Loading package '+S+'...');

    H:=LoadPackage(S);
    I:=GetLastError;
    if I<>0 then begin
      Log('Error code = ' + IntToStr(0));
    end;
    Log('Package Handle: '+IntToStr(H));

    MN:=GetModuleName(H);
    Log('Module Name: '+MN );
    UnloadPackage(H);
  except
    on E:Exception do
      Log(E.Message);
  end;
  try
    Log('Loading dll '+S+'...');

    H:=LoadLibrary(PWideChar(S));
    I:=GetLastError;
    if I<>0 then begin
      Log('Error code = ' + IntToStr(0));
    end;
    Log('DLL Handle: '+IntToStr(H));

    MN:=GetModuleName(H);
    Log('Module Name: '+MN );
    FreeLibrary(H);
  except
    on E:Exception do
      Log(E.Message);
  end;
end;

procedure TfrmMain.btClearLogClick(Sender: TObject);
begin
  mmLog.Clear;
end;

procedure TfrmMain.btFindClick(Sender: TObject);
var SL:TStrings;
begin
  SL:=FindBPLs;

  if SL.Count<>0 then begin
    Log('$$$$$------------Found files:--------------$$$$$');
    Log(SL);
    if cbExtra.Checked then
      ShowExtraInfo(SL);
  end else begin
    Log('$$$$$----------Files NOT Found-------------$$$$$');
  end;
  SL.Free;
end;

procedure TfrmMain.bbHelpClick(Sender: TObject);
begin
  frmhelp.Show;
end;

procedure TfrmMain.btCheckRegClick(Sender: TObject);
begin
  CheckRegistry;
end;

procedure TfrmMain.cbVerCloseUp(Sender: TObject);
begin
  FSelectedCompiler:=CompilerData[cbVer.ItemIndex];
  Log('IDE selected: '+FSelectedCompiler.Name);
  Log('Version: '+FSelectedCompiler.ProductVer);
  Log('Package version: '+ IntToStr(FSelectedCompiler.PkgVer));
  Log('Compiler Version:' + IntToStr(FSelectedCompiler.CompilerVer));
end;

procedure TfrmMain.CheckRegistry;
var r:TRegistry;
    S:string;
    SL:TStringList;
    I: Integer;
begin
  R:=TRegistry.Create;
  S:='\Software\Embarcadero\BDS\'+FSelectedCompiler.ProductVer;
  R.OpenKeyReadOnly(S);
  if not R.KeyExists('Known Packages') then begin
    Log('IDE not installed...');
    R.CloseKey;
    R.Free;
    Exit;
  end;
  Log('IDE packages key exist...');
  Log('Find installed FastReport BPL''s...');

  R.CloseKey;

  S:=S+'\Known Packages\';
  R.OpenKeyReadOnly(S);

  SL:=TStringList.Create;

  R.GetValueNames(SL);
  for I := 0 to Sl.Count-1 do begin
    S:=R.ReadString(SL[I]);
    if (Pos('Fast Report',S)<>0) or (Pos('FastReport',S)<>0)then begin
      Log('Find BPL: ' + SL[I]+' - ' + S);
    end;
  end;

  SL.Free;
  R.Free;
end;

procedure TfrmMain.CLog(const S: string);
var S1:string;
begin
  try
    mmLog.Lines.BeginUpdate;
    S1:=mmLog.Lines[mmLog.Lines.Count-1];
    mmLog.Lines[mmLog.Lines.Count-1]:=S1+ ' ' + S;
  finally
    mmLog.Lines.EndUpdate;
  end;
  
end;

procedure TfrmMain.FillCombo;
var I:Integer;
begin
  cbVer.Items.Clear;
  for I := 0 to High(CompilerData) do begin
    cbVer.Items.Add(CompilerData[I].Name);
  end;
  cbVer.ItemIndex:=CurrentCompiler;
  cbVerCloseUp(nil);
end;

function TfrmMain.FindBPLs: TStrings;
var SL:TStrings;
    S: string;
    RES:TStringList;
    SA:TStringDynArray;
    I,BadIndex:Integer;
    so:TSearchOption;
begin
  //возвращает список бпл фастрепорта

  //ищем все бпл f*XX.bpl
  //не сделано
  //потом выдираем из них те, которые не подходят под список фр
  //и возвращаем то, что получилось


  SL:=GetDllFolders;
  RES:=TStringList.Create;
  for I:=0 to SL.Count-1 do begin

    S:=SL[I];
    //if Pos('$(',S)=1 then Continue;
    if S='' then Continue;
    Log(S);

    if cbSubDirs.Checked then
      so:=TSearchOption.soAllDirectories
    else
      so:=TSearchOption.soTopDirectoryOnly;

    S:=S+'\';
    if (Pos('VirtualStore',S)>0)or(Pos('BPL',UpperCase(S))>0) then
      so:=TSearchOption.soAllDirectories;
    try
      SA:=TDirectory.GetFiles(S,'f*'+IntToStr(FSelectedCompiler.PkgVer)+'.bpl',so);
      RES.AddStrings(SA);
    except
      on E:Exception do
        CLog(' --- !!! Can''t check this directory !!! ---');
    end;
  end;

  if FSelectedCompiler.PkgVer<10 then
    for I := Res.Count+1 downto 0 do begin
      S:=RES[I];
      BadIndex:=Length(S)-5;
      if CharInSet(S[BadIndex],['1','2','3','4','5']) then
        RES.Delete(I);
    end;

  SL.Free;
  Result:=RES;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FillCombo;
{$IFDEF CPUX64}
  Caption:='FastReport BPL Finder - x64';
{$ELSE}
  Caption:='FastReport BPL Finder - x32 ['+cbVer.Text+']';
{$ENDIF}
end;

function TfrmMain.GetDllFolders: TStrings;
var S,S1,BDS:string;
    SA:TArray<string>;
    SL:TStringList;
    R:TRegistry;
    I:Integer;
begin
  Result:=TStringList.Create;
  S:=System.SysUtils.GetEnvironmentVariable('PATH');
  SA:=S.Split([';']);
  SL:=TStringList.Create;
  R:=nil;
  try
    SL.Sorted:=True;
    SL.Duplicates:=dupIgnore;
    SL.AddStrings(SA);
    S:=Application.ExeName;
    S:=TPath.GetDirectoryName(S);
    SL.Add(S);
    S:=System.SysUtils.GetEnvironmentVariable('WINDIR');
    SL.Add(S);
    S:=S+'\SysWOW64';
    SL.Add(S);

    S:=System.SysUtils.GetEnvironmentVariable('SYSTEMROOT');
    SL.Add(S);


    {BDS = RootDir}
    R:=TRegistry.Create;
    S:='\Software\Embarcadero\BDS\'+FSelectedCompiler.ProductVer;
    R.OpenKeyReadOnly(S);
    S1:=R.ReadString('RootDir');
    if S1<>'' then begin
      SL.Add(S1+'\BPL');
    end;

    if cbIDE.Checked then begin
      if R.KeyExists('Environment Variables') then begin
        R.CloseKey;
        S:=S+'\Environment Variables';
        R.OpenKeyReadOnly(S);
        S:=R.ReadString('PATH');
        SA:=S.Split([';']);
        SL.AddStrings(SA);
      end;
      R.CloseKey;
    end;
    Result.AddStrings(SL);
  finally
    SL.Free;
    R.Free;
  end;
  S:=System.SysUtils.GetEnvironmentVariable('USERPROFILE');
  S:=S+'\AppData\Local\VirtualStore';
  Result.Add(S);

  I:=-1;
  if cbSubDirs.Checked then
    while True do begin
      Inc(I);
      if I>=Result.Count-2 then Break;
      S:=LowerCase(Trim(Result[I]));
      if S='' then Continue;
      S1:=LowerCase(Result[I+1]);
      if Pos(S,S1)=1 then begin
        Result.Delete(I+1);
        Dec(I);
      end;
    end;
end;

procedure TfrmMain.Log(const A: TStrings);
begin
  try
    mmLog.Lines.BeginUpdate;
    mmLog.Lines.AddStrings(A);
  finally
    mmLog.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.Log(const A: TStringDynArray);
begin
  try
    mmLog.Lines.BeginUpdate;
    mmLog.Lines.AddStrings(A);
  finally
    mmLog.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.Log(const S: string);
begin
  try
    mmLog.Lines.BeginUpdate;
    mmLog.Lines.Add(S);
  finally
    mmLog.Lines.EndUpdate;
  end;
end;

end.
