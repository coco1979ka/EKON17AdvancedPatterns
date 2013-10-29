unit Tachometer;

interface

uses
  Car,
  StdCtrls,
  Observer;

type
  TTachometer = class (TInterfacedObject, IObserver)
  private
    FLabel : TLabel;
    FCar : TCar;
  protected
    procedure Update;
  public
    constructor Create(Car : TCar; Lbl : TLabel);
  end;

implementation

uses
  SysUtils;

{ TTachometer }

constructor TTachometer.Create(Car: TCar; Lbl: TLabel);
begin
FCar := Car;
FLabel := Lbl;
end;

procedure TTachometer.Update;
begin
FLabel.Caption := 'Speed: ' + IntToStr(FCar.Speed) + ' km/h';
end;

end.
