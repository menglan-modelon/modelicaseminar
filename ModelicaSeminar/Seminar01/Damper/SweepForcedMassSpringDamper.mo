within ModelicaSeminar.Seminar01.Damper;

model SweepForcedMassSpringDamper
    extends Modelica.Icons.Example;
  .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 10000, d = 1, s_rel(fixed = true, start = 0), stateSelect = StateSelect.prefer) annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-10.25747454811604,-40.25747454811604},{30.25747454811604,0.2574745481160434}}, rotation = 0.0)));
  .Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, s(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{59.755421658370224,-40.244578341629776},{100.24457834162978,0.24457834162977576}}, rotation = 0.0)));
  .Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{4.615042345828069,22.615042345828073},{39.38495765417193,57.38495765417193}}, rotation = 0.0)));
  .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-81.81471097262397,-61.81471097262396},{-38.18528902737604,-18.185289027376037}}, rotation = 0.0)));
  .Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = 10) annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-90.0,10.0},{-70.0,30.0}}, rotation = 0.0)));
  .Modelica.Blocks.Sources.CosineVariableFrequencyAndAmplitude sweepedCosine  annotation(
    Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-40.0,30.0},{-20.0,50.0}}, rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant const(k = 1e5) annotation(Placement(transformation(extent = {{-89.37677053824362,50.0},{-70.62322946175638,70.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
  connect(springDamper1.flange_b, mass1.flange_a) annotation(
    Line(points = {{30.25747454811604,-20},{59.755421658370224,-20}}, color = {0, 127, 0}));
  connect(fixed.flange, springDamper1.flange_a) annotation(
    Line(points = {{-60,-40},{-60,-20},{-10.25747454811604,-20}}, color = {0, 127, 0}));
  connect(force.flange, mass1.flange_a) annotation(
    Line(points = {{39.38495765417193,39.99999999999999},{59.755421658370224,39.99999999999999},{59.755421658370224,-20}}, color = {0, 127, 0}));
  connect(sweepedCosine.y, force.f) annotation(
    Line(points = {{-19,39.99999999999999},{1.138050814993683,39.99999999999999}}, color = {0, 0, 127}));
    connect(ramp.y,sweepedCosine.f) annotation(Line(points = {{-69,20},{-60,20},{-60,34},{-42,34}},color = {0,0,127}));
    connect(const.y,sweepedCosine.amplitude) annotation(Line(points = {{-69.68555240793202,60},{-60,60},{-60,46},{-42,46}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end SweepForcedMassSpringDamper;
