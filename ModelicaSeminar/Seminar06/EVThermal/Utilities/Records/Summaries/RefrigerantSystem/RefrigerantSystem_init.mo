within ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem;
model RefrigerantSystem_init
  "Subcritical cycle initialization record for Front Evap only with IHX"
  extends .AirConditioning.ThermoFluidPro.Icons.InitData;
  replaceable package Medium = .AirConditioning.ThermoFluidPro.Media.Technical.R134a
    constrainedby .AirConditioning.ThermoFluidPro.Media.Interfaces.ExtendedPartialTwoPhaseMedium
    "Refrigerant medium" annotation (Dialog,choicesAllMatching);
  final parameter String mediumName=Medium.mediumName
    "Medium name for consistency check";
  parameter Integer initType(
    min=1,
    max=2) = 2 "Choice of initialization problem" annotation (
    Evaluate=true,
    choices(choice=1 "Fixed charge", choice=2 "Free charge"),
    Dialog,
    editText=false);
  parameter .Modelica.Units.SI.Density charge_init=400
    "Specific charge initialization point"
    annotation (Evaluate=false, Dialog(enable=initType == 1));
  // Experiment conditions
  // Refrigerant side initial conditions
  parameter .Modelica.Units.SI.TemperatureDifference T_sc=20
    "Subcooling temperature"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.TemperatureDifference T_sh=1
    "Superheating temperature"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));

  parameter .Modelica.Units.SI.Pressure p_high=2365000 "Discharge pressure"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.Pressure dp_high=50000 "Condenser pressure drop"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.Pressure p_suction=310000 "Suction pressure"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.Pressure dp_low=50000 "Evaporator pressure drop"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.Pressure dp_pipe=1000 "Pipe pressure drop"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.MassFlowRate mdot_init=0.091
    "Cycle mass flow rate"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.MassFlowRate mdot_batteryChill=0.0181
    "BatteryChiller mass flow rate"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  parameter .Modelica.Units.SI.MassFlowRate mdot_FrEvap=0.0438
    "FrEvap Ref mass flow rate"
    annotation (Evaluate=false, Dialog(group="Refrigerant side start values"));
  final parameter .Modelica.Units.SI.Temperature T_suction=Medium.dewTemperature(
       p=p_suction, X=Medium.fixedComposition) + T_sh "Suction temperature";
  final parameter .Modelica.Units.SI.Temperature T_cond_out=
      Medium.dewTemperature(p=p_high, X=Medium.fixedComposition) - T_sc
    "Outlet condenser temperature";
  final parameter .Modelica.Units.SI.SpecificEnthalpy h_suction=
      Medium.specificEnthalpy_dTX(
      Medium.dewDensity_TX(T_suction - T_sh, Medium.fixedComposition),
      T_suction,
      Medium.fixedComposition) "Suction enthalpy";
  final parameter .Modelica.Units.SI.SpecificEnthalpy h_cond_in=h_suction + (
      Medium.specificEnthalpy_psX(
      p_high,
      Medium.specificEntropy_dTX(
        Medium.dewDensity_TX(T_suction - T_sh, Medium.fixedComposition),
        T_suction,
        Medium.fixedComposition),
      Medium.fixedComposition) - h_suction)/0.7 "Inlet condenser enthalpy";
  final parameter .Modelica.Units.SI.SpecificEnthalpy h_cond_out=
      Medium.specificEnthalpy_dTX(
      Medium.bubbleDensity_TX(T_cond_out, Medium.fixedComposition),
      T_cond_out,
      Medium.fixedComposition) "Outlet condenser enthalpy";
  // Air side boundary conditions
  parameter .Modelica.Units.SI.Temperature TairCond=316
    "Condenser air temperature"
    annotation (Evaluate=false, Dialog(group="Air side boundary conditions"));
  parameter .Modelica.Units.SI.Temperature TairFrEvap=310
    "Front Evaporator air temperature"
    annotation (Evaluate=false, Dialog(group="Air side boundary conditions"));
  parameter .Modelica.Units.SI.Pressure p_in_coolant=110000
    "Coolant inlet pressure"
    annotation (Evaluate=false, Dialog(group="Coolant side start values"));
  parameter .Modelica.Units.SI.Pressure p_out_coolant=100000
    "Coolant outlet pressure"
    annotation (Evaluate=false, Dialog(group="Coolant side start values"));

  // Initial conditions
  parameter .Modelica.Units.SI.TemperatureDifference dT_air=15.0
    "Difference between wall temperature and bulk flow air temperature"
    annotation (Evaluate=false, Dialog(tab="Advanced", group="Initialization options"));
  parameter .Modelica.Units.SI.TemperatureDifference dT_ref=5.0
    "Difference between wall temperature and bulk flow refrigerant temperature"
    annotation (Evaluate=false, Dialog(tab="Advanced", group="Initialization options"));
  parameter Boolean steadyState=true
    "True if initialization is to be in steady state" annotation (Evaluate=true,
      Dialog(tab="Advanced", group="Initialization options"));
  parameter Boolean steadyPressure=true
    "True if initialization is in steady state only for pressures" annotation (
      Evaluate=true, Dialog(tab="Advanced", group="Initialization options"));

  parameter .Modelica.Units.SI.MassFlowRate mdot_base=0.039;
  parameter .Modelica.Units.SI.Pressure dp_Cond=2e07*mdot_init^2 + 723538*
      mdot_init + 65;
  parameter .Modelica.Units.SI.Pressure dp_IHX_inner=15301;
  parameter .Modelica.Units.SI.Pressure dp_IHX_outer=70595;
  parameter .Modelica.Units.SI.Pressure dp_Evap=4e7*mdot_init^2 + 322472*
      mdot_init + 65;
  parameter .Modelica.Units.SI.Pressure dp_CompOutPipe=1.5*mdot_init/mdot_base*0.18e5;
  parameter .Modelica.Units.SI.Pressure dp_Suction=p_suction + 0.25*dp_high*
      frontEvapOnOff;
  parameter .Modelica.Units.SI.Pressure dp_frntEvap_Suction=p_suction + (dp_Evap +
      0.25*dp_high)*frontEvapOnOff;
  parameter .Modelica.Units.SI.Pressure dp_CEXV=1.62*mdot_init/mdot_base*1e5;

  parameter .EVThermal.Utilities.Records.InitData.Choices.EvapBranches BranchesOnOff=.EVThermal.Utilities.Records.InitData.Choices.EvapBranches.TwoBrachesOn;
  final parameter Boolean frontEvapOnly=BranchesOnOff ==.EVThermal.Utilities.Records.InitData.Choices.EvapBranches.FrontEvapOnly
    "Cooling (AC) mode" annotation (Evaluate=true);
  final parameter Boolean batteryChillerOnly=BranchesOnOff ==.EVThermal.Utilities.Records.InitData.Choices.EvapBranches.BatteryChillerOnly
    "Heating mode" annotation (Evaluate=true);
  final parameter Boolean twoBrachesOn=BranchesOnOff ==.EVThermal.Utilities.Records.InitData.Choices.EvapBranches.TwoBrachesOn
    "Heating mode" annotation (Evaluate=true);

  final parameter Integer frontEvapOnOff=if frontEvapOnly or twoBrachesOn then 1
       else 0;
  final parameter Integer battChillerOnOff=if batteryChillerOnly or
      twoBrachesOn then 1 else 0;

  //Pressure start values assume one pipe each between compressor and condenser as well as compressor and evaporator each.

  .AirConditioning.ThermoFluidPro.InitConditions.HEXInitCoolantRef batteryChiller(
    mdot0=mdot_batteryChill*battChillerOnOff,
    h_in=h_cond_out,
    h_out=h_suction,
    p_in=p_suction + 0.25*dp_high + (dp_Evap)*battChillerOnOff,
    p_out=p_suction + 0.25*dp_high,
    p_in_coolant=p_in_coolant,
    p_out_coolant=p_out_coolant,
    steadyState=steadyState,
    steadyPressure=steadyPressure,
    condensing=false) "Battery Chiller init record for propagation";

  .AirConditioning.ThermoFluidPro.InitConditions.HEXInit CondInit(
    mdot0=mdot_init,
    h_in=h_cond_in,
    h_out=h_cond_out,
    p_in=p_high - dp_CompOutPipe - 2*dp_pipe,
    p_out=p_high - dp_CompOutPipe - 2*dp_pipe - dp_Cond,
    dT_air=dT_air,
    steadyState=steadyState,
    steadyPressure=steadyPressure,
    T_air0=TairCond,
    condensing=true) "Condenser init record for propagation";

  .AirConditioning.ThermoFluidPro.InitConditions.InternalHEXInit ihxInit(
    mdot0=mdot_init,
    pin_inner=p_suction + 0.25*dp_high + dp_IHX_inner,
    pout_inner=p_suction + 0.25*dp_high,
    hin_inner=h_suction,
    hout_inner=h_suction,
    pin_outer=p_high - dp_CompOutPipe - 2*dp_pipe - dp_Cond,
    pout_outer=p_high - dp_CompOutPipe - 2*dp_pipe - dp_Cond - dp_IHX_outer,
    hin_outer=h_cond_out,
    hout_outer=h_cond_out,
    steadyState=steadyState,
    steadyPressure=steadyPressure) "Internal IHX init record for propagation";

  .AirConditioning.ThermoFluidPro.InitConditions.HEXInit FrEvapInit(
    mdot0=mdot_FrEvap,
    h_in=h_cond_out,
    h_out=h_suction,
    p_in=p_suction + (dp_Evap + 0.25*dp_high)*frontEvapOnOff + dp_IHX_inner,
    p_out=p_suction + 0.25*dp_high*frontEvapOnOff + dp_IHX_inner,
    dT_air=dT_air,
    steadyState=steadyState,
    steadyPressure=steadyPressure,
    T_air0=TairFrEvap,
    condensing=false) "Front Evaporator init record for propagation";

  input .Modelica.Units.SI.Pressure p_receiver "receiver pressure"
    annotation (Dialog(tab="Advanced", group="Propagated variables"));
  input .Modelica.Units.SI.Mass M_receiver "receiver refrigerant mass"
    annotation (Dialog(tab="Advanced", group="Propagated variables"));
  input .Modelica.Units.SI.Volume V_receiver "receiver refrigerant volume"
    annotation (Dialog(tab="Advanced", group="Propagated variables"));
  input .Modelica.Units.SI.Volume V_ref "cycle total refrigerant volume"
    annotation (Dialog(tab="Advanced", group="Propagated variables"));
  input .Modelica.Units.SI.Density charge "cycle total refrigerant charge"
    annotation (Dialog(tab="Advanced", group="Propagated variables"));
  .Modelica.Units.SI.Energy U_corrected
    "receiver internal energy (corrected charge)";
  .Modelica.Units.SI.Mass M_corrected "receiver total mass (corrected charge)";
  parameter .Modelica.Units.SI.SpecificEnthalpy h_receiver(start=h_suction - 150e3,
      fixed=not initType == 1) "Receiver specific enthalpy (used in reinit)"
    annotation (Dialog(
      tab="Advanced",
      group="Propagated variables",
      label="h start value"));
  parameter Real Kv=3600*mdot_init*sqrt(1e5)/(N6*Y*sqrt((p_high - p_suction)*
      rho_discharge)) "initial valve opening for CEXV";
  parameter Real Kv_chillerEXV=if battChillerOnOff == 0 then 0.005 else 0.03
    "initial valve opening for chiller EXV";
  parameter Real charge_init_factor=0.92
    "factor (0-1) to control amount of charge in large volume components downstream of condenser, increase for less mass in receiver"
    annotation (Evaluate=false);
protected
  constant Real N6=31.6;
  constant Real FGamma=1.3/1.4;
  parameter Real xt=0.87;
  parameter Real Y=1 - (x/(3*FGamma*xt)) "auxiliary variable";
  parameter Real x=(p_high - p_suction)/p_high;
  parameter Real rho_discharge=Medium.density_phX(
      p_high,
      Medium.specificEnthalpy_pTX(
        p_high,
        T_high,
        Medium.fixedComposition),
      Medium.fixedComposition);
  parameter .Modelica.Units.SI.Temperature T_high=Medium.dewTemperature(p=p_high,
      X=Medium.fixedComposition) - T_sc;

  parameter .Modelica.Units.SI.Density d_rec(start=1000, fixed=not initType == 1)
    "initial receiver refrigerant density";
  parameter .Modelica.Units.SI.Temperature T_rec(start=320, fixed=not initType ==
        1) "initial receiver refrigerant temperature";
initial equation
  if initType == 1 then
    d_rec = Medium.density_phX(
      p_receiver,
      h_receiver,
      Medium.fixedComposition);
    T_rec = Medium.temperature_phX(
      p_receiver,
      h_receiver,
      Medium.fixedComposition);
    d_rec = (M_receiver - V_ref*(charge - charge_init))/V_receiver;
  end if;
equation
  U_corrected = V_receiver*(h_receiver*d_rec - p_receiver);
  M_corrected = V_receiver*d_rec;

  annotation (Icon(graphics={
        Text(
          extent={{-100,94},{0,54}},
          lineColor={0,0,0},
          textString="charge"),
        Text(
          extent={{-100,46},{0,6}},
          lineColor={0,0,0},
          textString="p_high"),
        Text(
          extent={{-100,-4},{0,-44}},
          lineColor={0,0,0},
          textString="p_low"),
        Text(
          extent={{-100,-56},{0,-96}},
          lineColor={0,0,0},
          textString="mdot")}), Documentation(info="<html>
<h4>CycleInit</h4>
This is an initialization model, intended to be used in the <a href=\"AirConditioning.Cycles.VapourCycle\">VapourCycle</a> or similar
cycle models to set initial conditions and allow charge initialization.
 
<h4>Usage</h4>
<p>A copy of this model should be placed in the cycle, and the corresponding
values for refrigerant and air side boundary conditions set. The outputs from this
model are the records <a href=\".AirConditioning.ThermoFluidPro.InitConditions.HEXInit\">condInit</a> and <a href=\".AirConditioning.ThermoFluidPro.InitConditions.HEXInit\">evapInit</a> to propagate to the condenser and
evaporator models; <code>h_receiver</code> for charge initialization and air side parameters to
be used in the cycle source models.
</p>
<p> See <a href=\"AirConditioning.SubComponents.Records.InitData.Information\">
Information</a> and the cycle example
<a href=\"AirConditioning.Templates.VapourCycle\">VapourCycle</a> for more
details.
</html>", revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"));
end RefrigerantSystem_init;
