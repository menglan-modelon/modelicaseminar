within ModelicaSeminar.Seminar03.Components;
model NonlinearSpringDamper3 "Linear 1D translational spring and damper in parallel"
  import      Modelica.Units.SI;  // MSL 4.0.0
  extends .Modelica.Mechanics.Translational.Interfaces.PartialCompliantWithRelativeStates;
  parameter .Modelica.Units.SI.TranslationalSpringConstant c(final min = 0, start = 1) "Spring constant";
  parameter .Modelica.Units.SI.TranslationalSpringConstant b(final min = 0, start = 1) "Spring constant for x^3";
  parameter .Modelica.Units.SI.TranslationalDampingConstant d(final min = 0, start = 1) "Damping constant";
  parameter .Modelica.Units.SI.Position s_rel0 = 0 "Unstretched spring length";
  extends .Modelica.Thermal.HeatTransfer.Interfaces.PartialElementaryConditionalHeatPortWithoutT;
protected
  .Modelica.Units.SI.Force f_c "Spring force";
  .Modelica.Units.SI.Force f_d "Damping force";
equation
  f_c = c*(s_rel - s_rel0) + b*(s_rel - s_rel0)^3;
  f_d = d*v_rel;
  f = f_c + f_d;
  lossPower = f_d*v_rel;
  annotation (
    Documentation(info = "<html>
    <p>
    A <i>spring and damper element connected in parallel</i>.
    The component can be
    connected either between two sliding masses to describe the elasticity
    and damping, or between a sliding mass and the housing (model Fixed),
    to describe a coupling of the sliding mass with the housing via a spring/damper.
    </p>
    </html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{-80, 40}, {-60, 40}, {-45, 10}, {-15, 70}, {15, 10}, {45, 70}, {60, 40}, {80, 40}}), Line(points = {{-80, 40}, {-80, -70}}), Line(points = {{-80, -70}, {-52, -70}}), Rectangle(fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-52, -49}, {38, -91}}), Line(points = {{-52, -49}, {68, -49}}), Line(points = {{-51, -91}, {69, -91}}), Line(points = {{38, -70}, {80, -70}}), Line(points = {{80, 40}, {80, -70}}), Line(points = {{-90, 0}, {-80, 0}}), Line(points = {{80, 0}, {90, 0}}), Polygon(lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{53, -18}, {23, -8}, {23, -28}, {53, -18}}), Line(points = {{-57, -18}, {23, -18}}), Text(lineColor = {0, 0, 255}, extent = {{-150, 120}, {150, 80}}, textString = "%name"), Text(extent = {{-150, -135}, {150, -165}}, textString = "d=%d"), Text(extent = {{-150, -100}, {150, -130}}, textString = "c=%c"), Line(visible = false, points = {{-100, -100}, {-100, -80}, {-5, -80}}, color = {191, 0, 0}, pattern = LinePattern.Dot), Text(origin = {17, 14}, fillColor = {255, 0, 0}, extent = {{-85, 66}, {49, -18}}, textString = "NONLINEAR", textStyle = {TextStyle.Bold})}),
    Diagram(coordinateSystem(initialScale = 0.1), graphics={  Line(points = {{-80, 32}, {-58, 32}, {-43, 2}, {-13, 62}, {17, 2}, {47, 62}, {62, 32}, {80, 32}}, thickness = 0.5), Line(points = {{-100, 31}, {-100, 96}}, color = {128, 128, 128}), Line(points = {{100, 29}, {100, 94}}, color = {128, 128, 128}), Line(points = {{-98, 82}, {100, 82}}, color = {128, 128, 128}), Polygon(lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, points = {{90, 85}, {100, 82}, {90, 79}, {90, 85}}), Text(lineColor = {0, 0, 255}, extent = {{-63, 83}, {46, 103}}, textString = "s_rel"), Rectangle(fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, extent = {{-52, -28}, {38, -72}}), Line(points = {{-51, -72}, {69, -72}}), Line(points = {{-52, -28}, {68, -28}}), Line(points = {{38, -50}, {80, -50}}), Line(points = {{-80, -50}, {-52, -50}}), Line(points = {{-80, 32}, {-80, -50}}), Line(points = {{80, 32}, {80, -50}}), Line(points = {{-90, 0}, {-80, 0}}), Line(points = {{90, 0}, {80, 0}}), Text(origin = {-3, 27}, extent = {{-43, 23}, {41, -17}}, textString = "nonlinear")}));
end NonlinearSpringDamper3;
