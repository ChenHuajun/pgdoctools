////////////////////////////////////////////////////////////////////
//ModuleName: Install                FileName:SelDbType.Pas       //
//CreateDate: 01/9/15                Author:  wangy               //
//Version:    3.0                                                 //
//History:                                                        //
// Date       Version       Modifier           Activies           //
//================================================================//
////////////////////////////////////////////////////////////////////

unit SelDbType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmSelDbType = class(TForm)
    rgbDbType: TRadioGroup;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
		procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelDbType: TfrmSelDbType;

implementation

uses SysDef;

{$R *.DFM}

procedure TfrmSelDbType.btnOKClick(Sender: TObject);
begin
  if rgbDbType.ItemIndex=0 then
      isOracle := false
  else
      isOracle := true;
  ModalResult := mrOK; 
end;

procedure TfrmSelDbType.FormShow(Sender: TObject);
begin
  Caption := LoadStr(moSelectDBType);
  rgbDbType.Caption := LoadStr(moMAPDBType);
  btnOK.Caption := LoadStr(moOK);
end;


end.
