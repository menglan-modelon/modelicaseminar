within ModelicaSeminar.Seminar06.EVThermal.Subsystems;
model RefrigerantSystem "Vapor compression cycle: AC_Front_Conv_BC_noIRD_noIHX"
  .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem.RefrigerantSystem summary(
    final compressor_speed=compressor.summary.speed*60,
    final P_front_evaporator=frontEvap.summary.P_evaporator,
    final P_battery_chiller=batteryChiller.summary.Qdot_refTotal,
    final P_compressor=compressor.summary.P_shaft,
    final P_condenser=condenser.summary.P_condenser,
    final p_Cmp_Out=compressor.summary.p_discharge,
    final p_Cond_In=condenser.summary.p_in,
    final p_Cond_Out=condenser.summary.p_out,
    final p_FTXV_In=frontEvapTXV.summary.p_in,
    final p_BTXV_In=battChillerTXV.summary.p_in,
    final p_FTXV_Out=frontEvapTXV.summary.p_out,
    final p_BTXV_Out=battChillerTXV.summary.p_out,
    final p_fEvap_In=frontEvap.summary.p_in,
    final p_BChill_In=batteryChiller.summary.p_in,
    final p_fEvap_Out=frontEvap.summary.p_out,
    final p_BChill_Out=batteryChiller.summary.p_out,
    final p_Cmp_In=compressor.summary.p_suction,
    final T_Cmp_Out=compressor.summary.T_discharge - 273.15,
    final T_Cond_In=condenser.summary.T_in - 273.15,
    final T_Cond_Out=condenser.summary.T_out - 273.15,
    final T_FTXV_In=pipe3.summary.T_out - 273.15,
    final T_BTXV_In=pipeBC1.summary.T_out - 273.15,
    final T_FTXV_Out=RefrigerantMedium.temperature_phX(
        frontEvapTXV.summary.p_out,
        frontEvapTXV.b.h_outflow,
        RefrigerantMedium.fixedComposition,
        0) - 273.15,
    final T_BTXV_Out=batteryChiller.summary.T_in - 273.15,
    final T_fEvap_In=frontEvap.summary.T_in - 273.15,
    final T_BChill_In=batteryChiller.summary.T_in - 273.15,
    final T_fEvap_Out=frontEvap.summary.T_out - 273.15,
    final T_BChill_Out=batteryChiller.summary.T_out - 273.15,
    final T_Cmp_In=compressor.summary.T_suction - 273.15,
    final h_Cmp_Out=compressor.summary.h_discharge,
    final h_Cond_In=condenser.summary.h_in,
    final h_Cond_Out=condenser.summary.h_out,
    final h_FTXV_In=pipe3.summary.h_out,
    final h_BTXV_In=pipeBC1.summary.h_out,
    final h_FTXV_Out=frontEvapTXV.volume.h[1],
    final h_BTXV_Out=batteryChiller.summary.h_in,
    final h_fEvap_In=frontEvap.summary.h_in,
    final h_BChill_In=batteryChiller.summary.h_in,
    final h_fEvap_Out=frontEvap.summary.h_out,
    final h_BChill_Out=batteryChiller.summary.h_out,
    final h_Cmp_In=compressor.summary.h_suction,
    final Cond_airFlow=condenser.summary.mdot_air,
    final Cond_AirIn_T=condenser.summary.Tair_in - 273.15,
    final Cond_AirOut_T=condenser.summary.Tair_out - 273.15,
    final fEvap_AirIn_T=frontEvap.summary.Tair_in - 273.15,
    final fEvap_AirIn_RH=frontEvap.summary.phi_in*100,
    final fEvap_AirIn_H=frontEvap.air_in[1, 1].h_outflow,
    final fEvap_Air_OutT=frontEvap.summary.Tair_out - 273.15,
    final fEvap_AirOut_RH=frontEvap.summary.phi_out*100,
    final fEvap_AirOut_H=frontEvap_airOut.h_outflow,
    final fEvap_AirFlow=frontEvap.summary.mdot_air,
    final BChill_CoolIn_T=batteryChiller.summary.Tcoolant_in - 273.15,
    final BChill_CoolOut_T=batteryChiller.summary.Tcoolant_out - 273.15,
    final BChill_CoolFlow=batteryChiller.summary.mdot_coolant/batteryChiller.coolant.channel.summary.d_in,
    final Subcooling=subCoolingSensor.outPort,
    final frontEvapSuperheat=superHeat.outPort,
    final batteryChillerSuperheat=superHeatSensor1.outPort,
    final mdot=compressor.summary.mdot,
    final mdot_frontEvap=frontEvap.summary.mdot,
    final mdot_batChiller=batteryChiller.summary.mdot,
    final dp_cond=condenser.summary.dp_ref,
    final dp_frontEvap=frontEvap.summary.dp_ref,
    final dp_batteryChiller=batteryChiller.summary.dp,
    final Kv_FTXV=frontEvapTXV.valve.Kv,
    final Kv_ChillerEXV=battChillerTXV.valve.Kv,
    final M_ref=pipe1.summary.M_ref + pipe2.summary.M_ref + pipe3.summary.M_ref
         + pipe4.summary.M_ref + pipe5.summary.M_ref + pipeBC1.summary.M_ref +
        pipeBC3.summary.M_ref + split3.summary.M_ref + junction3.flowJoinSummary.M_ref
         + condenser.summary.M_ref + drierReceiver.summary.M_ref + frontEvap.summary.M_ref
         + batteryChiller.summary.M_ref + compressor.summary.M_ref +
        frontEvapTXV.summary.M_ref + battChillerTXV.summary.M_ref,
    final V_ref=pipe1.summary.V_ref + pipe2.summary.V_ref + pipe3.summary.V_ref
         + pipe4.summary.V_ref + pipe5.summary.V_ref + pipeBC1.summary.V_ref +
        pipeBC3.summary.V_ref + split3.summary.V_ref + junction3.flowJoinSummary.V_ref
         + condenser.summary.V_ref + drierReceiver.summary.V_ref + frontEvap.summary.V_ref
         + batteryChiller.summary.V_ref + compressor.summary.V_ref +
        frontEvapTXV.summary.V_ref + battChillerTXV.summary.V_ref);

  extends
    .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem.TestbenchPars(redeclare replaceable package RefrigerantMedium = .AirConditioning.ThermoFluidPro.Media.ReferenceProperties.R1234yf);

  .Modelica.Units.SI.Pressure[9] p_Diagram={compressor.summary.p_suction,
      compressor.summary.p_discharge,condenser.summary.p_in,condenser.summary.p_out,
      frontEvapTXV.summary.p_in,frontEvap.summary.p_in,frontEvap.summary.p_out,
      pipe4.p[1],compressor.summary.p_suction} "pressures for p-h diagram";
  .Modelica.Units.SI.SpecificEnthalpy[9] h_Diagram={compressor.summary.h_suction,
      compressor.summary.h_discharge,condenser.summary.h_in,condenser.summary.h_out,
      frontEvapTXV.b.h_outflow,frontEvap.summary.h_in,frontEvap.summary.h_out,
      pipe4.h[1],compressor.summary.h_suction}
    "specific enthalpies for p-h diagram";

  .Modelica.Units.SI.Pressure[4] p_Diagram2={condenser.summary.p_out,
      batteryChiller.summary.p_in,batteryChiller.summary.p_out,junction3.volumeAB.p[
      1]} "pressures for p-h diagram";
  .Modelica.Units.SI.SpecificEnthalpy[4] h_Diagram2={condenser.summary.h_out,
      batteryChiller.summary.h_in,batteryChiller.summary.h_out,junction3.volumeAB.h[
      1]} "specific enthalpies for p-h diagram";

  parameter .Modelica.Units.SI.Time startTime(fixed=false);

public
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA frontEvap_airIn(redeclare package
      Medium = AirMedium)                          annotation (Placement(
        transformation(extent={{455,-93},{505,-43}}), iconTransformation(extent={{695,-21},
            {785,69}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB frontEvap_airOut(redeclare package
      Medium = AirMedium)                          annotation (Placement(
        transformation(extent={{458,-200},{506,-152}}),
                                                    iconTransformation(extent={{688,
            -320},{784,-224}})));
  .ModelicaSeminar.Seminar06.EVThermal.Utilities.Records.Summaries.RefrigerantSystem.RefrigerantSystem_init init(
    redeclare package Medium = RefrigerantMedium,
    initType=1,
    charge=summary.SpecificCharge,
    V_ref=summary.V_ref,
    charge_init(displayUnit="kg/m3") = 280,
    dp_pipe(displayUnit="bar") = 1000,
    steadyState=false,
    steadyPressure=false,
    dT_air=20,
    dT_ref=3,
    dp_high=100000,
    p_receiver=drierReceiver.summary.p,
    M_receiver=drierReceiver.summary.M_ref,
    V_receiver=drierReceiver.summary.V_ref,
    charge_init_factor=1) annotation (Placement(transformation(extent={{366,288},
            {398,308}}, rotation=0)));

  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipe1(
    redeclare package Medium = RefrigerantMedium,
    n=1,
    redeclare model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.DensityProfilePressureLoss (
        mdot0=0.075,
        p0_in=1840000,
        p0_out=1710000,
        h0_in=422210,
        h0_out=421330,
        ploss_exp=1.7),
    geo(D(displayUnit="mm") = 0.01016, L=1.295),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      h_in=init.h_cond_in,
      h_out=init.h_cond_in,
      p_in=init.p_high,
      p_out=init.p_high - init.dp_CompOutPipe,
      mdot0=init.mdot_init)) annotation (Placement(transformation(
        origin={380,240},
        extent={{-11,11},{11,-11}},
        rotation=90)));
  .AirConditioning.ControllersAndSensors.SuperHeatSensor superHeat(redeclare
      package Medium = RefrigerantMedium) annotation (Placement(transformation(
          extent={{280,-90},{300,-110}}, rotation=0)));
  replaceable .AirConditioning.HeatExchangers.Evaporator frontEvap(refrigerant(
        use_stabilizer_twoPhaseFraction=true, c_pseudo_twoPhaseFraction_const=0.01))
    constrainedby .AirConditioning.HeatExchangers.Evaporator(redeclare package
      Medium = RefrigerantMedium, final HX_Init=init.FrEvapInit) annotation (
      choicesAllMatching, Placement(transformation(extent={{210,-100},{250,-60}},
          rotation=0)));
  .AirConditioning.Receivers.WaterAccumulator waterAccumulator annotation (
      Placement(transformation(extent={{223,-117},{237,-103}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueP_evap(precision=0, number=
        frontEvap.summary.P_evaporator) annotation (Placement(transformation(
          extent={{217,-60},{243,-40}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueSuperheat(precision=1, number=
        frontEvap.summary.Superheat) annotation (Placement(transformation(
          extent={{260,-100},{280,-80}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueCondensate(precision=1, number=
        waterAccumulator.M*1000) annotation (Placement(transformation(extent={{157,
            -122},{183,-102}}, rotation=0)));
  replaceable .AirConditioning.HeatExchangers.Condenser condenser(
    redeclare model AirModel =
        .AirConditioning.ThermoFluidPro.PipesAndVolumes.HXAirFlowDryAnalytic,
    redeclare replaceable model HTCoefficientRefSide =
        .AirConditioning.ThermoFluidPro.HeatTransfer.HTTwoPhaseMedium.KcTurbulentFilmCondensation,
    CF_AirSideHeatTransfer=1.62,
    CF_RefrigerantSideHeatTransfer=1.62,
    redeclare replaceable package Medium = RefrigerantMedium,
    redeclare replaceable model RefrigerantFrictionLossModel =
        .AirConditioning.ThermoFluidPro.PressureLoss.PLossHexChannel.DensityProfilePressureLossHX
        (
        h0_in=431.774e3,
        h0_out=283e3,
        mdot0=0.09,
        p0_in=2195000,
        p0_out=2020000),
    n_segRef=4,
    redeclare record Geometry =
        .AirConditioning.SubComponents.Records.GeometryData.CondenserExample (
          flattubes={18,18,18}),
    refrigerant(use_stabilizer_twoPhaseFraction=true,
        c_pseudo_twoPhaseFraction_const=0.01)) constrainedby
    .AirConditioning.HeatExchangers.Condenser(
    redeclare package Medium = RefrigerantMedium,
    final HX_Init=init.CondInit,
    redeclare package AirMedium = AirMedium) annotation (choicesAllMatching,
      Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={-234,168})));

  .Modelica.Blocks.Sources.Constant htcCompOut(k=1.5) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={410,270})));
  .AirConditioning.ControllersAndSensors.QualitySensor qualitySensor(redeclare
      package Medium = RefrigerantMedium)
    annotation (Placement(transformation(extent={{308,-110},{328,-90}})));
  replaceable .AirConditioning.Compressors.FixedDisplacementTableBased
    compressor(
    MaximumDisplacement=3.8e-05,
    init(
      dp0=1300000,
      h0=init.h_suction,
      p0=init.p_suction,
      initType=.AirConditioning.ThermoFluidPro.Types.Init.Initial_ph,
      d0=80,
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure),
    tableNameEtaVol="etaVol",
    fileNameEtaVol=.Modelica.Utilities.Files.loadResource(
        "modelica://ModelicaSeminar/Resources/Data/RefrigerantSystem/Compressor_VolEff.txt"),
    tableNameEtaEff="etaMech",
    fileNameEtaEff=.Modelica.Utilities.Files.loadResource(
        "modelica://ModelicaSeminar/Resources/Data/RefrigerantSystem/Compressor_MechEff.txt"),
    tableNameEtaIsen="etaIsen",
    fileNameEtaIsen=.Modelica.Utilities.Files.loadResource(
        "modelica://ModelicaSeminar/Resources/Data/RefrigerantSystem/Compressor_IsentropicEff.txt"),
    eff_max=1,
    eff_min=0.1) constrainedby
    .AirConditioning.Compressors.FixedDisplacementTableBased(redeclare
      replaceable package Medium = RefrigerantMedium, init(
      h0=init.h_suction,
      p0=init.p_suction,
      initType=.AirConditioning.ThermoFluidPro.Types.Init.Initial_ph,
      d0=80,
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure)) annotation (
        choicesAllMatching,
    Placement(transformation(
        extent={{-15,15},{15,-15}},
        rotation=90,
        origin={380,150})));

  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipe5(
    redeclare package Medium = RefrigerantMedium,
    n=1,
    redeclare model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD,
    geo(D(displayUnit="mm") = 0.015, L=0.15),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      h_in=init.h_suction,
      h_out=init.h_suction,
      p_out=init.p_suction,
      p_in=init.p_suction,
      mdot0=init.mdot_init)) annotation (Placement(transformation(
        origin={380,80},
        extent={{-10,-10},{10,10}},
        rotation=90)));

  .Modelica.Thermal.HeatTransfer.Components.Convection convection
    annotation (Placement(transformation(extent={{400,230},{420,250}})));
  .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature environment(T=init.TairCond)
    annotation (Placement(transformation(
        origin={440,240},
        extent={{-10,-10},{10,10}},
        rotation=180)));
  .AirConditioning.PipesAndVolumes.Junction junction3(
    redeclare package Medium = RefrigerantMedium,
    D_a(displayUnit="mm") = 0.015,
    D_b(displayUnit="mm") = 0.015,
    D_c(displayUnit="mm") = 0.015,
    init(
      steadyPressure=false,
      h0=init.h_suction,
      p0=init.p_suction + 0.25*init.dp_high),
    zetaC=50/4) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={400,20})));
public
  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipe4(
    n=1,
    redeclare package Medium = RefrigerantMedium,
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      h_in=init.h_suction,
      h_out=init.h_suction,
      p_out=init.p_suction + 0.25*init.dp_high + init.dp_IHX_inner,
      p_in=init.p_suction + 0.25*init.dp_high + init.dp_IHX_inner,
      mdot0=init.mdot_FrEvap),
    geo(L=0.4, D(displayUnit="mm") = 0.015),
    redeclare replaceable model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD (mdot0=0.12, dp0=5000))
    annotation (Placement(transformation(
        origin={400,-48},
        extent={{10,10},{-10,-10}},
        rotation=270)));

  .AirConditioning.PipesAndVolumes.Split split3(
    redeclare package Medium = RefrigerantMedium,
    D_a(displayUnit="mm") = 0.0127,
    D_b(displayUnit="mm") = 0.0127,
    D_c(displayUnit="mm") = 0.0127,
    init(
      steadyPressure=false,
      h0=init.h_cond_out,
      p0=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond),
    zetaB=50,
    zetaC=225) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-220,-240})));
  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipeBC1(
    n=1,
    redeclare package Medium = RefrigerantMedium,
    geo(D(displayUnit="mm") = 0.008, L=0.15),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      mdot0=init.mdot_batteryChill,
      h_in=init.h_cond_out,
      h_out=init.h_cond_out,
      p_in=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond,
      p_out=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond),
    redeclare replaceable model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD) annotation (Placement(
        transformation(
        extent={{-11,11},{11,-11}},
        rotation=0,
        origin={-170,-240})));

  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipe3(
    n=1,
    redeclare package Medium = RefrigerantMedium,
    geo(D(displayUnit="mm") = 0.008, L=0.15),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      mdot0=init.mdot_init - init.mdot_batteryChill,
      h_in=init.h_cond_out,
      h_out=init.h_cond_out,
      p_in=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond -
          init.dp_IHX_outer,
      p_out=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond -
          init.dp_IHX_outer),
    redeclare replaceable model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD) annotation (Placement(
        transformation(
        extent={{11,-11},{-11,11}},
        rotation=180,
        origin={-100,-90})));
  replaceable .AirConditioning.Heating.HeatExchangers.PlateRefLCLCoolantHX
    batteryChiller(
    n=10,
    CF_CoolantSideHeatTransfer=5,
    CF_RefrigerantSideHeatTransfer=4,
    redeclare record Geometry =
        .AirConditioning.ThermoFluidPro.SubComponents.Records.GeometryData.PlateHXGeo (
        n_channels_ref=21,
        n_channels_htf=22,
        plateThickness=0.0004,
        plateLength=0.106,
        plateWidth=0.06,
        plateDistance=0.0012)) constrainedby
    .AirConditioning.Heating.HeatExchangers.PlateRefLCLCoolantHX(
    redeclare package Medium = RefrigerantMedium,
    redeclare package CoolantMedium = CoolantMedium,
    final HX_Init=init.batteryChiller) annotation (choicesAllMatching,
      Placement(transformation(extent={{91,-230},{141,-278}})));

  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipeBC3(
    n=1,
    redeclare package Medium = RefrigerantMedium,
    geo(D(displayUnit="mm") = 0.015, L=0.4),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      mdot0=init.mdot_batteryChill,
      h_in=init.h_cond_out,
      h_out=init.h_cond_out,
      p_in=init.batteryChiller.p_out,
      p_out=init.batteryChiller.p_out),
    redeclare replaceable model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD) annotation (Placement(
        transformation(
        extent={{-11,11},{11,-11}},
        rotation=0,
        origin={400,-240})));
  .AirConditioning.ControllersAndSensors.SuperHeatSensor superHeatSensor1(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={180,-240})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.SimpleTXVVariableSH
    battChillerTXV(
    k=-0.001,
    yMax=0.12,
    yMin=0.001,
    steadySuperheat=false,
    redeclare package Medium = RefrigerantMedium,
    mdot0=init.mdot_batteryChill,
    init(
      steadyPressure=false,
      h0=init.h_cond_out,
      p0=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond),
    yInit=init.Kv_chillerEXV)
    annotation (Placement(transformation(extent={{-100,-258},{-120,-230}})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={380,188})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot compOut(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{405,165},{475,235}})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor6(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-220,250})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor7(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-190,120})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor10(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={0,-92})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor12(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={150,-94})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor13(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={342,-100})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor17(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={70,-240})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor18(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-140,-240})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor19(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={338,-240})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor20(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={380,50})));
  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor21(
     redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={380,110})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot CondIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-193,219},{-131,281}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot CondOut(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-172,88},{-108,152}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot ftxvIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-33,-107},{33,-41}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot frEvapIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{114,-106},{186,-34}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot frEvapOut(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{306,-86},{378,-14}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot accIn(
      precision_mdot=3) annotation (Placement(transformation(
        extent={{-36,-36},{36,36}},
        rotation=0,
        origin={430,50})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot compIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{404,104},{476,176}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot btxvIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-176,-250},{-104,-178}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot batteryChillIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{34,-246},{106,-174}})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot batteryChillOut(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{302,-250},{374,-178}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.Valves.SimpleTXVVariableSH
    frontEvapTXV(
    k=-0.001,
    yMin=0.001,
    steadySuperheat=false,
    redeclare package Medium = RefrigerantMedium,
    mdot0=init.mdot_FrEvap,
    init(
      steadyPressure=false,
      h0=init.h_cond_out,
      p0=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond -
          init.dp_IHX_outer),
    yInit=init.Kv)
    annotation (Placement(transformation(extent={{42,-110},{22,-82}})));

  .AirConditioning.PipesAndVolumes.PipeAdiabatic pipe2(
    n=1,
    redeclare package Medium = RefrigerantMedium,
    geo(D(displayUnit="mm") = 0.008, L=0.15),
    init(
      steadyState=init.steadyState,
      steadyPressure=init.steadyPressure,
      mdot0=init.mdot_init,
      h_in=init.h_cond_out,
      h_out=init.h_cond_out,
      p_in=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond,
      p_out=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond),
    redeclare replaceable model FrictionLoss =
        .AirConditioning.ThermoFluidPro.PressureLoss.PressureLossD) annotation (Placement(
        transformation(
        extent={{11,-11},{-11,11}},
        rotation=90,
        origin={-240,-164})));

  .Modelica.Blocks.Sources.RealExpression evapAir_outT(y=
        .Modelica.Units.Conversions.to_degC(frontEvap.summary.Tair_out))
    annotation (Placement(transformation(extent={{-280,-310},{-246,-286}})));
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus
    controlBus annotation (Placement(transformation(
        extent={{-50,-50},{50,50}},
        rotation=180,
        origin={-206,-320}), iconTransformation(
        extent={{-95,-87},{95,87}},
        rotation=90,
        origin={-610,-520})));

 .ModelicaSeminar.Seminar06.EVThermal.Utilities.Visualizers.PH_R1234yf_2line
    pH_R1234yf(
    x=h_Diagram,
    y=.Modelica.Math.log(p_Diagram),
    x2=h_Diagram2,
    y2=.Modelica.Math.log(p_Diagram2),
    color2={255,0,255})
    annotation (Placement(transformation(extent={{-90,-90},{326,326}})));
  .AirConditioning.Visualizers.RealValue valueP_evap2(precision=0, number=
        batteryChiller.summary.Qdot_refTotal) annotation (Placement(
        transformation(extent={{127,-230},{153,-210}}, rotation=0)));
public
  .AirConditioning.Visualizers.RealValue frontEvapQuality(precision=4, number=
        qualitySensor.outPort) annotation (Placement(transformation(extent={{298,
            -90},{334,-70}}, rotation=0)));
  .AirConditioning.ControllersAndSensors.SubCoolingSensor subCoolingSensor(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-240,-116})));
  .AirConditioning.Visualizers.RealValue valueSuperheat_chiller(precision=1,
      number=superHeatSensor1.TempSH) annotation (Placement(transformation(
          extent={{194,-238},{216,-216}}, rotation=0)));
  .Modelica.Blocks.Sources.RealExpression compressor_p_discharge(y=compressor.summary.p_discharge
        /1e5)
    annotation (Placement(transformation(extent={{-280,-320},{-260,-300}})));
  .AirConditioning.Visualizers.RealValue valueSubcool(precision=1, number=
        subCoolingSensor.outPort) annotation (Placement(transformation(extent={{
            -270,-108},{-246,-84}}, rotation=0)));
  .AirConditioning.Visualizers.RealValue valueCompSpeed(precision=0, number=
        summary.compressor_speed) annotation (Placement(transformation(extent={{
            421,162},{447,182}}, rotation=0)));

  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor1(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={-220,-138})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot ihxIn(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-200,-176},{-128,-104}})));
  .AirConditioning.Visualizers.RealValue valueP_condenser(precision=0, number=
        condenser.summary.P_condenser) annotation (Placement(transformation(
          extent={{-195,156},{-169,176}}, rotation=0)));
  .AirConditioning.Receivers.SimpleSeparator drierReceiver(
    Di(displayUnit="mm") = 0.035,
    H(displayUnit="mm") = 0.17,
    H_Out(displayUnit="mm") = 0.01,
    desiccant=false,
    H_des(displayUnit="mm") = 0.05,
    zeta=200,
    init(
      steadyState=true,
      h0=init.h_cond_out,
      p0=init.p_high - init.dp_CompOutPipe - 2*init.dp_pipe - init.dp_Cond),
    redeclare package Medium = RefrigerantMedium)
    annotation (Placement(transformation(extent={{-198,60},{-242,100}})));

  .AirConditioning.ControllersAndSensors.MultiDisplaySensor multiDisplaySensor4(
      redeclare package Medium = RefrigerantMedium) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-240,30})));
  .AirConditioning.ControllersAndSensors.MultiDisplayVis_phTmdot CondOut1(
      precision_mdot=3)
    annotation (Placement(transformation(extent={{-234,-2},{-170,62}})));
  .AirConditioning.ControllersAndSensors.SuperHeatSensor compOut_SH(redeclare
      package Medium = RefrigerantMedium) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={380,214})));
  .Modelica.Thermal.HeatTransfer.Components.Convection convection1
    annotation (Placement(transformation(extent={{394,70},{414,90}})));
  .Modelica.Blocks.Sources.Constant htcCompIn(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={430,112})));
  .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{440,70},{420,90}})));
  .Modelica.Blocks.Sources.RealExpression T_air_in2(y=init.TairCond)
    annotation (Placement(transformation(extent={{470,70},{450,90}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort coolant_out(
      redeclare package Medium = CoolantMedium) annotation (Placement(
        transformation(extent={{45,-345},{95,-295}}), iconTransformation(extent=
           {{-62,-624},{20,-542}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort
    coolant_in(redeclare package Medium = CoolantMedium) annotation (Placement(
        transformation(extent={{136,-344},{184,-296}}), iconTransformation(
          extent={{170,-620},{250,-540}})));
public
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA condenser_airIn(redeclare package
      Medium = AirMedium) annotation (Placement(transformation(extent={{-311,
            189},{-261,239}}), iconTransformation(extent={{-645,361},{-555,451}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB condenser_airOut(redeclare package
      Medium = AirMedium) annotation (Placement(transformation(extent={{-308,92},
            {-260,140}}), iconTransformation(extent={{-648,-118},{-552,-22}})));
  .Modelica.Mechanics.Rotational.Interfaces.Flange_a compressorShaft annotation (
     Placement(transformation(extent={{433,127},{531,225}}), iconTransformation(
          extent={{693,313},{787,407}})));
  .Modelica.Blocks.Sources.RealExpression chillerCoolant_outT(y=.Modelica.Units.Conversions.to_degC(
        batteryChiller.summary.Tcoolant_out))
    annotation (Placement(transformation(extent={{-12,-332},{-46,-308}})));
initial equation
  startTime = time;

equation
  ////   assert(Medium.mediumName == init.Medium.mediumName, "Inconsistent medium definitions in model: init.Medium=" + init.Medium.mediumName +", and Medium = "+Medium.mediumName);
  if drierReceiver.Separator.stateChoice == .AirConditioning.ThermoFluidPro.Types.ThermoStates.UM_States then
    when sample(startTime, .Modelica.Constants.inf) and init.initType == 1 then
      reinit(drierReceiver.Separator.M[1], init.M_corrected);
      reinit(drierReceiver.Separator.U[1], init.U_corrected);
    end when;
  else
    when sample(startTime, .Modelica.Constants.inf) and init.initType == 1 then
      reinit(drierReceiver.Separator.h[1], init.h_receiver);
    end when;
  end if;

  connect(frontEvap.b1, superHeat.a) annotation (Line(
      points={{250,-94.4},{250,-100},{280,-100}},
      color={0,191,0},
      thickness=0.5));
  connect(frontEvap.water_out, waterAccumulator.w_in) annotation (Line(
      points={{240,-97.6},{240,-107.2},{235.6,-107.2}},
      color={0,0,255},
      thickness=0.5));
  connect(superHeat.b, qualitySensor.a)
    annotation (Line(points={{300,-100},{308,-100}}, color={0,191,0}));
  connect(pipe1.q[1], convection.solid)
    annotation (Line(points={{380,240},{400,240}}, color={191,0,0}));
  connect(convection.fluid, environment.port)
    annotation (Line(points={{420,240},{430,240}}, color={191,0,0}));
  connect(convection.Gc, htcCompOut.y)
    annotation (Line(points={{410,250},{410,259}}, color={0,0,127}));
  connect(split3.b, pipeBC1.a)
    annotation (Line(points={{-210,-240},{-181,-240}}, color={0,191,0}));
  connect(junction3.a, pipeBC3.b) annotation (Line(points={{400,30},{400,34},{440,
          34},{440,-240},{411,-240}}, color={0,191,0}));
  connect(multiDisplaySensor.portA, compressor.DischargePort)
    annotation (Line(points={{380,178},{380,165}}, color={0,191,0}));
  connect(multiDisplaySensor.u, compOut.y) annotation (Line(points={{380,188},{400,
          188},{400,200},{440,200}}, color={0,0,0}));
  connect(multiDisplaySensor6.portB, condenser.a1) annotation (Line(points={{-220,
          240},{-220,214},{-220,188},{-219.6,188}}, color={0,191,0}));
  connect(condenser.b1, multiDisplaySensor7.portA) annotation (Line(points={{-219.6,
          148},{-219.6,130},{-190,130}}, color={0,191,0}));
  connect(qualitySensor.b, multiDisplaySensor13.portA)
    annotation (Line(points={{328,-100},{332,-100}}, color={0,191,0}));
  connect(pipeBC1.b, multiDisplaySensor18.portA)
    annotation (Line(points={{-159,-240},{-150,-240}}, color={0,191,0}));
  connect(multiDisplaySensor17.portB, batteryChiller.a1) annotation (Line(
        points={{80,-240},{90,-240},{90,-239.6},{91,-239.6}}, color={0,0,0}));
  connect(multiDisplaySensor19.portB, pipeBC3.a)
    annotation (Line(points={{348,-240},{389,-240}}, color={0,0,0}));
  connect(multiDisplaySensor21.portB, compressor.SuctionPort)
    annotation (Line(points={{380,120},{380,135}}, color={0,191,0}));
  connect(multiDisplaySensor21.portA, pipe5.b)
    annotation (Line(points={{380,100},{380,90}}, color={0,191,0}));
  connect(multiDisplaySensor6.u, CondIn.y)
    annotation (Line(points={{-220,250},{-162,250}}, color={0,0,0}));
  connect(CondOut.y, multiDisplaySensor7.u)
    annotation (Line(points={{-140,120},{-190,120}}, color={0,0,0}));
  connect(multiDisplaySensor10.u, ftxvIn.y)
    annotation (Line(points={{0,-92},{0,-74}}, color={0,0,0}));
  connect(frEvapIn.y, multiDisplaySensor12.u)
    annotation (Line(points={{150,-70},{150,-94}}, color={0,0,0}));
  connect(frEvapOut.y, multiDisplaySensor13.u)
    annotation (Line(points={{342,-50},{342,-100}}, color={0,0,0}));
  connect(accIn.y, multiDisplaySensor20.u)
    annotation (Line(points={{430,50},{380,50}}, color={0,0,0}));
  connect(compIn.y, multiDisplaySensor21.u) annotation (Line(points={{440,140},{
          400,140},{400,110},{380,110}}, color={0,0,0}));
  connect(btxvIn.y, multiDisplaySensor18.u)
    annotation (Line(points={{-140,-214},{-140,-240}}, color={0,0,0}));
  connect(batteryChillIn.y, multiDisplaySensor17.u)
    annotation (Line(points={{70,-210},{70,-240}}, color={0,0,0}));
  connect(batteryChillOut.y, multiDisplaySensor19.u)
    annotation (Line(points={{338,-214},{338,-240}}, color={0,0,0}));
  connect(batteryChiller.b1, superHeatSensor1.a) annotation (Line(points={{141,-239.6},
          {174.5,-239.6},{174.5,-240},{170,-240}}, color={0,191,0}));
  connect(superHeatSensor1.b, multiDisplaySensor19.portA)
    annotation (Line(points={{190,-240},{328,-240}}, color={0,191,0}));
  connect(battChillerTXV.a, multiDisplaySensor18.portB)
    annotation (Line(points={{-120,-240},{-130,-240}}, color={0,191,0}));
  connect(frontEvap.air_out, frontEvap_airOut) annotation (Line(points={{210,-68},
          {200,-68},{200,-176},{482,-176}},                 color={85,170,255}));
  connect(frontEvap.air_in[1, 1], frontEvap_airIn)
    annotation (Line(points={{250,-68},{480,-68}}, color={85,170,255}));
  connect(evapAir_outT.y, controlBus.evapAirOutT_degC) annotation (Line(points={
          {-244.3,-298},{-206,-298},{-206,-320}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(battChillerTXV.target_superHeat, controlBus.SHBattChiller_SP)
    annotation (Line(points={{-116,-250},{-116,-298},{-206,-298},{-206,-320}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(frontEvapTXV.target_superHeat, controlBus.SHFrontEvap_SP) annotation (
     Line(points={{26,-102},{26,-298},{-206,-298},{-206,-320}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(multiDisplaySensor12.portB, frontEvap.a1) annotation (Line(points={{160,
          -94},{210,-94},{210,-94.4}}, color={0,191,0}));
  connect(battChillerTXV.controlled, controlBus.battChillTXVOnOff) annotation (
      Line(points={{-110,-258},{-110,-300},{-206,-300},{-206,-320}}, color={255,
          0,255}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(frontEvapTXV.controlled, controlBus.frontEvapTXVOnOff) annotation (
      Line(points={{32,-110},{32,-300},{-206,-300},{-206,-320}}, color={255,0,255}));
  connect(pipe2.a, subCoolingSensor.b)
    annotation (Line(points={{-240,-153},{-240,-126}}, color={0,191,0}));
  connect(multiDisplaySensor10.portB, frontEvapTXV.a)
    annotation (Line(points={{10,-92},{22,-92}}, color={0,191,0}));
  connect(compressor_p_discharge.y, controlBus.p_discharge_bar) annotation (
      Line(points={{-259,-310},{-230,-310},{-230,-300},{-206,-300},{-206,-320}},
        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(split3.a, pipe2.b) annotation (Line(points={{-230,-240},{-240,-240},{-240,
          -175}}, color={0,191,0}));
  connect(battChillerTXV.b, multiDisplaySensor17.portA)
    annotation (Line(points={{-100,-240},{60,-240}}, color={0,191,0}));
  connect(frontEvapTXV.b, multiDisplaySensor12.portA)
    annotation (Line(points={{42,-92},{42,-94},{140,-94}}, color={0,191,0}));
  connect(multiDisplaySensor6.portA, pipe1.b) annotation (Line(points={{-220,260},
          {-220,281},{380,281},{380,251}}, color={0,191,0}));
  connect(pipe5.a, multiDisplaySensor20.portB)
    annotation (Line(points={{380,70},{380,60}}, color={0,191,0}));
  connect(superHeat.outPort, frontEvapTXV.DeltaT_SH) annotation (Line(points={{290,
          -110},{290,-130},{38,-130},{38,-102.05},{37.95,-102.05}}, color={0,0,127}));
  connect(superHeatSensor1.outPort, battChillerTXV.DeltaT_SH) annotation (Line(
        points={{180,-250},{180,-290},{-104.05,-290},{-104.05,-250.05}}, color={
          0,0,127}));
  connect(junction3.c, multiDisplaySensor20.portA)
    annotation (Line(points={{390,20},{380,20},{380,40}}, color={0,191,0}));
  connect(split3.c, multiDisplaySensor1.portA)
    annotation (Line(points={{-220,-230},{-220,-148}}, color={0,191,0}));
  connect(ihxIn.y, multiDisplaySensor1.u) annotation (Line(points={{-164,-140},{
          -192,-140},{-192,-138},{-220,-138}}, color={0,0,0}));
  connect(pipe3.b, multiDisplaySensor10.portA) annotation (Line(points={{-89,-90},
          {-50,-90},{-50,-92},{-10,-92}}, color={0,191,0}));
  connect(multiDisplaySensor13.portB, pipe4.a) annotation (Line(points={{352,-100},
          {400,-100},{400,-58}}, color={0,191,0}));
  connect(drierReceiver.FlowIn, multiDisplaySensor7.portB) annotation (Line(
        points={{-201.08,94},{-190,94},{-190,110}}, color={0,191,0}));
  connect(multiDisplaySensor4.u, CondOut1.y)
    annotation (Line(points={{-240,30},{-202,30}}, color={0,0,0}));
  connect(subCoolingSensor.a, multiDisplaySensor4.portB)
    annotation (Line(points={{-240,-106},{-240,20}}, color={0,191,0}));
  connect(multiDisplaySensor4.portA, drierReceiver.FlowOut) annotation (Line(
        points={{-240,40},{-239.8,40},{-239.8,94}}, color={0,191,0}));
  connect(pipe1.a, compOut_SH.b)
    annotation (Line(points={{380,229},{380,224}}, color={0,191,0}));
  connect(compOut_SH.a, multiDisplaySensor.portB)
    annotation (Line(points={{380,204},{380,198}}, color={0,191,0}));
  connect(pipe4.b, junction3.b) annotation (Line(points={{400,-38},{400,-14},{400,
          -14},{400,10}}, color={0,191,0}));
  connect(multiDisplaySensor1.portB, pipe3.a) annotation (Line(points={{-220,-128},
          {-220,-90},{-111,-90}}, color={0,191,0}));
  connect(convection1.Gc, htcCompIn.y)
    annotation (Line(points={{404,90},{404,112},{419,112}}, color={0,0,127}));
  connect(convection1.fluid, prescribedTemperature.port)
    annotation (Line(points={{414,80},{420,80}}, color={191,0,0}));
  connect(prescribedTemperature.T, T_air_in2.y)
    annotation (Line(points={{442,80},{449,80}}, color={0,0,127}));
  connect(pipe5.q[1], convection1.solid)
    annotation (Line(points={{380,80},{394,80}}, color={191,0,0}));
  connect(batteryChiller.coolant_out, coolant_out) annotation (Line(points={{91,
          -268.4},{70,-268.4},{70,-320}}, color={0,0,255}));
  connect(batteryChiller.coolant_in, coolant_in) annotation (Line(points={{141,
          -268.4},{160,-268.4},{160,-320}}, color={0,0,255}));
  connect(condenser_airOut, condenser_airOut)
    annotation (Line(points={{-284,116},{-284,116}}, color={85,170,255}));
  connect(condenser_airIn, condenser_airIn)
    annotation (Line(points={{-286,214},{-286,214}}, color={85,170,255}));
  connect(condenser.air_in[1, 1], condenser_airIn) annotation (Line(points={{
          -246,148},{-262,148},{-262,214},{-286,214}}, color={85,170,255}));
  connect(condenser_airOut, condenser.air_out) annotation (Line(points={{-284,
          116},{-282,116},{-282,188},{-246,188}}, color={85,170,255}));
  connect(compressor.Flange_a1, compressorShaft) annotation (Line(points={{
          393.5,150},{404,150},{404,176},{482,176}}, color={0,0,0}));
  connect(chillerCoolant_outT.y, controlBus.chillerCoolantOutT_degC)
    annotation (Line(points={{-47.7,-320},{-206,-320}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-280,-320},{
            480,320}}), graphics={
        Text(
          extent={{205,-37},{255,-43}},
          lineColor={0,0,255},
          textString="Cooling Power [W]"),
        Text(
          extent={{245,-77},{295,-83}},
          lineColor={0,0,255},
          textString="T Superheat [K]"),
        Text(
          extent={{145,-99},{195,-105}},
          lineColor={0,0,255},
          textString="Collected Water [g]"),
        Text(
          extent={{115,-207},{165,-213}},
          lineColor={0,0,255},
          textString="Cooling Power [W]"),
        Text(
          extent={{181,-213},{231,-219}},
          lineColor={0,0,255},
          textString="T Superheat [K]"),
        Text(
          extent={{-279,-81},{-229,-87}},
          lineColor={0,0,255},
          textString="Subcool [K]"),
        Text(
          extent={{409,183},{459,177}},
          lineColor={0,0,255},
          textString="Compressor Speed [RPM]"),
        Text(
          extent={{-207,179},{-157,173}},
          lineColor={0,0,255},
          textString="Condenser Power [W]"),
        Bitmap(extent={{8,-48},{28,-48}}, fileName="")}),
    Documentation(info="<html><h1>TwinEvaporatorCycle</h1>
<p>This is a template for a two-evaporator air-conditioning
system. A vapour compression cycle with air as the secondary fluid in the
condenser and front evaporator and coolant as the secondary fluid in the
battery chiller is controlled by compressor speed and TXV opening and closing
to achieve a pre-defined air outlet temperature in the front evaporator and
battery temperature in the battery chiller. A thermostatic expansion valve
controls superheating at both the evaporator and the condenser. TXV measures
the super heat from the evaporator outlet and compares it to the set super heat
point from the control bus, determining the flow coefficient value and so
managing the mass flow through each evaporator.</p>
<p>This template can be used for multiple purpose like create a
standalone Air-Conditioning system with 2 evaporators or Air-conditioning system
with cabin and battery models.</p>
</html>", revisions="<html>
Copyright &copy; 2004-2023, MODELON AB <br /> The use of this software component is regulated by the licensing conditions for Modelon Libraries. <br />This copyright notice must, unaltered, accompany all components that are derived from, copied from, <br />or by other means have their origin from any Modelon Library.
</html>"),
    Icon(coordinateSystem(extent={{-280,-320},{480,320}}, preserveAspectRatio=
            false), graphics={
        Polygon(
          points={{-318,36},{-318,-184},{132,-186},{132,24},{-318,36}},
          lineColor={135,135,135},
          lineThickness=0.5,
          fillColor={0,191,0},
          fillPattern=FillPattern.Solid,
          origin={674,-216},
          rotation=270),
        Ellipse(
          extent={{494,448},{696,252}},
          lineColor={95,95,95},
          fillColor={0,191,0},
          fillPattern=FillPattern.Sphere),
        Polygon(
          points={{564,444},{624,444},{668,284},{646,268},{628,258},{606,254},{
              584,254},{562,260},{544,266},{530,272},{516,290},{564,444}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,191,0}),
        Rectangle(
          extent={{-314,98},{314,-98}},
          lineColor={95,95,95},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={0,191,0},
          origin={-464,168},
          rotation=90),
        Line(points={{-462,482},{-462,592},{596,592},{596,446}},
                                                      color={0,0,0}),
        Line(points={{-144,-476},{-458,-476},{-458,-150}}, color={0,0,0}),
        Line(points={{602,102},{600,108},{600,250}}, color={0,0,0}),
        Rectangle(
          extent={{-146,-384},{326,-564}},
          lineColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,191,0}),
        Line(points={{328,-474},{598,-474},{598,-350}}, color={0,0,0}),
        Text(
          extent={{-306,162},{446,-100}},
          lineColor={0,0,0},
          textString="%name",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-151.5,79.5},{151.5,-79.5}},
          lineColor={0,0,0},
          origin={600.5,-111.5},
          rotation=90,
          textString="frontEvap"),
        Text(
          extent={{-232,85},{232,-85}},
          lineColor={0,0,0},
          origin={92,-473},
          rotation=180,
          textString="batteryChiller"),
        Text(
          extent={{-247,91},{247,-91}},
          lineColor={0,0,0},
          origin={-461,155},
          rotation=270,
          textString="Condenser"),
        Text(
          extent={{-135,68},{135,-68}},
          lineColor={0,0,0},
          origin={460,360},
          rotation=90,
          textString="Compressor")}));
end RefrigerantSystem;
