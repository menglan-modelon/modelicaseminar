within ModelicaSeminar.Seminar04.AirLib;

  package Sources "Sources model of dryer"
    extends Modelica.Icons.SourcesPackage;

    model AirInlet "Air inlet model"
      .ModelicaSeminar.Seminar04.AirLib.Interfaces.AirPort_b port_b annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      parameter .Modelica.Units.SI.Pressure p_atmosphire = 1000 "Atmosphire pressure [Pa]";
    equation
      port_b.p = p_atmosphire;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Line(points = {{2, 0}, {100, 0}}, color = {0, 0, 255}), Ellipse(extent = {{-56, 58}, {58, -56}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 128, 255}), Text(extent = {{-60, 82}, {64, 56}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 128, 255}, textString = "Atmosphire")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end AirInlet;

    model AirOutlet "Air outlet model"
      .ModelicaSeminar.Seminar04.AirLib.Interfaces.AirPort_a port_a annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      parameter .Modelica.Units.SI.Pressure p_atmosphire = 1000 "Atmosphire pressure [Pa]";
    equation
      port_a.p = p_atmosphire;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false), graphics = {Line(points = {{-100, 0}, {-2, 0}}, color = {0, 0, 255}), Ellipse(extent = {{-56, 58}, {58, -56}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 128, 255}), Text(extent = {{-60, 82}, {64, 56}}, lineColor = {0, 0, 255}, fillPattern = FillPattern.Sphere, fillColor = {0, 128, 255}, textString = "Atmosphire")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end AirOutlet;
  end Sources;
