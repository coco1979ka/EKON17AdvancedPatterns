program CommandPattern;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Command in 'Command.pas',
  Remote in 'Remote.pas',
  Lights in 'Lights.pas',
  DVDPlayer in 'DVDPlayer.pas',
  TV in 'TV.pas',
  Macro in 'Macro.pas';

var
  Light: TLight;
  DVDPlayer: TDVDPlayer;
  RemoteControl: TRemoteControl;
  TV : TTV;

  StartCommands: TArray<ICommand>;
  StopCommands: TArray<ICommand>;
  StartHomeCinemaCommand: ICommand;
  StopHomeCinemaCommand: ICommand;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    RemoteControl := TRemoteControl.Create;
    Light := TLight.Create;
    DVDPlayer := TDVDPlayer.Create;
    TV := TTV.Create;

    try
      RemoteControl.SetOnCommand(0, TLightOnCommand.Create(Light));
      RemoteControl.SetOffCommand(0, TLightOffCommand.Create(Light));

      RemoteControl.SetOnCommand(1, TDVDPlayerPlayCommand.Create(DVDPlayer));
      RemoteControl.SetOffCommand(1, TDVDPlayerStopCommand.Create(DVDPlayer));

      RemoteControl.SetOnCommand(2, TTVOnCommand.Create(TV));
      RemoteControl.SetOffCommand(2, TTVOffCommand.Create(TV));

      // Home Cinema Macro
      SetLength(StartCommands, 3);
      StartCommands[0] := TLightOffCommand.Create(Light);
      StartCommands[1] := TTVOnCommand.Create(TV);
      StartCommands[2] := TDVDPlayerPlayCommand.Create(DVDPlayer);
      StartHomeCinemaCommand := TMacroCommand.Create(StartCommands);

      SetLength(StopCommands, 3);
      StopCommands[0] := TDVDPlayerStopCommand.Create(DVDPlayer);
      StopCommands[1] := TTVOffCommand.Create(TV);
      StopCommands[2] := TLightOnCommand.Create(Light);

      StartHomeCinemaCommand := TMacroCommand.Create(StartCommands);
      StopHomeCinemaCommand := TMacroCommand.Create(StopCommands);

      RemoteControl.SetOnCommand(3, StartHomeCinemaCommand);
      RemoteControl.SetOffCommand(3, StopHomeCinemaCommand);

//      RemoteControl.SwitchOn(0);
//      RemoteControl.SwitchOn(1);
//      RemoteControl.SwitchOn(2);
      RemoteControl.SwitchOn(3);


      RemoteControl.Undo;
//      RemoteControl.Undo;
      //RemoteControl.SwitchOff(3);

      Readln;
    finally
      RemoteControl.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
