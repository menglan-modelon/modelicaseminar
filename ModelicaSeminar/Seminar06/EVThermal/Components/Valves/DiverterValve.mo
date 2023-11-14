within ModelicaSeminar.Seminar06.EVThermal.Components.Valves;
model DiverterValve "diverter valve model"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort
                                             portA(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{-110,-10},{-90,10}}),
                                       iconTransformation(extent={{-110,-10},{
            -90,10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort
                                           portC(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{90,30},{110,50}}),iconTransformation(extent={{90,30},{110,50}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort
                                           portB(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{90,-50},{110,-30}}),
                                     iconTransformation(extent={{90,-50},{110,
            -30}})));
  .LiquidCooling.Valves.Generic.ControlValve_ThreePort thermostaticValve(
      redeclare package Medium = Medium,
    T_start=T_start,
    Kv_Main=2,
    Kv_Bypass=2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  .Modelica.Blocks.Interfaces.RealInput u_main    "RElative opening of main valve [0-1]" annotation (Placement(transformation(
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90.0,
        origin={0.0,106.0}), iconTransformation(
        extent={{-15,-15},{15,15}},
        rotation=270,
        origin={1,101})));
  parameter .Modelon.Media.Units.Temperature T_start=310.15    "Initial temperature";
  parameter Real minOpening_visualization=1e-3 "min opening for visualization" annotation(Dialog(tab="Visualization"));
    .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.DiverterValveSummary summary(
    u_valve = thermostaticValve.summary.s,
    m_flow_in = portA.m_flow,
    m_flow_2 = portB.m_flow,
    m_flow_3 = portC.m_flow,
    dp_12 = thermostaticValve.summary.dp_Main,
    dp_13 = thermostaticValve.summary.dp_Bypass,
    T_intern = thermostaticValve.summary.T) annotation(Placement(transformation(extent = {{0.0,-76.0},{20.0,-56.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
  connect(thermostaticValve.portA, portA)    annotation (Line(points={{-10,0},{-100,0}}, color={0,0,255}));
  connect(thermostaticValve.u_main, u_main) annotation (Line(points={{0,10},{0,106}}, color={0,0,127}));
  connect(thermostaticValve.portB, portB) annotation (Line(points={{10,4},{40,4},
          {40,-40},{100,-40}}, color={0,0,255}));
  connect(thermostaticValve.portC, portC) annotation (Line(points={{10,-6},{28,
          -6},{28,40},{100,40}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Ellipse(extent={{-100,100},{100,-100}},lineColor={28,108,200}),Line(points={{-90,0},{100,40}},color={28,108,200},pattern=LinePattern.Dash),Line(points={{-90,0},{100,-40}},color={28,108,200}),Line(points={{-88,0},{90,-38}},color={255,0,0},thickness=5,visible=false),Line(points={{-88,2},{90,38}},color={0,140,72},thickness=5,visible=false),Text(textString="%name",extent={{-87,56},{87,-56}},origin={-2,-84})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DiverterValve;
