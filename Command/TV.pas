unit TV;

interface

uses
  Command;

type
  TTV = class
  private
    FChannel: string;
  public
    procedure SetChannel(Value: string);
    procedure SwitchOn;
    procedure SwitchOff;
  end;

  TTVOnCommand = class(TInterfacedObject, ICommand)
  private
    FTV: TTV;
  protected
    procedure Execute;
    procedure Undo;
  public
    constructor Create(TV: TTV);
  end;

  TTVOffCommand = class(TInterfacedObject, ICommand)
  private
    FTV: TTV;
  protected
    procedure Execute;
    procedure Undo;
  public
    constructor Create(TV: TTV);
  end;

implementation

{ TTV }

procedure TTV.SetChannel(Value: string);
begin
  Writeln('Channel ' + Value);
end;

procedure TTV.SwitchOff;
begin
  Writeln('Switching off TV');
end;

procedure TTV.SwitchOn;
begin
  Writeln('Switching on TV');
end;

{ TTVOnCommand }

constructor TTVOnCommand.Create(TV: TTV);
begin
  FTV := TV;
end;

procedure TTVOnCommand.Execute;
begin
  FTV.SwitchOn;
end;

procedure TTVOnCommand.Undo;
begin
  FTV.SwitchOff;
end;

{ TTVOffCommand }

constructor TTVOffCommand.Create(TV: TTV);
begin
  FTV := TV;
end;

procedure TTVOffCommand.Execute;
begin
  FTV.SwitchOff;
end;

procedure TTVOffCommand.Undo;
begin
  FTV.SwitchOn;
end;

end.
