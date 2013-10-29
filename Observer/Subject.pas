unit Subject;

interface

uses
  Generics.Collections,
  Observer;

type
  TSubject = class(TInterfacedObject, ISubject)
  private
    FObservers : TList<IObserver>;
  protected
    procedure Attach(Observer: IObserver);
    procedure Detach(Observer: IObserver);
    procedure Notify;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSubject }

procedure TSubject.Attach(Observer: IObserver);
begin
  if not FObservers.Contains(Observer) then
    FObservers.Add(Observer);
end;

constructor TSubject.Create;
begin
  FObservers := TList<IObserver>.Create;
end;

destructor TSubject.Destroy;
begin
  FObservers.Free;
  inherited;
end;

procedure TSubject.Detach(Observer: IObserver);
begin
  if FObservers.Contains(Observer) then
    FObservers.Remove(Observer);
end;

procedure TSubject.Notify;
var
  Observer : IObserver;
begin
for Observer in FObservers do
  Observer.Update;

end;

end.
