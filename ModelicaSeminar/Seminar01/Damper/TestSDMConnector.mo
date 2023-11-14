within ModelicaSeminar.Seminar01.Damper;

model TestSDMConnector
    extends Modelica.Icons.Example;
    .ModelicaSeminar.Seminar01.Damper.Components.LinearSpringDamperConnector linearSpringDamperConnector annotation(Placement(transformation(extent = {{0.6120418233846436,-33.387958176615356},{47.387958176615356,13.387958176615356}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(f = 1) annotation(Placement(transformation(extent = {{-60.0,-20.0},{-40.0,0.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(sine.y,linearSpringDamperConnector.f_ext) annotation(Line(points = {{-39,-10},{-3.130031484873811,-10}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end TestSDMConnector;
