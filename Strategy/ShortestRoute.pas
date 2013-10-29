unit ShortestRoute;

interface

uses
  Coordinates,
  RouteStrategy;

type
  TShortestRoute = class (TInterfacedObject, IRouteStrategy)
  protected
    function Calculate(AFrom: TCoordinates; ATo: TCoordinates): string;
  end;

implementation

{ TShortestRoute }

function TShortestRoute.Calculate(AFrom, ATo: TCoordinates): string;
begin
  Result := 'Über A57 und A46';
end;

end.
