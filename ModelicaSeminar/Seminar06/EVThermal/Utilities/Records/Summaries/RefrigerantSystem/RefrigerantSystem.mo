within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem;

record RefrigerantSystem "Summary data for standard air conditioning cycle"
  extends .Modelon.Icons.Summary;

  // Capacity
  .Modelica.Units.NonSI.AngularVelocity_rpm compressor_speed
    "Compressor speed in rpm";
  .Modelica.Units.SI.Power P_front_evaporator "Front evaporator power in Watts";
  .Modelica.Units.SI.Power P_battery_chiller "Battery chiller power in Watts";
  .Modelica.Units.SI.Power P_compressor "Compressor power in Watts";
  .Modelica.Units.SI.Power P_condenser "Condenser power in Watts";

  //Refrigerant Circuit
  .Modelica.Units.SI.Pressure p_Cmp_Out "compressor discharge pressure";
  .Modelica.Units.SI.Pressure p_Cond_In "Condenser refrigerant inlet pressure";
  .Modelica.Units.SI.Pressure p_Cond_Out "Condenser refrigerant outlet pressure";
  .Modelica.Units.SI.Pressure p_FTXV_In "FTXV refrigerant inlet pressure";
  .Modelica.Units.SI.Pressure p_BTXV_In "BTXV refrigerant inlet pressure";
  .Modelica.Units.SI.Pressure p_FTXV_Out "FTXV refrigerant outlet pressure";
  .Modelica.Units.SI.Pressure p_BTXV_Out "BTXV refrigerant outlet pressure";
  .Modelica.Units.SI.Pressure p_fEvap_In
    "front evaporator refrigerant inlet pressure";
  .Modelica.Units.SI.Pressure p_BChill_In
    "battery chiller refrigerant inlet pressure";
  .Modelica.Units.SI.Pressure p_fEvap_Out
    "front evaporator refrigerant outlet pressure";
  .Modelica.Units.SI.Pressure p_BChill_Out
    "battery chiller refrigerant outlet pressure";
  .Modelica.Units.SI.Pressure p_Cmp_In "compressor suction pressure in ";

  .Modelica.Units.NonSI.Temperature_degC T_Cmp_Out
    "compressor discharge temperature";
  .Modelica.Units.NonSI.Temperature_degC T_Cond_In "Condenser inlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_Cond_Out
    "Condenser outlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_FTXV_In "FTXV inlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_BTXV_In "BTXV inlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_FTXV_Out "FTXV outlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_BTXV_Out "BTXV outlet temperature";
  .Modelica.Units.NonSI.Temperature_degC T_fEvap_In
    "refrigerant inlet temperature at front evap";
  .Modelica.Units.NonSI.Temperature_degC T_BChill_In
    "refrigerant inlet temperature at battery chiller";
  .Modelica.Units.NonSI.Temperature_degC T_fEvap_Out
    "refrigerant outlet temperature at front evap";
  .Modelica.Units.NonSI.Temperature_degC T_BChill_Out
    "refrigerant outlet temperature at battery chiller";
  //Modelica.SIunits.Conversions.NonSIunits.Temperature_degC T_VI_In "refrigerant temperature at vapor injection";
  .Modelica.Units.NonSI.Temperature_degC T_Cmp_In
    "compressor suction temperature";

  .Modelica.Units.SI.SpecificEnthalpy h_Cmp_Out(displayUnit="kJ/kg")
    "refrigerant enthalpy at compressor outlet in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_Cond_In(displayUnit="kJ/kg")
    "Condenser inlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_Cond_Out(displayUnit="kJ/kg")
    "Condenser outlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_FTXV_In(displayUnit="kJ/kg")
    "FTXV inlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_BTXV_In(displayUnit="kJ/kg")
    "BTXV inlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_FTXV_Out(displayUnit="kJ/kg")
    "FTXV outlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_BTXV_Out(displayUnit="kJ/kg")
    "BTXV outlet enthalpy in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_fEvap_In(displayUnit="kJ/kg")
    "refrigerant enthalpy at front evap inlet in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_BChill_In(displayUnit="kJ/kg")
    "refrigerant enthalpy at battery chiller inlet in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_fEvap_Out(displayUnit="kJ/kg")
    "refrigerant enthalpy at front evap outlet in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_BChill_Out(displayUnit="kJ/kg")
    "refrigerant enthalpy at battery chiller outlet in kJ/kg";
  .Modelica.Units.SI.SpecificEnthalpy h_Cmp_In(displayUnit="kJ/kg")
    "refrigerant enthalpy at compressor inlet in kJ/kg";

  //Condenser
  .Modelica.Units.SI.MassFlowRate Cond_airFlow "Condenser air flow in kg/s";
  .Modelica.Units.NonSI.Temperature_degC Cond_AirIn_T
    "Condenser inlet air temperature";
  .Modelica.Units.NonSI.Temperature_degC Cond_AirOut_T
    "Condenser outlet air temperature";

  //Evap Air
  Real fEvap_AirFlow "front evaporator air flow";
  .Modelica.Units.NonSI.Temperature_degC fEvap_AirIn_T
    "Front evaporator air inlet Temperature";
  Real fEvap_AirIn_RH(
    quantity="RelativeHumidity",
    unit="1",
    displayUnit="%") "Front evaporator air inlet relative humidity";
  .Modelica.Units.SI.SpecificEnthalpy fEvap_AirIn_H(displayUnit="kJ/kg")
    "Front evaporator air inlet enthaply";
  .Modelica.Units.NonSI.Temperature_degC fEvap_Air_OutT
    "Front evaporator air outlet Temperature";
  Real fEvap_AirOut_RH(
    quantity="RelativeHumidity",
    unit="1",
    displayUnit="%") "Front evaporator air outlet relative humidity";
  .Modelica.Units.SI.SpecificEnthalpy fEvap_AirOut_H(displayUnit="kJ/kg")
    "Front evaporator air outlet enthaply";

  //Chiller
  .Modelica.Units.NonSI.Temperature_degC BChill_CoolIn_T
    "coolant inlet temperature at battery chiller ";
  .Modelica.Units.NonSI.Temperature_degC BChill_CoolOut_T
    "coolant outlet temperature at battery chiller";
  .Modelica.Units.SI.VolumeFlowRate BChill_CoolFlow(displayUnit="l/min")
    "coolant flow at battery chiller in LPM";

  //Subcool/Superheat
  .Modelica.Units.SI.TemperatureDifference Subcooling
    "Condenser subcooling temperature";
  .Modelica.Units.SI.TemperatureDifference frontEvapSuperheat
    "superheat temperature front evaporator";
  .Modelica.Units.SI.TemperatureDifference batteryChillerSuperheat
    "superheat temperature battery chiller";

  //Refrigerant Massflows
  .Modelica.Units.SI.MassFlowRate mdot "mass flow rate at compressor outlet ";
  .Modelica.Units.SI.MassFlowRate mdot_frontEvap "mass flow rate at front evap";
  .Modelica.Units.SI.MassFlowRate mdot_batChiller
    "mass flow rate at battery chiller";

  //Pressure drop
  .Modelica.Units.SI.Pressure dp_cond "condenser/GC pressure drop"
    annotation (Dialog);
  .Modelica.Units.SI.Pressure dp_frontEvap "condenser/GC pressure drop"
    annotation (Dialog);
  .Modelica.Units.SI.Pressure dp_batteryChiller "evaporator pressure drop"
    annotation (Dialog);
  Real Kv_FTXV "FTXV flow coefficient in [m^3/h]" annotation (Dialog);
  Real Kv_ChillerEXV "Chiller EXV) flow coefficient in [m^3/h]"
    annotation (Dialog);
  final .Modelica.Units.SI.Density SpecificCharge=M_ref/V_ref
    "specific cycle charge";
  .Modelica.Units.SI.Mass M_ref "total refrigerant mass in cycle"
    annotation (Dialog);
  .Modelica.Units.SI.Volume V_ref "total refrigerant volume of cycle"
    annotation (Dialog);

  annotation (Documentation(info="<html>
</html>", revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end RefrigerantSystem;
