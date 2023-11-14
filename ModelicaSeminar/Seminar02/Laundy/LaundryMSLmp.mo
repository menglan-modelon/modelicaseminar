within ModelicaSeminar.Seminar02.Laundy;
  
  model LaundryMSLmp
    extends .Modelica.Icons.Example;
    .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
      Placement(visible = true, transformation(origin = {0, 94}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation(
      Placement(visible = true, transformation(origin = {0, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Mass mass(m = 30) annotation(
      Placement(visible = true, transformation(origin = {0, 16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.Spring spring(c = 3000) annotation(
      Placement(visible = true, transformation(origin = {26, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 4000, d = 3000) annotation(
      Placement(visible = true, transformation(origin = {-34, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 8000, d = 1000) annotation(
      Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1e6, d = 1e4) annotation(
      Placement(visible = true, transformation(origin = {0, -78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    .Modelica.Mechanics.Translational.Sources.Force force annotation(
      Placement(visible = true, transformation(origin = {-30, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Blocks.Sources.Cosine cosine(amplitude = 1, f = 20) annotation(
      Placement(visible = true, transformation(origin = {-70, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    .Modelica.Mechanics.Translational.Components.Mass mp(m = 0.1)  annotation(
      Placement(visible = true, transformation(origin = {0, -48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  equation
    connect(fixed.flange, springDamper.flange_a) annotation(
      Line(points = {{0, 94}, {0, 80}, {-34, 80}, {-34, 66}}, color = {0, 127, 0}));
    connect(fixed.flange, spring.flange_a) annotation(
      Line(points = {{0, 94}, {0, 80}, {26, 80}, {26, 66}}, color = {0, 127, 0}));
    connect(springDamper.flange_b, mass.flange_a) annotation(
      Line(points = {{-34, 46}, {-34, 38}, {0, 38}, {0, 26}}, color = {0, 127, 0}));
    connect(spring.flange_b, mass.flange_a) annotation(
      Line(points = {{26, 46}, {26, 38}, {0, 38}, {0, 26}}, color = {0, 127, 0}));
    connect(mass.flange_b, springDamper1.flange_a) annotation(
      Line(points = {{0, 6}, {0, -10}}, color = {0, 127, 0}));
    connect(force.flange, mass.flange_b) annotation(
      Line(points = {{-20, -2}, {0, -2}, {0, 6}}, color = {0, 127, 0}));
    connect(cosine.y, force.f) annotation(
      Line(points = {{-59, -2}, {-43, -2}}, color = {0, 0, 127}));
  connect(springDamper1.flange_b, mp.flange_a) annotation(
      Line(points = {{0, -30}, {0, -38}}, color = {0, 127, 0}));
  connect(mp.flange_b, springDamper2.flange_a) annotation(
      Line(points = {{0, -58}, {0, -68}}, color = {0, 127, 0}));
  connect(springDamper2.flange_b, fixed1.flange) annotation(
      Line(points = {{0, -88}, {0, -96}}, color = {0, 127, 0}));
  end LaundryMSLmp;
