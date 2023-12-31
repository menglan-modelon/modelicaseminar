within ModelicaSeminar.Seminar03.Components;
block CosineVar2 "Generate cosine signal"

  import Modelica.Constants.pi;
  parameter .Modelica.Units.SI.Angle phase = 0 "Phase of cosine wave";
  Real derFreq;
  extends .Modelica.Blocks.Interfaces.SignalSource;
  .Modelica.Blocks.Interfaces.RealInput amp annotation (
    Placement(visible = true, transformation(origin = {-44, 102}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-44, 98}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  .Modelica.Blocks.Interfaces.RealInput freq annotation (
    Placement(visible = true, transformation(origin = {50, 100}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {52, 96}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  derFreq = der(freq);
  y = offset + (if time < startTime then 0 else amp*.Modelica.Math.cos(2*.Modelica.Constants.pi*(freq - 1/2*derFreq*(time - startTime))*(time - startTime) + phase));
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{68,0}}, color={192,192,192}),
        Polygon(
          points={{90,0},{68,8},{68,-8},{90,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,80},{-76.2,79.8},{-70.6,76.6},{-64.9,69.7},{-59.3,
              59.4},{-52.9,44.1},{-44.83,21.2},{-27.9,-30.8},{-20.7,-50.2},{-14.3,
              -64.2},{-8.7,-73.1},{-3,-78.4},{2.6,-80},{8.2,-77.6},{13.9,-71.5},
              {19.5,-61.9},{25.9,-47.2},{34,-24.8},{42,0}}, smooth=Smooth.Bezier),
        Text(
          extent={{-147,-152},{153,-112}},
          textString="f=%f"),
        Line(points={{42,1},{53.3,35.2},{60.5,54.1},{66.9,67.4},{72.6,75.6},{
              78.2,80.1},{83.8,80.8}})}),
    Documentation(info="<html>
  <p>
  The Real output y is a cosine signal:
  </p>
  
  <p>
  <img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Cosine.png\"
     alt=\"Cosine.png\">
  </p>
  </html>"));
end CosineVar2;
