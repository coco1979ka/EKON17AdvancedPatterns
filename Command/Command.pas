unit Command;

interface

type
  ICommand = interface
    ['{0C958002-D14F-49D3-A0F9-DCF4AA017E91}']
      procedure Execute();
      procedure Undo();
  end;

implementation

end.
