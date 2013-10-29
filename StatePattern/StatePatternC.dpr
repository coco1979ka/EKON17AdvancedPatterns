program StatePatternC;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CircuitBreaker in 'CircuitBreaker.pas',
  CircuitStates in 'CircuitStates.pas',
  SomeService in 'SomeService.pas',
  MainFrm in 'MainFrm.pas' {Form1};

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
