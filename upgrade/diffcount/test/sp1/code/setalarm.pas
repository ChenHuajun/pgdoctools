
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


