unit SomeService;

interface

type
  ISomeService = interface
  ['{E84A5BEE-2D4B-450F-B7EE-F0E863F80955}']
    procedure AddItem(Value : string);
    function  GetItems : TArray<string>;
    procedure RemoveItem(ItemIndex : Integer);
    property  Items : TArray<string> read GetItems;
  end;

implementation

end.
