unit Lights;

interface

uses
  Command;

type
  TLight = class
    procedure SwitchOn;
    procedure SwitchOff;
  end;

  TLightOnCommand = class(TInterfacedObject, ICommand)
  private
    FLight: TLight;
  public
    constructor Create(Light: TLight);
    procedure Execute;
    procedure Undo;
  end;

  TLightOffCommand = class (TInterfacedObject, ICommand)
  private
    FLight: TLight;
  public
    constructor Create(Light: TLight);
    procedure Execute;
    procedure Undo;
  end;

implementation

{ TLight }

procedure TLight.SwitchOff;
begin
  Writeln('Light off');
end;

procedure TLight.SwitchOn;
begin
  Writeln('Light on');
end;

{ TLightOnCommand }

constructor TLightOnCommand.Create(Light: TLight);
begin
  FLight := Light;
end;

procedure TLightOnCommand.Execute;
begin
  FLight.SwitchOn;
end;

procedure TLightOnCommand.Undo;
begin
  FLight.SwitchOff;
end;

{ TLightOffCommand }

constructor TLightOffCommand.Create(Light: TLight);
begin
  FLight := Light;
end;

procedure TLightOffCommand.Execute;
begin
  FLight.SwitchOff;
end;

procedure TLightOffCommand.Undo;
begin
  FLight.SwitchOn;
end;

end.
