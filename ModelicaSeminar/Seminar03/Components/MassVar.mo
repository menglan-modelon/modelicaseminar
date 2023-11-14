within ModelicaSeminar.Seminar03.Components;
model MassVar "Sliding mass with inertia"
 // import      Modelica.Units.SI;  // MSL 4.0.0
  parameter .Modelica.Units.SI.Mass m0(min = 0, start = 1) "Initial mass of the sliding mass";
  parameter StateSelect stateSelect = StateSelect.default "Priority to use s and v as states" annotation (
    Dialog(tab = "Advanced"));
  extends .Modelica.Mechanics.Translational.Interfaces.PartialRigid(L = 0, s(start = 0, stateSelect = stateSelect));
  .Modelica.Units.SI.Velocity v(start = 0, stateSelect = stateSelect) "Absolute velocity of component";
  .Modelica.Units.SI.Acceleration a(start = 0) "Absolute acceleration of component";
  .Modelica.Blocks.Interfaces.RealInput mass annotation (
    Placement(visible = true, transformation(origin = {0, 98}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {4, 94}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  v = der(s);
  a = der(v);
  (m0 + mass) * a = flange_a.f + flange_b.f;
  annotation (
    Documentation(info = "<html>
    <p>
    Sliding mass with <em>inertia, without friction</em> and two rigidly connected flanges.
    </p>
    <p>
    The sliding mass has the length L, the position coordinate s is in the middle.
    Sign convention: A positive force at flange flange_a moves the sliding mass in the positive direction.
    A negative force at flange flange_a moves the sliding mass to the negative direction.
    </p>
    
    </html>"),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-100, 0}, {100, 0}}, color = {0, 127, 0}), Rectangle(lineColor = {0, 127, 0}, fillColor = {160, 215, 160}, fillPattern = FillPattern.Sphere, extent = {{-55, -30}, {56, 30}}), Polygon(lineColor = {95, 127, 95}, fillColor = {95, 127, 95}, fillPattern = FillPattern.Solid, points = {{50, -90}, {20, -80}, {20, -100}, {50, -90}}), Line(points = {{-60, -90}, {20, -90}}, color = {95, 127, 95}), Text(lineColor = {0, 0, 255}, fillColor = {110, 210, 110}, fillPattern = FillPattern.Solid, extent = {{-150, 85}, {150, 45}}, textString = "%name"), Text(fillColor = {110, 221, 110}, fillPattern = FillPattern.Solid, extent = {{-150, -45}, {150, -75}}, textString = "m=%m")}),
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics={  Line(points = {{-100, 0}, {-55, 0}}, color = {0, 127, 0}), Line(points = {{55, 0}, {100, 0}}, color = {0, 127, 0}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-55, -30}, {55, 30}}), Polygon(lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{50, -90}, {20, -80}, {20, -100}, {50, -90}}), Line(points = {{-60, -90}, {20, -90}}), Line(points = {{-100, -29}, {-100, -61}}), Line(points = {{100, -61}, {100, -28}}), Line(points = {{-98, -60}, {98, -60}}), Polygon(fillPattern = FillPattern.Solid, points = {{-101, -60}, {-96, -59}, {-96, -61}, {-101, -60}}), Polygon(fillPattern = FillPattern.Solid, points = {{100, -60}, {95, -61}, {95, -59}, {100, -60}}), Text(lineColor = {0, 0, 255}, extent = {{-44, -41}, {51, -57}}, textString = "Length L"), Line(points = {{0, 30}, {0, 53}}), Line(points = {{-72, 40}, {1, 40}}), Polygon(fillPattern = FillPattern.Solid, points = {{-7, 42}, {-7, 38}, {-1, 40}, {-7, 42}}), Text(lineColor = {0, 0, 255}, extent = {{-61, 53}, {-9, 42}}, textString = "Position s")}));
end MassVar;
