unit NullRoute;

interface

uses
  Coordinates,
  RouteStrategy;

type
  TNullRoute = class (TInterfacedObject, IRouteStrategy)
  protected
    function Calculate(AFrom: TCoordinates; ATo: TCoordinates) : string;
  end;

implementation

{ TNullRoute }

function TNullRoute.Calculate(AFrom, ATo: TCoordinates): string;
begin
Result := 'Wer will schon nach Düsseldorf?';
end;

end.
