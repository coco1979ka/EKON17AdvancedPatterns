unit CircuitBreaker;

interface

uses
  TimeSpan;

type
  ICircuitState = interface
    ['{CEA708E0-A48E-4453-911F-FE613967FE6C}']
    procedure Guard;
    function NextState: ICircuitState;
    procedure Succeed;
    procedure Trip;
  end;

  ICircuitBreaker = interface
    ['{F3C4D9F1-7F39-4B06-A079-05F94E289C76}']
    procedure Guard;
    procedure Succeed;
    procedure Trip;
  end;

  TCircuitBreaker = class(TinterfacedObject, ICircuitBreaker)
  private
    FState: ICircuitState;
  protected
    procedure Guard;
    procedure Succeed;
    procedure Trip;
  public
    constructor Create(TimeOut: TTimeSpan);
  end;

implementation

uses
  CircuitStates;

{ TCircuitBreaker }

constructor TCircuitBreaker.Create(TimeOut: TTimeSpan);
begin
  FState := TClosedState.Create(TimeOut);
end;

procedure TCircuitBreaker.Guard;
begin
  FState := FState.NextState;
  FState.Guard;
  FState := FState.NextState;
end;

procedure TCircuitBreaker.Succeed;

begin
  FState := FState.NextState;
  FState.Succeed;
  FState := FState.NextState;
end;

procedure TCircuitBreaker.Trip;
begin
  FState := FState.NextState;
  FState.Trip;
  FState := FState.NextState;
end;

end.
