program DecoratorPattern;

uses
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {Form6},
  SomeService in 'SomeService.pas',
  ServiceImpl in 'ServiceImpl.pas',
  LoggingDecorator in 'LoggingDecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
