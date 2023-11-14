within ModelicaSeminar.Seminar05.CityLib.Interfaces;
model TwoPin
    .ModelicaSeminar.Seminar05.CityLib.Interfaces.Electricity electricity annotation(Placement(transformation(extent = {{-110.0,-10.0},{-90.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .ModelicaSeminar.Seminar05.CityLib.Interfaces.Electricity_n electricity_n annotation(Placement(transformation(extent = {{90.0,-10.0},{110.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Rectangle(extent={{-100,100},{100,-100}})}));
end TwoPin;
