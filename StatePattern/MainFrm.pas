unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SomeService, CircuitBreaker;

type
  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FSomeService: TSomeService;
    FCircuitBreaker: ICircuitBreaker;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  TimeSpan;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FCircuitBreaker.Guard;
  try
    FSomeService.DoSomething;
    FCircuitBreaker.Succeed;
  except on E: Exception do
    begin
    FCircuitBreaker.Trip;
    ShowMessage('Operation failed');
    end;
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    FSomeService.SetDefect
  else
    FSomeService.SetActive
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCircuitBreaker := TCircuitBreaker.Create(TTimeSpan.FromSeconds(10));
  FSomeService := TSomeService.Create;
end;

end.
