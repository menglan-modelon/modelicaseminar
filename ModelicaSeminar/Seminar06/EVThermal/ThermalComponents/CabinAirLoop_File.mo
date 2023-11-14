within ModelicaSeminar.Seminar06.EVThermal.ThermalComponents;
model CabinAirLoop_File "cabin with air loop with loads from file"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.CabinEvaporator;
  parameter .Modelon.Media.Units.Temperature T_start_air=298.15 "air nitial temperature";
AirConditioning.AirHandling.SimpleCabin simpleCabin(
    n_Passenger=4,
    P_passenger=80,
    init(
      p0=1.1e5,
      mdot0=airInit.mdotEvap,
      T0=airInit.TairEvap,
      phi0=airInit.phiEvap),redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir,
    V=2.8,
    C=(simpleCabin.P_evaporator/simpleCabin.deltaT)*simpleCabin.timeConstant*0.2,
    deltaT=40,
    Tm=318.15) annotation (Placement(transformation(extent={{-36,40},{-12,64}},
          rotation=0)));

  AirConditioning.AirHandling.AirDuct airDuct(
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
      phi0=airInit.phiEvap),redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir)
    annotation (Placement(transformation(extent={{-74,42},{-54,62}},   rotation=
           0)));
  AirConditioning.AirHandling.ByPassValve byPassValve(
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
      p0=97700),redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir,
    frictionLoss_a1(b(h_outflow(start=1e5))),
    analyticInverseTfromh=false) annotation (Placement(transformation(extent={{6,42},{
            26,62}},        rotation=0)));
  AirConditioning.Reservoirs.HeatFlow.Heat1Dim heat1Dim(P0=1947, paraOption=true)
    annotation (Placement(transformation(extent={{-34,68},{-14,88}},   rotation=
           0)));
  AirConditioning.AirHandling.IdealFan blower(
    redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir,
    init(
      p0=0.99e5,
      T0=airInit.TairEvap,
      phi0=airInit.phiEvap,
      mdot0=airInit.mdotEvap),
    analyticInverseTfromh=false,
    m_flow=airInit.mdotEvap,
    V_tot=0.001) annotation (Placement(transformation(extent={{40,42},{60,62}},
          rotation=0)));
  AirConditioning.SubComponents.Records.InitData.AirInit airInit(
    mdotCond=0.5,
    TairEvap=T_start_air,
    TairCond=313.15,
    mdotEvap=0.5)            annotation (Placement(transformation(extent={{-96,76},
            {-76,96}},        rotation=0)));
  AirConditioning.Visualizers.RealValue valueTcabin(precision=1, number=
        .Modelica.Units.Conversions.to_degC(simpleCabin.cabinVolume.T))
    annotation (Placement(transformation(extent={{-38,22},{-12,42}},
          rotation=0)));
  AirConditioning.Visualizers.RealValue valueAirflow(precision=2, number=blower.a.m_flow)
    annotation (Placement(transformation(extent={{22,64},{48,84}},    rotation=0)));
  .LiquidCooling.HeatExchangers.LiquidGas.StaticEffectivenessTable heaterCore(
      redeclare package Liquid = Medium,redeclare replaceable package Gas = .HeatExchanger.Media.SimpleMoistAir,
          A_heat_prim=0.1,
    A_heat_sec=0.2,
    table=[0,1; 1,0.6],
    from_dp_sec=false,
    redeclare model Friction =
        .LiquidCooling.Pipes.SubComponents.PipeResistances.SinglePhase.QuadraticOperatingPointLoss
        (
        dp0(displayUnit="kPa") = 9000,
        m_flow0=2.6,
        d0=1000),
    redeclare model Friction_sec =
        .LiquidCooling.Pipes.SubComponents.PipeResistances.SinglePhase.QuadraticOperatingPointLoss
        (
        d0=1,
        dp0(displayUnit="kPa") = 600,
        m_flow0=1),
    Dhyd_sec=1.3e-3,
    A_sec=0.12,
    L_sec=0.03,
    Dhyd_prim=0.00312,
    A_prim=0.001615,
    L_prim=0.42)
    annotation (Placement(transformation(extent={{-20,-60},{20,-20}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters.ACLToHXLLumped aCLToHXLLumped(
    redeclare replaceable package MediumACL = .AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir,
    redeclare replaceable package MediumHXL = HeatExchanger.Media.SimpleMoistAir)
    annotation (Placement(transformation(extent={{40,-38},{52,-18}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.Adapters.HXLLumpedToACL hXLLumpedToACL(
    redeclare replaceable package MediumACL = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir,
    redeclare replaceable package MediumHXL = HeatExchanger.Media.SimpleMoistAir)
    annotation (Placement(transformation(extent={{-60,-38},{-48,-18}})));
  .ModelicaSeminar.Seminar06.EVThermal.Components.AirHandling.ControlledSplit split_HeaterCooler(
    init(
      T0=airInit.TairEvap,
      p0=121000,
      phi0=airInit.phiEvap,
      mdot0=airInit.mdotEvap),
    dp_nom=1000,
      combiTable1Ds(table=[0,1e-03,1; 1,1,1e-03]),redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir)
    "0=full cooling, 1=full heating" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={76,52})));
  AirConditioning.AirHandling.Join join(init(
      T0=airInit.TairEvap,
      p0=120500,
      phi0=airInit.phiEvap,
      mdot0=airInit.mdotEvap), dp_nom=1000,redeclare replaceable package Medium = AirConditioning.ThermoFluidPro.Media.Air.NoncondensingAir)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,30})));
  AirConditioning.Visualizers.RealValue valueAirflow_heater(precision=2, number=
       -split_HeaterCooler.c.m_flow) annotation (Placement(transformation(
          extent={{48,6},{74,26}},   rotation=0)));
  AirConditioning.Visualizers.RealValue valueAirflow_cooler(precision=2, number=
       -split_HeaterCooler.b.m_flow) annotation (Placement(transformation(
          extent={{86,58},{112,78}}, rotation=0)));
  AirConditioning.Visualizers.RealValue valueTevap_in(precision=1, number=
        .Modelica.Units.Conversions.to_degC(split_HeaterCooler.vol.T))
    annotation (Placement(transformation(extent={{86,22},{112,42}}, rotation=0)));
  AirConditioning.Visualizers.RealValue valueTevap_out(precision=1, number=
        .Modelica.Units.Conversions.to_degC(join.vol_ab.T)) annotation (
      Placement(transformation(extent={{-68,22},{-42,42}}, rotation=0)));
  AirConditioning.Visualizers.RealValue valueTheater_in(precision=1, number=
        .Modelica.Units.Conversions.to_degC(heaterCore.heatExchanger.summary.T_sec_in))
    annotation (Placement(transformation(extent={{20,-26},{46,-6}}, rotation=0)));
  AirConditioning.Visualizers.RealValue valueTheater_out(precision=1, number=
        .Modelica.Units.Conversions.to_degC(heaterCore.heatExchanger.summary.T_sec_out))
    annotation (Placement(transformation(extent={{-46,-26},{-20,-6}}, rotation=
            0)));
equation
  connect(simpleCabin.b, byPassValve.a)
    annotation (Line(points={{-12,52},{6,52}},    color={85,170,255}));
  connect(airDuct.b, simpleCabin.a)
    annotation (Line(points={{-54,52},{-36,52}},   color={85,170,255}));
  connect(heat1Dim.q, simpleCabin.q)
    annotation (Line(points={{-24,69.2},{-24,62.8}},   color={191,0,0}));
  connect(byPassValve.b, blower.a)
    annotation (Line(points={{26,52},{40,52}},   color={85,170,255}));
  connect(heat1Dim.inp, controlBus.Q_cabin) annotation (Line(points={{-33,71},{-38,
          71},{-38,90},{0,90},{0,98}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(heaterCore.portA_prim, portA)
    annotation (Line(points={{-20,-52},{-90,-52},{-90,0},{-100,0}},
                                                color={0,0,255}));
  connect(heaterCore.portB_prim, portB)
    annotation (Line(points={{20,-52},{92,-52},{92,0},{102,0}},
                                              color={0,0,255}));
  connect(aCLToHXLLumped.portB, heaterCore.portA_sec)
    annotation (Line(points={{40,-28},{20,-28}}, color={85,170,255}));
  connect(hXLLumpedToACL.portA, heaterCore.portB_sec)
    annotation (Line(points={{-48,-28},{-20,-28}}, color={85,170,255}));
  connect(byPassValve.opening, controlBus.airRecircValveOpening) annotation (
      Line(points={{10,62.4},{10,90},{0,90},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(blower.massFlow, controlBus.mdot_airCabin) annotation (Line(points={{
          50,60},{50,90},{0,90},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(blower.b, split_HeaterCooler.a)
    annotation (Line(points={{60,52},{66,52}}, color={85,170,255}));
  connect(split_HeaterCooler.c, aCLToHXLLumped.portA) annotation (Line(points={{
          76.4,41.6},{76.4,-28},{52,-28}}, color={85,170,255}));
  connect(join.c, airDuct.a)
    annotation (Line(points={{-80,40},{-80,52},{-74,52}}, color={85,170,255}));
  connect(join.a, hXLLumpedToACL.portB) annotation (Line(points={{-70,30},{-70,-28},
          {-60,-28}}, color={85,170,255}));
  connect(split_HeaterCooler.u1, controlBus.airSplitClimate) annotation (
     Line(points={{76,56},{76,90},{0,90},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(split_HeaterCooler.b, evaporatorIn)
    annotation (Line(points={{86,52},{86,50},{100,50}}, color={85,170,255}));
  connect(join.b, evaporatorOut) annotation (Line(points={{-90,30},{-90,50},{-100,
          50}}, color={85,170,255}));
end CabinAirLoop_File;
