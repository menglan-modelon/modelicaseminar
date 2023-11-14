within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries;
record ThreeWayValve_4PortSummary "Summary record for valve models"
  extends .Modelon.Icons.Summary;
  replaceable package Medium =
        .LiquidCooling.Media.Water.IncompressibleWater
      constrainedby .Modelon.Media.Templates.CompressibleLiquid annotation(Dialog(enable = false, tab="Predefined", group="Automatically set from component, do not override"));
   Real u_valve_2 "Valve control signal for port 2" annotation(Dialog);
   Real u_valve_3 "Valve control signal for port 3" annotation(Dialog);
   Real u_valve_4 "Valve control signal for port 4" annotation(Dialog);

  .Modelica.Units.SI.MassFlowRate m_flow_2 "Mass flow rate at port2" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_3 "Mass flow rate at port3" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_4 "Mass flow rate at port4" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_out "Mass flow rate at outlet" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelica.Units.SI.Pressure dp_21 "Pressure drop over the valve from port 2 to 1" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_31 "Pressure drop over the valve from port 3 to 1" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_41 "Pressure drop over the valve from port 4 to 1" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelon.Media.Units.Temperature T_2 "Internal liquid temperature at port 2" annotation(Dialog);
  .Modelon.Media.Units.Temperature T_3 "Internal liquid temperature at port 3" annotation(Dialog);
  .Modelon.Media.Units.Temperature T_4 "Internal liquid temperature at port 4" annotation(Dialog);
  .Modelon.Media.Units.Temperature T_out = Medium.temperature(state_A) "Internal liquid temperature at outlet" annotation(Dialog);

  Medium.ThermodynamicState  state_A "Internal medium state in volume";

  .Modelica.Units.SI.MassFlowRate m_flow[3]={m_flow_2, m_flow_3, m_flow_4} "mass flow rate array at controlled ports";

end ThreeWayValve_4PortSummary;
