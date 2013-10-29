program StatePattern;

uses
  Vcl.Forms,
  CircuitBreaker in 'CircuitBreaker.pas',
  CircuitStates in 'CircuitStates.pas',
  MainFrm in 'MainFrm.pas' {Form1},
  SomeService in 'SomeService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
