unit CircuitStates;

interface

uses
  TimeSpan,
  CircuitBreaker;

type
  TClosedState = class(TInterfacedObject, ICircuitState)
  private
    FTimeOut: TTimeSpan;
    FIsTripped: Boolean;
  protected
    procedure Guard;
    function NextState: ICircuitState;
    procedure Succeed;
    procedure Trip;
  public
    constructor Create(TimeOut: TTimeSpan);
  end;

  THalfOpenState = class(TInterfacedObject, ICircuitState)
  private
    FTimeOut: TTimeSpan;
    FSucceeded: Boolean;
    FTripped: Boolean;
  protected
    procedure Guard;
    function NextState: ICircuitState;
    procedure Succeed;
    procedure Trip;
  public
    constructor Create(TimeOut: TTimeSpan);

  end;

  TOpenState = class(TInterfacedObject, ICircuitState)
  private
    FTimeOut: TTimeSpan;
    FTrippedAt: TDateTime;
  protected
    procedure Guard;
    function NextState: ICircuitState;
    procedure Succeed;
    procedure Trip;
  public
    constructor Create(TimeOut: TTimeSpan);

  end;

implementation

uses
  Classes,
  SysUtils;

{ TOpenState }

constructor TOpenState.Create(TimeOut: TTimeSpan);
begin
  FTimeOut := TimeOut;
  FTrippedAt := Now;
end;

procedure TOpenState.Guard;
begin
  raise EInvalidOperation.Create('Circuit is currently open');
end;

function TOpenState.NextState: ICircuitState;
begin
  if (Now - FTrippedAt) >= FTimeOut.TotalDays then
    Exit(THalfOpenState.Create(FTimeOut));
  Result := Self;
end;

procedure TOpenState.Succeed;
begin
end;

procedure TOpenState.Trip;
begin

end;

{ TClosedState }

constructor TClosedState.Create(TimeOut: TTimeSpan);
begin
  FTimeOut := TimeOut;
end;

procedure TClosedState.Guard;
begin

end;

function TClosedState.NextState: ICircuitState;
begin
  if FIsTripped then
    Exit(TOpenState.Create(FTimeOut));
  Result := Self;
end;

procedure TClosedState.Succeed;
begin
end;

procedure TClosedState.Trip;
begin
  FIsTripped := True;
end;

{ THalfOpenState }

constructor THalfOpenState.Create(TimeOut: TTimeSpan);
begin

end;

procedure THalfOpenState.Guard;
begin
end;

function THalfOpenState.NextState: ICircuitState;
begin
  if FSucceeded then
    Exit(TClosedState.Create(FTimeOut));
  if FTripped then
    Exit(TOpenState.Create(FTimeOut));
  Result := Self;
end;

procedure THalfOpenState.Succeed;
begin
  FSucceeded := True;
end;

procedure THalfOpenState.Trip;
begin
  FTripped := True;
end;

end.
