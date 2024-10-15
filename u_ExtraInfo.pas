unit u_ExtraInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Generics.Collections, IOUtils;


type
  TfrmExtra = class(TForm)
    lb: TListBox;
    Splitter1: TSplitter;
    mmPathes: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbClick(Sender: TObject);
    procedure lbKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FBPLs:TObjectDictionary<string,TStringList>;
  public
    { Public declarations }
    procedure Init(AData:TStrings);
    procedure ViewPathes;
  end;

var
  frmExtra: TfrmExtra = nil;

procedure ShowExtraInfo(AData:Tstrings);

implementation

{$R *.dfm}

procedure ShowExtraInfo(AData:Tstrings);
begin
  if not Assigned(frmExtra) then
    Application.CreateForm(TfrmExtra,frmExtra);
  frmExtra.mmPathes.Clear;
  frmExtra.Init(AData);
  frmExtra.Show;
end;

procedure TfrmExtra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=TCloseAction.caHide;
end;

procedure TfrmExtra.FormCreate(Sender: TObject);
begin
  FBPLs:=TObjectDictionary<string,TStringList>.Create([doOwnsValues]);
end;

procedure TfrmExtra.FormDestroy(Sender: TObject);
begin
  FBPLs.Free;
end;

procedure TfrmExtra.Init;
var
  I: Integer;
  S,N:string;
  SL:TStringList;
  MyClass: TComponent;
begin
  FBPLs.Clear;
  for I := 0 to AData.Count-1 do begin
    S:=AData[I];
    N:=TPath.GetFileName(S);
    if FBPLs.TryGetValue(N,SL) then begin
      SL.Add(S);
    end else begin
      SL:=TStringList.Create;
      SL.Add(S);
      FBPLs.Add(N,SL);
    end;
  end;

  try
    lb.Items.BeginUpdate;
    lb.Items.Clear;
    for N in FBPLs.Keys do begin
      lb.Items.Add(N);
    end;
  finally
    lb.Items.EndUpdate;
  end;

  if lb.Count>0 then begin
    lb.ItemIndex:=0;
    ViewPathes;
  end;
end;

procedure TfrmExtra.lbClick(Sender: TObject);
begin
  ViewPathes;
end;

procedure TfrmExtra.lbKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ViewPathes;
end;

procedure TfrmExtra.ViewPathes;
var S,f:string;
    SL:TStringList;
begin
  try
    mmPathes.Lines.BeginUpdate;
    mmPathes.Clear;
    if lb.ItemIndex=-1 then Exit;
    S:=lb.Items[lb.ItemIndex];
    if FBPLs.ContainsKey(S) then begin
      SL:=FBPLs[S];
      //mmPathes.Lines.AddStrings(SL);
      for f in SL do begin
        S:=f + ': Size: ' + IntToStr(TFile.GetSize(f))+ '; Modified: '+DateTimeToStr(TFile.GetCreationTime(f));
        mmPathes.Lines.Add(S);
      end;

    end;
  finally
    mmPathes.Lines.EndUpdate;
  end;
end;

end.
