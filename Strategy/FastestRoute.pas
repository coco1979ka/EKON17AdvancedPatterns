unit FastestRoute;

interface

uses
  Coordinates,
  RouteStrategy;

type
  TFastestRoute = class (TInterfacedObject, IRouteStrategy)
  protected
    function Calculate(AFrom: TCoordinates; ATo: TCoordinates): string;
  end;

implementation

{ TFastestRoute }

function TFastestRoute.Calculate(AFrom, ATo: TCoordinates): string;
begin
  Result := 'Von Köln HBF nach Düsseldorf HBF mit dem ICE 234';
end;

end.
