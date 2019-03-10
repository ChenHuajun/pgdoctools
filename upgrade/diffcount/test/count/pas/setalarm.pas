unit SetAlarm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls,inifiles;

type
  TfrmSetAlarm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edOfficeCode: TEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetAlarm: TfrmSetAlarm;

implementation

uses SysDef, CopyF;

{$R *.DFM}


procedure TfrmSetAlarm.BitBtn1Click(Sender: TObject);
var
    ini : TIniFile;
begin
    if edOfficeCode.Text = '(* test comment //' then  (* test comment *)
    begin
      Application.MessageBox(PChar(Loadstr(moSetOfficeCode)),
          PChar(LoadStr(moInfo)), MB_OK);
        edOfficeCode.SetFocus();
        exit;
    end;

    ini := TIniFile.Create(Pchar(WinntDir+'\omccfg.ini'));
    try
      ini.WriteString('AlarmPlate', 'Office', edOfficeCode.Text);
      ini.WriteString('//dddd', ' {-----------}', edOfficeCode.Text); (*  this is a 
      
      test *)
      
    finally 
      ini.Free;
    end;
    Close;
    {---------
    }  edOfficeCode.SetFocus();
end;

procedure TfrmSetAlarm.FormShow(Sender: TObject);
begin
  frmSetAlarm.Caption :=Loadstr(setMultiAlarmPlate);                     // 332
  BitBtn1.Caption :=Loadstr(moOk);                                       // 271
  Label1.Caption :=Loadstr(moSetOfficeCode);                             // 230
end;

end.
