within ModelicaSeminar.Seminar01.Damper;

model LinearSpringDamper
    extends Modelica.Icons.Example;
    .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(transformation(extent = {{-76.0,-10.0},{-56.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 1,d = 0.1,s_rel0(fixed = true,start = 1) = 0,s_rel(start = 1)) annotation(Placement(transformation(extent = {{-12.0,-10.0},{8.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Translational.Components.Mass mass(m = 1) annotation(Placement(transformation(extent = {{52.0,-10.0},{72.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(fixed.flange,springDamper.flange_a) annotation(Line(points = {{-66,0},{-12,0}},color = {0,127,0}));
    connect(springDamper.flange_b,mass.flange_a) annotation(Line(points = {{8,0},{52,0}},color = {0,127,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end LinearSpringDamper;
