program ObserverPattern;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {Form5},
  Car in 'Car.pas',
  Observer in 'Observer.pas',
  Subject in 'Subject.pas',
  SpeedAssistant in 'SpeedAssistant.pas',
  Tachometer in 'Tachometer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
