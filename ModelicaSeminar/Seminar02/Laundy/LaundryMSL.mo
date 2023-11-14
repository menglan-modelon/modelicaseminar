within ModelicaSeminar.Seminar02.Laundy;
  
  model LaundryMSL
    extends .Modelica.Icons.Example;
  
    .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
      Placement(visible = true, transformation(origin = {0, 94}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
      Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Mass mass(m = 30) annotation(
      Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.Spring spring(c = 3000) annotation(
      Placement(visible = true, transformation(origin = {26, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 4000, d = 3000) annotation(
      Placement(visible = true, transformation(origin = {-34, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 8000, d = 1000) annotation(
      Placement(visible = true, transformation(origin = {0, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1e6, d = 1e4) annotation(
      Placement(visible = true, transformation(origin = {0, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Sources.Force force annotation(
      Placement(visible = true, transformation(origin = {-30, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Blocks.Sources.Cosine cosine(amplitude = 1, f = 20) annotation(
      Placement(visible = true, transformation(origin = {-70, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(fixed.flange, springDamper.flange_a) annotation(
      Line(points = {{0, 94}, {0, 80}, {-34, 80}, {-34, 66}}, color = {0, 127, 0}));
    connect(fixed.flange, spring.flange_a) annotation(
      Line(points = {{0, 94}, {0, 80}, {26, 80}, {26, 66}}, color = {0, 127, 0}));
    connect(springDamper.flange_b, mass.flange_a) annotation(
      Line(points = {{-34, 46}, {-34, 38}, {0, 38}, {0, 12}}, color = {0, 127, 0}));
    connect(spring.flange_b, mass.flange_a) annotation(
      Line(points = {{26, 46}, {26, 38}, {0, 38}, {0, 12}}, color = {0, 127, 0}));
    connect(mass.flange_b, springDamper1.flange_a) annotation(
      Line(points = {{0, -8}, {0, -24}}, color = {0, 127, 0}));
    connect(springDamper1.flange_b, springDamper2.flange_a) annotation(
      Line(points = {{0, -44}, {0, -56}}, color = {0, 127, 0}));
    connect(force.flange, mass.flange_b) annotation(
      Line(points = {{-20, -16}, {0, -16}, {0, -8}}, color = {0, 127, 0}));
    connect(cosine.y, force.f) annotation(
      Line(points = {{-58, -16}, {-42, -16}}, color = {0, 0, 127}));
  connect(springDamper2.flange_b, fixed1.flange) annotation(
      Line(points = {{0, -76}, {0, -96}}, color = {0, 127, 0}));
  end LaundryMSL;
