within ModelicaSeminar.Seminar01.Damper.Components;

model LinearSpringDamperForceInput
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 1,d = 0.1,s_rel0(fixed = true,start = 1) = 0,s_rel(start = 0)) annotation(Placement(transformation(extent = {{-11.333333333333334,-50.0},{8.666666666666666,-30.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Translational.Components.Mass mass(m = 1) annotation(Placement(transformation(extent = {{30.666666666666664,-50.0},{50.666666666666664,-30.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Translational.Sources.Force force annotation(Placement(transformation(extent = {{-11.0,-10.0},{9.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(transformation(extent = {{-49.333333333333336,-50.0},{-29.333333333333336,-30.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-124.09914570525794,-12.099145705257932},{-99.90085429474206,12.099145705257932}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(springDamper.flange_b,mass.flange_a) annotation(Line(points = {{8.666666666666666,-40},{30.666666666666668,-40}},color = {0,127,0}));
    connect(force.flange,mass.flange_a) annotation(Line(points = {{9,0},{20,0},{20,-40},{30.666666666666664,-40}},color = {0,127,0}));
    connect(fixed.flange,springDamper.flange_a) annotation(Line(points = {{-39.33333333333334,-40},{-11.333333333333334,-40}},color = {0,127,0}));
    connect(force.f,u) annotation(Line(points = {{-13,0},{-112,0}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Bitmap(fileName="modelica://ModelicaSeminar/Resources/input.png",origin={20,-62},extent={{-141,-112},{141,112}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="Linear Spring Damper",origin={8,-86})}));
end LinearSpringDamperForceInput;
