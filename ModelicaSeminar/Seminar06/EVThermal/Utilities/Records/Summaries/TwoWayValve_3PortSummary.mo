within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries;

record TwoWayValve_3PortSummary "Summary record for valve models"
  extends .Modelon.Icons.Summary;
  Real u_valve[2] "Valve control signal" annotation(Dialog);

  .Modelica.Units.SI.MassFlowRate m_flow_in_2 "Mass flow rate at portB" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_in_3 "Mass flow rate at portC" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_out "Mass flow rate out of valve at portA" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelica.Units.SI.Pressure dp_21 "Pressure drop over the valve from port B to A" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_31 "Pressure drop over the valve from port C to A" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelon.Media.Units.Temperature T_2 "Liquid temperature at inlet portB" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelon.Media.Units.Temperature T_3 "Liquid temperature at inlet portC" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelon.Media.Units.Temperature T_outlet "Liquid temperature at outlet portA" annotation(Dialog);
end TwoWayValve_3PortSummary;
