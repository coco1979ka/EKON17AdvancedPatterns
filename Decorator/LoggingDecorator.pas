unit LoggingDecorator;

interface

uses
  StdCtrls,
  SomeService;

type
  TLoggingDecorator = class(TInterfacedObject, ISomeService)
  private
    FMemo: TMemo;
    FService: ISomeService;
  protected
    procedure AddItem(Value: string);
    procedure RemoveItem(ItemIndex: Integer);
    function GetItems: System.TArray<System.string>;
  public
    constructor Create(Service: ISomeService; Memo: TMemo);
  end;

implementation

uses
  SysUtils;

{ TLoggingDecorator }

procedure TLoggingDecorator.AddItem(Value: string);
begin
  FMemo.Lines.Add('Adding ' + Value);
  FService.AddItem(Value);
end;

constructor TLoggingDecorator.Create(Service: ISomeService; Memo: TMemo);
begin
  if not Assigned(Memo) then
    raise EArgumentException.Create('Memo must not be nil');
  if not Assigned(Service) then
    raise EArgumentException.Create('Service must not be nil');
  FMemo := Memo;
  FService := Service;
end;

function TLoggingDecorator.GetItems: System.TArray<System.string>;
begin
  Result := FService.Items;
end;

procedure TLoggingDecorator.RemoveItem(ItemIndex: Integer);
begin
  FMemo.Lines.Add('Removing Position ' + IntToStr(ItemIndex));
  FService.RemoveItem(ItemIndex);
end;

end.
