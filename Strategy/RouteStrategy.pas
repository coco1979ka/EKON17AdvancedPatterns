unit RouteStrategy;

interface

uses
  Coordinates,
  SysUtils;

type
  IRouteStrategy = interface
    ['{249FA91B-3ECA-466E-9A81-4BB58D57F1B1}']
      function Calculate (AFrom, ATo : TCoordinates) : string;
  end;

implementation

end.
