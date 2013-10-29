unit Remote;

interface

uses
  Generics.Collections,
  Command;

type
  TRemoteControl = class
  private
    FOnCommands: array [0 .. 4] of ICommand;
    FOffCommands: array [0 .. 4] of ICommand;
    FLastCommand: ICommand;
    procedure Invoke(Command: ICommand);
  public
    procedure SetOnCommand(Slot: Integer; Command: ICommand);
    procedure SetOffCommand(Slot: Integer; Command: ICommand);

    procedure SwitchOn(Slot: Integer);
    procedure SwitchOff(Slot: Integer);
    procedure Undo;

  end;

implementation

{ TRemoteControl }

procedure TRemoteControl.Invoke(Command: ICommand);
begin
  if Assigned(Command) then
  begin
    Command.Execute;
    FLastCommand := Command;
  end;
end;

procedure TRemoteControl.SetOffCommand(Slot: Integer; Command: ICommand);
begin
  if (Slot >= Low(FOffCommands)) and (Slot <= High(FOffCommands)) then
    FOffCommands[Slot] := Command;
end;

procedure TRemoteControl.SetOnCommand(Slot: Integer; Command: ICommand);
begin
  if (Slot >= Low(FOnCommands)) and (Slot <= High(FOnCommands)) then
    FOnCommands[Slot] := Command;
end;

procedure TRemoteControl.SwitchOff(Slot: Integer);
begin
  Invoke(FOffCommands[Slot]);
end;

procedure TRemoteControl.SwitchOn(Slot: Integer);
begin
  Invoke(FOnCommands[Slot]);
end;

procedure TRemoteControl.Undo;
begin
  if Assigned(FLastCommand) then
    begin
    FLastCommand.Undo;
    FLastCommand := nil;
    end
  else
    begin
    Writeln('Nothing to undo');
    end;
end;

end.
