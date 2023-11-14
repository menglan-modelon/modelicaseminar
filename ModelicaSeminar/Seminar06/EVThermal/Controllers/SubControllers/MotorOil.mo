within ModelicaSeminar.Seminar06.EVThermal.Controllers.SubControllers;
model MotorOil
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller;
  .Modelica.Blocks.Routing.RealPassThrough oil_flow_set    annotation (Placement(transformation(extent={{55.0,3.0},{63.0,11.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Routing.RealPassThrough Q_motor_set    annotation (Placement(transformation(extent={{55.0,-11.0},{63.0,-3.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.RealExpression realExpression(y=mdot_oil_motor)    annotation (Placement(transformation(extent={{15.0,-3.0},{35.0,17.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelica.Blocks.Sources.RealExpression realExpression1(y=Q_motor)    annotation (Placement(transformation(extent={{15.0,-17.0},{35.0,3.0}},rotation = 0.0,origin = {0.0,0.0})));
    parameter .Modelica.Units.SI.MassFlowRate mdot_oil_motor = 0.001 "Mass flow rate of oil";
    parameter .Modelica.Units.SI.HeatFlowRate Q_motor = 100 "Traction motor heat flow";
equation
    connect(realExpression.y,oil_flow_set.u) annotation(Line(points = {{36,7},{54.2,7}},color = {0,0,127}));
    connect(realExpression1.y,Q_motor_set.u) annotation(Line(points = {{36,-7},{54.2,-7}},color = {0,0,127}));
  connect(oil_flow_set.y, controlBus.mdot_oil_motor) annotation (Line(points={{63.4,7},
          {80,7},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(Q_motor_set.y, controlBus.Q_motor) annotation (Line(points={{63.4,-7},
          {80,-7},{80,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
end MotorOil;
