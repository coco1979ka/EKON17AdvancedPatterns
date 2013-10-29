unit SpeedAssistant;

interface

uses
  ExtCtrls,
  Car,
  Observer;

type
  TSpeedAssistant = class(TInterfacedObject, IObserver)
  private
    FCar: TCar;
    FShape: TShape;
    FMax: Integer;
  protected
    procedure Update;
  public

    constructor Create(Car: TCar; Shape: TShape);
    procedure SetAllowedSpeed(Max: Integer);

  end;

implementation

{ TSpeedAssistant }

constructor TSpeedAssistant.Create(Car: TCar; Shape: TShape);
begin
  FShape := Shape;
  FCar := Car;
  FMax := 100;
end;

procedure TSpeedAssistant.SetAllowedSpeed(Max: Integer);
begin
  FMax := Max;
end;

procedure TSpeedAssistant.Update;
begin
  FShape.Visible := (FCar.Speed > FMax);
end;

end.
