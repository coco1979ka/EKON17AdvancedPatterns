unit Macro;

interface

uses
  Generics.Collections,
  Command;

type
  TMacroCommand = class(TInterfacedObject, ICommand)
  private
    FCommands: TList<ICommand>;
  protected
    procedure Execute;
    procedure Undo;
  public
    constructor Create(Commands : TArray<ICommand>);
    destructor Destroy; override;
    procedure Add(Command : ICommand);

  end;

implementation

{ TMacroCommand }

procedure TMacroCommand.Add(Command: ICommand);
begin
  FCommands.Add(Command);
end;

constructor TMacroCommand.Create(Commands : TArray<ICommand>);
begin
  FCommands := TList<ICommand>.Create;
  FCommands.AddRange(Commands);
end;

destructor TMacroCommand.Destroy;
begin
  FCommands.Free;
  inherited;
end;

procedure TMacroCommand.Execute;
var
  Command: ICommand;
begin
  for Command in FCommands do
    Command.Execute;
end;

procedure TMacroCommand.Undo;
var
  I : Integer;
begin
  for I := FCommands.Count-1 downto 0 do
    FCommands[I].Undo;
end;

end.
