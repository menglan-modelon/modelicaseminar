within ModelicaSeminar.Seminar04.AirLib;

  package Components "Components models of dryer"
    extends Modelica.Icons.VariantsPackage;
    model StaticAirPipe "Air pipe with constant resistance"
      extends .ModelicaSeminar.Seminar04.AirLib.Interfaces.PartialTwoAirPorts;
      parameter Real R "Total resistant coefficient of air pipe";
    equation
      dp = R * q * abs(q);
      annotation(
        Diagram(graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255})}),
        Icon(graphics = {Text(extent = {{-152, 87}, {148, 47}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-144, -40}, {142, -72}}, lineColor = {0, 0, 0}, textString = "R=%R"), Rectangle(extent = {{-62, 30}, {78, -30}}, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-88, 0}, {-62, 0}}, color = {0, 0, 255}), Line(points = {{78, 0}, {104, 0}}, color = {0, 0, 255})}));
    end StaticAirPipe;

    model StaticAirPipe2 "Air pipe with constant resistance and physical parameters"
      extends .ModelicaSeminar.Seminar04.AirLib.Interfaces.PartialTwoAirPorts;
      parameter Real gzai = 1 "Resistant coefficient of air pipe";
      parameter .Modelica.Units.SI.Density rho = 1e-3 "Air density [kg/m^3]";
      parameter .Modelica.Units.SI.Area area = 1 "Area of pipe [m^2]";
    equation
      dp = 1 / 2 * gzai * (q / area) *noEvent(abs(q / area)) * rho;
      annotation(
        Diagram(graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {96, 0}}, color = {0, 0, 255})}),
        Icon(graphics = {Text(extent = {{-152, 87}, {148, 47}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-144, -40}, {142, -72}}, lineColor = {0, 0, 0}, textString = "R=%R"), Rectangle(extent = {{-62, 30}, {78, -30}}, lineColor = {0, 0, 255}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-88, 0}, {-62, 0}}, color = {0, 0, 255}), Line(points = {{78, 0}, {104, 0}}, color = {0, 0, 255})}));
    end StaticAirPipe2;
  end Components;
