within ModelicaSeminar.Seminar02.Examples;

  model LowPassFilter
    extends ModelicaSeminar.Icons.TextExample;
parameter Real T=1;
  Real u=2, y(start=1);
  equation
  T*der(y) + y = u;
  end LowPassFilter;
