within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries;

record DiverterValveSummary "Summary record for valve models"
  extends .Modelon.Icons.Summary;
   Real u_valve "Valve control signal" annotation(Dialog);

  .Modelica.Units.SI.MassFlowRate m_flow_in "Mass flow rate into valve at portA" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_2 "Mass flow rate at portB" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.MassFlowRate m_flow_3 "Mass flow rate at portC" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelica.Units.SI.Pressure dp_12 "Pressure drop over the valve from port A to B" annotation(Dialog(group = "Parameters",tab = "General"));
  .Modelica.Units.SI.Pressure dp_13 "Pressure drop over the valve from port A to C" annotation(Dialog(group = "Parameters",tab = "General"));

  .Modelon.Media.Units.Temperature T_intern "Internal liquid temperature at inlet" annotation(Dialog);
end DiverterValveSummary;
