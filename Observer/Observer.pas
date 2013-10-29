unit Observer;

interface

type
  IObserver = interface
    ['{5E6E1E3D-4F35-433F-904A-E5CFC1639209}']
    procedure Update;
  end;

  ISubject = interface
    ['{6F890D49-764C-4883-AB26-4E569C777311}']
    procedure Attach(Observer: IObserver);
    procedure Detach(Observer: IObserver);
    procedure Notify;
  end;

implementation

end.
