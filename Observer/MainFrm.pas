unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Car, Vcl.ExtCtrls, Vcl.StdCtrls,
  Observer;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FCar: TCar;
    FTachometer: IObserver;
    FSpeedAssist: IObserver;
    procedure AddObserver(Subject: ISubject; Observer: IObserver);
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses
  Tachometer,
  SpeedAssistant;
{$R *.dfm}

procedure TForm5.AddObserver(Subject: ISubject; Observer: IObserver);
begin
  Subject.Attach(Observer);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  FCar.DriveFaster;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  FCar.DriveSlower;
end;

procedure TForm5.CheckBox1Click(Sender: TObject);
var
  Subject: ISubject;
begin
  if Supports(FCar, ISubject, Subject) then
  begin
    if CheckBox1.Checked then
      Subject.Attach(FSpeedAssist)
    else
      Subject.Detach(FSpeedAssist);
  end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  FCar := TCar.Create;
  FTachometer := TTachometer.Create(FCar, Label1);
  FSpeedAssist := TSpeedAssistant.Create(FCar, Shape1);
  AddObserver(FCar, FTachometer);
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
  FCar.Free;
end;

end.
