unit Car;

interface

type
  TDoors = (tdTwo = 2, tdFour = 4);
  TEnginePower = (epLow = 75, epMedium = 90, epHigh = 115, epSports = 175);

  TCar = class;

  ICarBuilder = interface
    ['{900EDD06-3EEE-4CA3-AEF4-CCFEF44AD7E7}']
    function SetDoors(Doors: TDoors): ICarBuilder;
    function SetEngine(Power: TEnginePower): ICarBuilder;
    function AddEntertainmentSystem: ICarBuilder;
    function AddNavigation: ICarBuilder;
    function AddAutomaticTransmission: ICarBuilder;
    function Build(): TCar;
  end;

  TCar = class
  private
    FDoors: TDoors;
    FEnginePower: TEnginePower;
    FHasEntertainmentSytem: Boolean;
    FHasNavigation: Boolean;
    FAutomaticTransmission: Boolean;
    function GetDoorsValue: string;
    function GetEngineValue: string;
  public type
    TCarBuilder = class(TInterfacedObject, ICarBuilder)
    private
      FDoors: TDoors;
      FEnginePower: TEnginePower;
      FHasEntertainmentSytem: Boolean;
      FHasNavigation: Boolean;
      FAutomaticTransmission: Boolean;
    public
      function SetDoors(Doors: TDoors): ICarBuilder;
      function SetEngine(Power: TEnginePower): ICarBuilder;
      function AddEntertainmentSystem: ICarBuilder;
      function AddNavigation: ICarBuilder;
      function AddAutomaticTransmission: ICarBuilder;
      function Build: TCar;
    end;
  public
    constructor Create();
    procedure ShowConfiguration;
    class function Builder: ICarBuilder;
  end;

implementation

uses
  SysUtils;

{ TCar }

class function TCar.Builder: ICarBuilder;
begin
  Result := TCarBuilder.Create;
end;

constructor TCar.Create;
begin

end;

function TCar.GetDoorsValue: string;
begin
  case FDoors of
    tdTwo:
      Result := 'Zweitürer';
    tdFour:
      Result := 'Viertürer';
  end;
end;

function TCar.GetEngineValue: string;
begin
  case FEnginePower of
    epLow:
      Result := '75 PS';
    epMedium:
      Result := '90 PS';
    epHigh:
      Result := '115 PS';
    epSports:
      Result := '175 PS';
  end;
end;

procedure TCar.ShowConfiguration;
begin
  Writeln('Typ :' + GetDoorsValue);
  Writeln('Automatikgetriebe : ' + BoolToStr(FAutomaticTransmission, True));
  Writeln('Leistung (PS) :' + IntToStr(Ord(FEnginePower)));
  Writeln('Enterteinment Paket : ' + BoolToStr(FHasEntertainmentSytem, True));
  Writeln('Navigation : ' + BoolToStr(FHasNavigation, True));
end;

{ TCar.TCarBuilder }

function TCar.TCarBuilder.AddAutomaticTransmission: ICarBuilder;
begin
  FAutomaticTransmission := True;
  Result := Self;
end;

function TCar.TCarBuilder.AddEntertainmentSystem: ICarBuilder;
begin
  FHasEntertainmentSytem := True;
  Result := Self;
end;

function TCar.TCarBuilder.AddNavigation: ICarBuilder;
begin
  FHasNavigation := True;
  Result := Self;
end;

function TCar.TCarBuilder.Build: TCar;
begin
  Result := TCar.Create;
  Result.FDoors := FDoors;
  Result.FEnginePower := FEnginePower;
  Result.FHasEntertainmentSytem := FHasEntertainmentSytem;
  Result.FHasNavigation := FHasNavigation;
end;

function TCar.TCarBuilder.SetDoors(Doors: TDoors): ICarBuilder;
begin
  FDoors := Doors;
  Result := Self;
end;

function TCar.TCarBuilder.SetEngine(Power: TEnginePower): ICarBuilder;
begin
  FEnginePower := Power;
  Result := Self;
end;

end.
