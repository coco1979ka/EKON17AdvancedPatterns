unit SomeService;

interface

type
  TSomeService = class
    private
      FDefect : Boolean;
    public
      procedure DoSomething;
      procedure SetDefect;
      procedure SetActive;
  end;

implementation

uses
  SysUtils,
  Dialogs;

{ TSomeService }

procedure TSomeService.DoSomething;
begin
  if FDefect then
    raise Exception.Create('No response!');
  ShowMessage('Success!');
end;

procedure TSomeService.SetActive;
begin
  FDefect := False;
end;

procedure TSomeService.SetDefect;
begin
  FDefect := True;
end;

end.
