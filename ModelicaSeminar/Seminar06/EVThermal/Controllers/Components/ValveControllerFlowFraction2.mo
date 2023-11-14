within ModelicaSeminar.Seminar06.EVThermal.Controllers.Components;
model ValveControllerFlowFraction2
  "valve controller for opening based on flow fractions, 2 signals"
  parameter Real opening_start[2]=fill(1/2,2) "initial values for opening commands";
  .Modelica.Blocks.Interfaces.RealOutput  opening[2]
    "Relative opening in the range 0-1, indices correspond to {valve1, valve2}"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  .Modelica.Blocks.Interfaces.RealInput flow_fractions[2]
    "sensed flow fractions"
    annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
  .Modelica.Blocks.Interfaces.RealInput flow_fractions_SP[2]
    "flow fractions setpoint"
    annotation (Placement(transformation(extent={{-130,20},{-90,60}})));
  .Modelica.Blocks.Continuous.LimPID PID1(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    yMax=1,
    yMin=0,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=opening_start[1])
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  .Modelica.Blocks.Continuous.LimPID PID2(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    yMax=1,
    yMin=0,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=opening_start[2])
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
equation
  connect(flow_fractions_SP[1], PID1.u_s) annotation (Line(points={{-110,35},{-76,
          35},{-76,30},{-42,30}},           color={0,0,127}));
  connect(flow_fractions[1], PID1.u_m) annotation (Line(points={{-110,-45},{-30,
          -45},{-30,18}},           color={0,0,127}));
  connect(flow_fractions_SP[2], PID2.u_s) annotation (Line(points={{-110,45},{-80,
          45},{-80,10},{-12,10}}, color={0,0,127}));
  connect(flow_fractions[2], PID2.u_m)
    annotation (Line(points={{-110,-35},{0,-35},{0,-2}}, color={0,0,127}));
  connect(PID1.y, opening[1]) annotation (Line(points={{-19,30},{80,30},{80,-5},
          {120,-5}},       color={0,0,127}));
  connect(PID2.y, opening[2]) annotation (Line(points={{11,10},{68,10},{68,5},{120,
          5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
          extent={{-100,34},{100,-26}},
          textColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ValveControllerFlowFraction2;
