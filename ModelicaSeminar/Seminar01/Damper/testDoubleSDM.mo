within ModelicaSeminar.Seminar01.Damper;

model testDoubleSDM
    extends Modelica.Icons.Example;
    .ModelicaSeminar.Seminar01.Damper.DoubleSpringDamper sys1 annotation(Placement(transformation(extent = {{-70.0,60.0},{-50.0,80.0}},origin = {0.0,0.0},rotation = 0.0)));
    .ModelicaSeminar.Seminar01.Damper.DoubleSpringDamper sys2(x2Start = -1) annotation(Placement(transformation(extent = {{-70.0,20.0},{-50.0,40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .ModelicaSeminar.Seminar01.Damper.DoubleSpringDamper sys3(k2 = 10) annotation(Placement(transformation(extent = {{-70.0,-20.0},{-50.0,0.0}},origin = {0.0,0.0},rotation = 0.0)));
    .ModelicaSeminar.Seminar01.Damper.DoubleSpringDamper sys4(k2 = 10,x2Start = -1) annotation(Placement(transformation(extent = {{-70.0,-60.0},{-50.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end testDoubleSDM;
