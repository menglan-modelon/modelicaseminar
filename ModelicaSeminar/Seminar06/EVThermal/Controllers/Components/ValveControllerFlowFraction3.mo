within ModelicaSeminar.Seminar06.EVThermal.Controllers.Components;
model ValveControllerFlowFraction3
  "valve controller for opening based on flow fractions, 3 signals"
  parameter Real opening_start[3]=fill(1/3,3) "initial values for opening commands";
  .Modelica.Blocks.Interfaces.RealOutput  opening[3]
    "Relative opening in the range 0-1, indices correspond to {valve1, valve2, valve3}"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));
  .Modelica.Blocks.Interfaces.RealInput flow_fractions[3]
    "sensed flow fractions"
    annotation (Placement(transformation(extent={{-130,-60},{-90,-20}})));
  .Modelica.Blocks.Interfaces.RealInput flow_fractions_SP[3]
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
  .Modelica.Blocks.Continuous.LimPID PID3(
    controllerType=.Modelica.Blocks.Types.SimpleController.PI,
    yMax=1,
    yMin=0,
    initType=.Modelica.Blocks.Types.Init.InitialOutput,
    y_start=opening_start[3])
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
equation
  connect(flow_fractions_SP[1], PID1.u_s) annotation (Line(points={{-110,
          33.3333},{-76,33.3333},{-76,30},{-42,30}},
                                            color={0,0,127}));
  connect(flow_fractions[1], PID1.u_m) annotation (Line(points={{-110,-46.6667},
          {-30,-46.6667},{-30,18}}, color={0,0,127}));
  connect(flow_fractions_SP[2], PID2.u_s) annotation (Line(points={{-110,40},{-80,
          40},{-80,10},{-12,10}}, color={0,0,127}));
  connect(flow_fractions[2], PID2.u_m)
    annotation (Line(points={{-110,-40},{0,-40},{0,-2}}, color={0,0,127}));
  connect(flow_fractions_SP[3], PID3.u_s) annotation (Line(points={{-110,
          46.6667},{-84,46.6667},{-84,-10},{18,-10}},
                                             color={0,0,127}));
  connect(flow_fractions[3], PID3.u_m) annotation (Line(points={{-110,-33.3333},
          {30,-33.3333},{30,-22}}, color={0,0,127}));
  connect(PID1.y, opening[1]) annotation (Line(points={{-19,30},{80,30},{80,-6.66667},
          {120,-6.66667}}, color={0,0,127}));
  connect(PID2.y, opening[2]) annotation (Line(points={{11,10},{68,10},{68,0},{120,
          0}}, color={0,0,127}));
  connect(PID3.y, opening[3]) annotation (Line(points={{41,-10},{66,-10},{66,6.66667},
          {120,6.66667}}, color={0,0,127}));
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
end ValveControllerFlowFraction3;
