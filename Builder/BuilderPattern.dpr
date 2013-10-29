program BuilderPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Car in 'Car.pas';

var
  MyCar : TCar;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    MyCar := TCar.Builder
                 .SetDoors(tdTwo)
                 .SetEngine(epHigh)
                 .AddEntertainmentSystem
                 .Build();
    try
      MyCar.ShowConfiguration;
    finally
      MyCar.Free;
    end;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
