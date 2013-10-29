unit Car;

interface

uses
  Subject,
  Observer,
  Generics.Defaults;

type
  TCar = class (TSingletonImplementation, ISubject)
    private
      FSpeed : Integer;
      FSubject : ISubject;
    protected
      property Subject : ISubject read FSubject implements ISubject;
    public
      constructor Create;
      procedure DriveFaster;
      procedure DriveSlower;
      property Speed : Integer read FSpeed;
  end;

implementation

{ TMotor }

constructor TCar.Create;
begin
  FSubject := TSubject.Create;
end;

procedure TCar.DriveFaster;
begin
  Inc(FSpeed, 10);
  FSubject.Notify;
end;

procedure TCar.DriveSlower;
begin
  Dec(FSpeed, 10);
  FSubject.Notify;
end;

end.
