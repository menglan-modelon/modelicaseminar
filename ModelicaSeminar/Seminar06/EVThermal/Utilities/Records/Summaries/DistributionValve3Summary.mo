within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries;
record DistributionValve3Summary "Summary record for valve models"
  extends .Modelon.Icons.Summary;

  Real u_valve_2 "Valve control signal for port 2" annotation(Dialog(group = "Parameters",tab = "General"));
  Real u_valve_3 "Valve control signal for port 3" annotation(Dialog(group = "Parameters",tab = "General"));
  Real u_valve_4 "Valve control signal for port 4" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelica.Units.SI.MassFlowRate m_flow_in "Mass flow rate into valve at port1" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_2 "Mass flow rate at port2" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_3 "Mass flow rate at port3" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_4 "Mass flow rate at port4" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelica.Units.SI.Pressure dp_12 "Pressure drop over the valve from port 1 to 2" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_13 "Pressure drop over the valve from port 1 to 3" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_14 "Pressure drop over the valve from port 1 to 4" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelon.Media.Units.Temperature T_intern "Internal liquid temperature at inlet" annotation(Dialog);

  .Modelica.Units.SI.MassFlowRate m_flow[3]={m_flow_2, m_flow_3, m_flow_4} "mass flow rate array at controlled ports";
  Real flow_fractions[3]=m_flow./m_flow_in "flow fractions";
end DistributionValve3Summary;
