unit DVDPlayer;

interface

uses
  Command;

type
  TDVDPlayer = class
  private
    FIsOn, FIsPlaying: Boolean;
  public
    procedure SwitchOn;
    procedure Play;
    procedure Stop;
    procedure SwitchOff;
  end;

  TDVDPlayerPlayCommand = class(TInterfacedObject, ICommand)
  private
    FDVDPlayer: TDVDPlayer;
  protected
    procedure Execute;
    procedure Undo;
  public
    constructor Create(DVDPlayer: TDVDPlayer);
  end;

  TDVDPlayerStopCommand = class (TInterfacedObject, ICommand)
  private
    FDVDPlayer: TDVDPlayer;
  protected
    procedure Execute;
    procedure Undo;
  public
    constructor Create(DVDPlayer: TDVDPlayer);
  end;

implementation

{ TDVDPlayer }

procedure TDVDPlayer.Play;
begin
  Writeln('Play Movie');
end;

procedure TDVDPlayer.Stop;
begin
  Writeln('Stop Playing');
end;

procedure TDVDPlayer.SwitchOff;
begin
  Writeln('Switch off DVD Player');
end;

procedure TDVDPlayer.SwitchOn;
begin
  Writeln('Switch on DVD Player');
end;

{ TDVDPlayerPlayCommand }

constructor TDVDPlayerPlayCommand.Create(DVDPlayer: TDVDPlayer);
begin
  FDVDPlayer := DVDPlayer;
end;

procedure TDVDPlayerPlayCommand.Execute;
begin
  FDVDPlayer.SwitchOn;
  FDVDPlayer.Play;
end;

procedure TDVDPlayerPlayCommand.Undo;
begin
  FDVDPlayer.Stop;
  FDVDPlayer.SwitchOff;
end;

{ TDVDPlayerStopCommand }

constructor TDVDPlayerStopCommand.Create(DVDPlayer: TDVDPlayer);
begin
  FDVDPlayer := DVDPlayer;
end;

procedure TDVDPlayerStopCommand.Execute;
begin
  FDVDPlayer.Stop;
  FDVDPlayer.SwitchOff;
end;

procedure TDVDPlayerStopCommand.Undo;
begin
  FDVDPlayer.SwitchOn;
  FDVDPlayer.Play;
end;

end.
