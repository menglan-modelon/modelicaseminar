within ModelicaSeminar.Seminar01.Damper;

model TestSDM
    extends Modelica.Icons.Example;
    .ModelicaSeminar.Seminar01.Damper.Components.LinearSpringDamperForceInput linearSpringDamperForceInput annotation(Placement(transformation(extent = {{-11.109420617966116,-31.109420617966123},{51.109420617966116,31.109420617966123}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(f = 1) annotation(Placement(transformation(extent = {{-68.0,-10.0},{-48.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(sine.y,linearSpringDamperForceInput.u) annotation(Line(points = {{-47,0},{-14.53145688594239,0}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end TestSDM;
