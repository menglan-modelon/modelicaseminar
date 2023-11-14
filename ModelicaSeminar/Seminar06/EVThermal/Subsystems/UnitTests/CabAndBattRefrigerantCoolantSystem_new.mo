within ModelicaSeminar.Seminar06.EVThermal.Subsystems.UnitTests;

model CabAndBattRefrigerantCoolantSystem_new
  "Simple cabin and battery connected to a refrigerant and coolant system"
  extends .Modelon.Icons.Experiment;
  parameter .Modelon.Media.Units.Temperature T_coolant_start=306.15
    "Initial coolant temperature";
  parameter .Modelon.Media.Units.Temperature T_battery_start=318.15
    "Initial battery temperature";
  .AirConditioning.AirHandling.SimpleCabin simpleCabin(
    n_Passenger=4,
    P_passenger=80,
    init(
      p0=1.1e5,
      mdot0=airInit.mdotEvap,
      T0=airInit.TairEvap,
      phi0=airInit.phiEvap),
    redeclare package Medium = .ThermoFluidPro.Media.Air.NoncondensingAir,
    V=2.8,
    C=(simpleCabin.P_evaporator/simpleCabin.deltaT)*simpleCabin.timeConstant*0.2,
    deltaT=40,
    Tm=318.15) annotation (Placement(transformation(extent={{14,-6},{38,18}},
          rotation=0)));

  .AirConditioning.AirHandling.AirDuct airDuct(
    p_nom=120000,
    T_nom=320,
    analyticInverseTfromh=false,
    dp_nom=500,
    d_nom=1.2,
    mdot_nom=airInit.mdotEvap,
    init(
      p0=1.2e5,
      T0=airInit.TairEvap,
      mdot0=airInit.mdotEvap,
      phi0=airInit.phiEvap),
    redeclare package Medium = .ThermoFluidPro.Media.Air.NoncondensingAir)
    annotation (Placement(transformation(extent={{-12,-4},{8,16}},     rotation=
           0)));
  .Modelica.Blocks.Sources.Ramp valveOpening(
    duration=10,
    height=1,
    offset=0.01,
    startTime=1e6) annotation (Placement(transformation(
        origin={48,34},
        extent={{-6,6},{6,-6}},
        rotation=270)));
  .AirConditioning.AirHandling.ByPassValve byPassValve(
    T_nom_a=310,
    p_nom_a=98000,
    dp_nom_a=1000,
    T_nom_rec=310,
    p_nom_rec=98000,
    dp_nom_rec=1000,
    maxOpening=0.99,
    minOpening=0.01,
    mdot_nom_a=0.0944,
    mdot_nom_rec=0.0944,
    T_ambient=310,
    phi_ambient=0.6,
    init(
      mdot0=airInit.mdotEvap,
      T0=airInit.TairEvap,
      phi0=airInit.phiEvap,
      p0=97700),
    redeclare package Medium = .ThermoFluidPro.Media.Air.NoncondensingAir,
    frictionLoss_a1(b(h_outflow(start=1e5))),
    analyticInverseTfromh=false) annotation (Placement(transformation(extent={{44,-4},
            {64,16}},       rotation=0)));
  .AirConditioning.Reservoirs.HeatFlow.Heat1Dim heat1Dim(P0=1947, paraOption=true)
    annotation (Placement(transformation(extent={{16,24},{36,44}},     rotation=
           0)));

  replaceable package LCLCoolantMedium =
      .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50 constrainedby
    .Modelon.Media.Templates.CompressibleLiquid "Fluid medium model" annotation (
     choicesAllMatching);

  .AirConditioning.AirHandling.IdealFan blower(
    redeclare package Medium = .ThermoFluidPro.Media.Air.NoncondensingAir,
    init(
      p0=0.99e5,
      T0=airInit.TairEvap,
      phi0=airInit.phiEvap,
      mdot0=airInit.mdotEvap),
    analyticInverseTfromh=false,
    m_flow=airInit.mdotEvap,
    V_tot=0.001) annotation (Placement(transformation(extent={{70,-4},{90,16}},
          rotation=0)));
  .Modelica.Blocks.Sources.Constant AirMassFlow(k=airInit.mdotEvap) annotation (
      Placement(transformation(
        origin={80,34},
        extent={{-6,6},{6,-6}},
        rotation=270)));
  .AirConditioning.Visualizers.RealValue valueP_evap(precision=0, number=summary.P_cabin_cooling)
                                                    annotation (Placement(
        transformation(extent={{58,-76},{84,-56}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueCOP(precision=1, number=summary.COP)
    annotation (Placement(transformation(extent={{58,-52},{84,-32}},   rotation=
           0)));
  .AirConditioning.Visualizers.RealValue valueCondensate(precision=1, number=
        refrigerantLoop.refrigerantSystem.waterAccumulator.M*1000) annotation (Placement(
        transformation(extent={{-40,80},{-14,100}}, rotation=0)));
  .AirConditioning.SubComponents.Records.InitData.AirInit airInit(
    mdotCond=0.5,
    TairEvap=331.65,
    TairCond=313.15,
    mdotEvap=0.5)            annotation (Placement(transformation(extent={{-164.0,94.0},{-144.0,114.0}},       rotation=0.0,origin = {0.0,0.0})));
  .AirConditioning.Visualizers.RealValue valueTcabin(precision=1, number=summary.T_cabin)
    annotation (Placement(transformation(extent={{-8,-76},{18,-56}},
          rotation=0)));
  .AirConditioning.Visualizers.RealValue valueAirflow(number=summary.air_flow,
                                                     precision=2)
    annotation (Placement(transformation(extent={{58,-30},{84,-10}},  rotation=0)));
  .AirConditioning.Visualizers.RealValue valueTout(precision=1, number=summary.T_air_evap_outlet)
                                        annotation (Placement(transformation(
          extent={{-8,-52},{18,-32}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueTin(precision=1, number=summary.T_air_evap_inlet)
                                               annotation (Placement(
        transformation(extent={{-8,-30},{18,-10}},rotation=0)));
  .AirConditioning.Visualizers.RealValue valueTime(precision=1, number=time)
    annotation (Placement(transformation(extent={{-40,110},{-14,130}},
                                                                   rotation=0)));

  .IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Systems.BatteryCoolantLoop batteryLoop(redeclare package Medium =
        LCLCoolantMedium, T_start=T_coolant_start) annotation (Placement(
        transformation(
        extent={{18,18},{-18,-18}},
        rotation=180,
        origin={-54,0})));
  .AirConditioning.Visualizers.RealValue valueTbattery(precision=1, number=
        summary.T_battery)
    annotation (Placement(transformation(extent={{-8,-100},{18,-80}}, rotation=
            0)));
  .AirConditioning.Visualizers.RealValue valueP_battery_chiller(precision=0, number=
        summary.P_battery_cooling)                      annotation (Placement(
        transformation(extent={{58,-100},{84,-80}},rotation=0)));
  .EVThermal.Controllers.RefrigerantSystem.System systemController(
    Ti=20,
    yInit=50,
    yMax=100,
    dTbatt_hysteresis_high=0.5,
    dTbatt_hysteresis_low=0.5,
    dTEvap_hysteresis_high=5,
    dTEvap_hysteresis_low=5,
    id_battery=batteryPack.id)
    annotation (Placement(transformation(extent={{-136.0,0.0},{-104.0,32.0}},rotation = 0.0,origin = {0.0,0.0})));
    .EVThermal.Subsystems.RefrigerantSystem_EvaporatorChiller refrigerantLoop annotation(Placement(transformation(extent = {{-86.0,82.0},{-106.0,102.0}},origin = {0.0,0.0},rotation = 0.0)));

public
  .Modelica.Blocks.Sources.Constant        cabinQ(k=1947)
    annotation (Placement(transformation(extent={{-5,25},{6,36}},      rotation=
           0)));
  .Electrification.Batteries.Examples.Nominal batteryPack(
    display_name=true,
    vNom=345,
    specify_energy=true,
    energyNom=295200000,
    specify_losses=.Electrification.Batteries.Utilities.Types.SpecLosses.Heat,
    heatNom(displayUnit="W") = 1400,
    fixed_temperature=false,
    ns=96,
    np=2,
    SOC_start=0.7,
    redeclare replaceable .Electrification.Batteries.Thermal.Examples.Lumped
      thermal(T0=T_battery_start, C=320e3),
    redeclare .Electrification.Batteries.Control.CellSensors controller)
    annotation (Placement(transformation(extent={{-68,-92},{-40,-64}})));
  .Electrification.Loads.Examples.Current electricLoad(
    display_name=true,
    redeclare replaceable .Electrification.Loads.Electrical.Ideal electrical,
    controller(
      external_current=true,
      vMax=1e6,
      vMin=0,
      iMaxIn=1e6,
      iMaxOut=1e6,
      pMaxIn=1000000000,
      pMaxOut=1000000000))
    annotation (Placement(transformation(extent={{-106,-92},{-134,-64}})));
  .IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Components.BatteryLiquidCooling batteryCooling(redeclare package Medium =
        LCLCoolantMedium, T_start=T_coolant_start)
    annotation (Placement(transformation(extent={{-68,-58},{-40,-30}})));
  .Electrification.Loads.Control.Signals.i_ref   i_ref
    annotation (Placement(transformation(extent={{-140,-56},{-132,-48}})));
  .IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Components.BatteryCurrent loadCurrent
    annotation (Placement(transformation(extent={{-172,-60},{-156,-44}})));
  .IndustryExamples.Automotive.ThermalManagement.CabinAndBatteryRefrigerantCoolantSystem.Records.Summary.System summary(
    T_coolant=.Modelica.Units.Conversions.to_degC(batteryLoop.expansionVolume.volume.T),
    T_battery=.Modelica.Units.Conversions.to_degC(batteryPack.summary.T_cell_max),
    T_cabin=.Modelica.Units.Conversions.to_degC(simpleCabin.cabinVolume.T),
    //T_air_evap_inlet=refrigerantLoop.summary.fEvap_AirIn_T,
    //T_air_evap_outlet=refrigerantLoop.evapAir_outT.y,
    T_air_condenser_inlet=.Modelica.Units.Conversions.to_degC(refrigerantLoop.refrigerantSystem.Cond_tair.y),
    i_battery=loadCurrent.y,
    P_battery_loss=batteryPack.summary.p_loss_cells,
    //P_battery_cooling=refrigerantLoop.summary.P_battery_chiller,
    //P_cabin_cooling=refrigerantLoop.summary.P_front_evaporator,
    P_cabin_solar=cabinQ.y,
    //COP=(refrigerantLoop.summary.P_front_evaporator + refrigerantLoop.summary.P_battery_chiller)
      //  /max(1e-5, refrigerantLoop.summary.P_compressor),
    //air_flow=blower.a.m_flow,
    RH_cabin=simpleCabin.cabinVolume.medium.phi,
    coolant_flow=batteryLoop.setFlowRate.setFlowRate.portA.m_flow)
    annotation (Placement(transformation(extent={{-74,112},{-54,132}})));

equation
  connect(valveOpening.y, byPassValve.opening) annotation (Line(
      points={{48,27.4},{48,16.4}},
      color={0,0,127},
      thickness=0.5));
  connect(heat1Dim.q, simpleCabin.q)
    annotation (Line(points={{26,25.2},{26,16.8}},     color={255,0,0}));
  connect(airDuct.b, simpleCabin.a) annotation (Line(
      points={{8,6},{14,6}},
      color={0,127,255},
      thickness=0.5));
  connect(byPassValve.b, blower.a) annotation (Line(
      points={{64,6},{70,6}},
      color={0,127,255},
      thickness=0.5));
  connect(AirMassFlow.y, blower.massFlow) annotation (Line(
      points={{80,27.4},{80,14}},
      color={0,0,127},
      thickness=0.5));
  connect(simpleCabin.b, byPassValve.a) annotation (Line(
      points={{38,6},{44,6}},
      color={0,127,255},
      thickness=0.5));
  connect(cabinQ.y, heat1Dim.inp) annotation (Line(points={{6.55,30.5},{12.675,
          30.5},{12.675,27},{17,27}},      color={0,0,127}));
  connect(batteryPack.plug_a, electricLoad.plug_a) annotation (Line(
      points={{-68,-78},{-106,-78}},
      color={255,128,0},
      thickness=0.5));
  connect(batteryLoop.controlBus, systemController.controlBus) annotation (Line(
      points={{-72,2.22045e-15},{-96,2.22045e-15},{-96,16},{-104,16}},
      color={255,204,51},
      thickness=0.5));
  connect(systemController.controlBus, batteryPack.controlBus) annotation (Line(
      points={{-104,16},{-96,16},{-96,-64},{-65.2,-64}},
      color={255,204,51},
      thickness=0.5));
  connect(batteryCooling.coolantIn, batteryLoop.batteryCoolantOut) annotation (
      Line(points={{-68,-44},{-76,-44},{-76,-24},{-64.8,-24},{-64.8,-18}},
        color={0,0,255}));
  connect(batteryCooling.battery, batteryPack.thermalPort)
    annotation (Line(points={{-54,-58},{-54,-64}}, color={191,0,0}));
  connect(loadCurrent.y, i_ref.u_r)
    annotation (Line(points={{-155.2,-52},{-142,-52}}, color={0,0,127}));
  connect(i_ref.systemBus, electricLoad.controlBus) annotation (Line(
      points={{-132,-52},{-108.8,-52},{-108.8,-64}},
      color={240,170,40},
      pattern=LinePattern.Dot,
      thickness=0.5));
  connect(batteryCooling.coolantOut, batteryLoop.batteryCoolantIn) annotation (
      Line(points={{-40,-44},{-32,-44},{-32,-24},{-43.2,-24},{-43.2,-18}},
        color={0,0,255}));
    connect(blower.b,refrigerantLoop.evaporatorIn) annotation(Line(points = {{90,6},{96,6},{96,50},{-86,50},{-86,87}},color = {85,170,255}));
    connect(refrigerantLoop.evaporatorOut,airDuct.a) annotation(Line(points = {{-106,87},{-112,87},{-112,44},{-12,44},{-12,6}},color = {85,170,255}));
    connect(systemController.controlBus,refrigerantLoop.controlBus) annotation(Line(points = {{-104,16},{-80,16},{-80,107.8},{-96,107.8},{-96,101.8}},color = {255,204,51}));
    connect(refrigerantLoop.portA,batteryLoop.chillerCoolantOut) annotation(Line(points = {{-86,92},{-43.199999999999996,92},{-43.199999999999996,18}},color = {0,0,255}));
    connect(refrigerantLoop.portB,batteryLoop.chillerCoolantIn) annotation(Line(points = {{-106.2,92},{-116,92},{-116,40},{-64.8,40},{-64.8,18}},color = {0,0,255}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics),
    Diagram(coordinateSystem(extent={{-180,-100},{100,140}}), graphics={
        Text(
          extent={{44,-54},{96,-60}},
          lineColor={0,0,255},
          textString="Cabin cooling Power [W]"),
        Text(
          extent={{62,-30},{80,-36}},
          lineColor={0,0,255},
          textString="COP"),
        Text(
          extent={{-50,102},{-4,96}},
          lineColor={0,0,255},
          textString="Collected Water [g]"),
        Text(
          extent={{-16,-50},{30,-64}},
          lineColor={0,0,255},
          textString="Cabin Temperature [C]"),
        Text(
          extent={{48,-8},{92,-14}},
          lineColor={0,0,255},
          textString="Air Mass Flow"),
        Text(
          extent={{-24,-26},{38,-40}},
          lineColor={0,0,255},
          textString="Temperature at Evap. Outlet [C]"),
        Text(
          extent={{-22,-4},{34,-18}},
          lineColor={0,0,255},
          textString="Temperature at Evap. Inlet [C]"),
        Text(
          extent={{-40,132},{-16,126}},
          lineColor={0,0,255},
          textString="Time"),
        Text(
          extent={{-16,-76},{30,-84}},
          lineColor={0,0,255},
          textString="Battery Temperature [C]"),
        Text(
          extent={{44,-76},{96,-82}},
          lineColor={0,0,255},
          textString="Battery Cooling Power [W]")}),
    Documentation(revisions="<html>Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.</html>",
          info="<html>
<h1>Cabin and Battery Refrigerant Coolant System</h1>
<p>This is an example of a twin evaporator vapour cycle, with the vehicle cabin connected to the front evaporator, and a propulsion battery connected to a battery chiller.</p>
<p>Temperatures that are controlled here are battery temperature and front evaporator air outlet temperature. 
This happens by varying compressor speed and opening and closing of both TXV. 
This is all controlled by the <em>systemController</em> component.</p>

<h4>System controller</h4>
<p>Control set-points are given as inputs to the system controller, including temperature of the battery and evaporator air outlet.
System controller parameters include maximum head pressure, temperature and pressure hysteresis deltas, 
and compressor speed control limits and dynamics.</p>

<h4>Cabin loop</h4>
<p>All air boundary conditions are set in the <em>airInit</em> record.
The air mass flow is decided by the <a href=\"modelica://AirConditioning.AirHandling.IdealFan\">blower</a> model which sets a fixed value of the mass flow rate. 
In this example the air is recirculated. 
To change this so that the air is taken from the ambient environment the <a href=\"modelica://AirConditioning.AirHandling.ByPassValve\">byPassValve</a> model should be used. 
The cabin has provision to include irradiation from sun, which is given as a constant input in this example.</p>

<h4>Refrigeration loop</h4>
<p>All boundary conditions are set in the <em>init</em> record of the <em>refrigerantLoop</em> sub-system. 
All the required signals for this loop are given by system controller and super heat adapter via the control bus. 
These signals include compressor speed, opening and closing of both TXVs, and target super heat for both the TXVs</p>

<h4>Battery loop</h4>
<p>The <em>batteryPack</em> component models the heat losses and temperature dynamics, as a result of the load current provided as time series input.</p>
<p>The <em>batteryCooling</em> represents the liquid cooling elements of the battery pack.
The cooling loop for the battery is routed to the chiller in the <em>refrigerantLoop</em> sub-system, via the <em>batteryLoop</em> syb-system,
which contains a pump for actuating the coolant flow through the battery pack.</p>
</html>"),
    experiment(
      StopTime=3900,
      Interval=1,
      Tolerance=1e-07,
      __Dymola_Algorithm="Cvode"));
end CabAndBattRefrigerantCoolantSystem_new;
