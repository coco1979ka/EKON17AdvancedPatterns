unit ServiceImpl;

interface

uses
  Classes,
  SomeService;

type
  TSomeService = class (TInterfacedObject, ISomeService)
  private
    FItems : TStringList;
  protected
    procedure AddItem(Value: string);
    function  GetItems : TArray<string>;
    procedure RemoveItem(ItemIndex: Integer);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSomeService }

procedure TSomeService.AddItem(Value: string);
begin
  FItems.Add(Value);
end;

constructor TSomeService.Create;
begin
  FItems := TStringList.Create;
end;

destructor TSomeService.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TSomeService.GetItems: TArray<string>;
begin
  Result := FItems.ToStringArray;
end;

procedure TSomeService.RemoveItem(ItemIndex: Integer);
begin
  if (FItems.Count = 0) then Exit;
  if (ItemIndex>=0) and (ItemIndex<FItems.Count) then
    FItems.Delete(ItemIndex);
end;

end.
