within ModelicaSeminar.Seminar06.EVThermal.Subsystems.UnitTests;

model RefSys_EvapChiller_BCbothSides
    extends .LiquidCooling.Experiments.Templates.ExperimentBase(redeclare
      package Liquid =
               .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
  .EVThermal.Subsystems.RefrigerantSystem_EvaporatorChiller refrigerantSystem(
      redeclare package Medium = Liquid, redeclare package AirMedium =
        AirMedium)
    annotation (Placement(transformation(extent={{-50,-40},{50,60}})));
  .LiquidCooling.Sources.LiquidFlowSource flowSource(
    redeclare package Medium = Liquid,
    temperatureUnit=.Modelon.ThermoFluid.Choices.RealTemperatureUnit.degC,
    use_flow_in=true,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  .LiquidCooling.Sources.LiquidPressureSource pressureSource(redeclare package
      Medium = Liquid, isSource=false,use_p_in = true,use_T_in = true)
    annotation (Placement(transformation(extent={{80,0},{60,20}})));
  replaceable package AirMedium = .ThermoFluidPro.Media.Air.MoistAir annotation (
     choicesAllMatching=true);
  .AirConditioning.Reservoirs.Air.FlowSourceAir flowSourceAir(redeclare package
      Medium = AirMedium)
    annotation (Placement(transformation(extent={{-80,-20},{-60,-40}})));
  .AirConditioning.Reservoirs.Air.FlowSinkAir flowSinkAir(redeclare package
      Medium = AirMedium)
    annotation (Placement(transformation(extent={{80,-40},{60,-20}})));
  .EVThermal.Controllers.RefrigerantSystem.System system
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  .EVThermal.Interfaces.ControlBus controlBus annotation (Placement(transformation(
        extent={{-15.5,13.5},{15.5,-13.5}},
        rotation=180,
        origin={0,80}),     iconTransformation(extent={{-200,-54},{-180,-34}})));
  .Modelica.Blocks.Sources.CombiTimeTable coolantFlowrate(
    tableOnFile=true,
    tableName="coolantFlowrate",
    fileName=fileNameRefBCs)
                       annotation (Placement(transformation(
        extent={{-80,40},{-64,56}},
        rotation=0.0,
        origin={-16,-16})));
  .Modelica.Blocks.Sources.CombiTimeTable coolantT_degC(
    tableOnFile=true,
    tableName="coolantT_degC",
    fileName=fileNameRefBCs) annotation (Placement(transformation(
        extent={{-80,40},{-64,56}},
        rotation=0.0,
        origin={-16,8})));
  parameter String fileNameRefBCs=.Modelica.Utilities.Files.loadResource(
  "modelica://EVThermal/Resources/Data/RefBCs_Cooling1.txt") "File where matrix is stored";
  .Modelica.Blocks.Sources.CombiTimeTable evapAir_phi(
    tableOnFile=true,
    tableName="evapAir_phi",
    fileName=fileNameRefBCs) annotation (Placement(transformation(
        extent={{-80,40},{-64,56}},
        rotation=0.0,
        origin={-20,-88})));
  .Modelica.Blocks.Sources.CombiTimeTable evapAir_mdot(
    tableOnFile=true,
    tableName="evapAir_mdot",
    fileName=fileNameRefBCs) annotation (Placement(transformation(
        extent={{-80,40},{-64,56}},
        rotation=0.0,
        origin={-16,-108})));
  .Modelica.Blocks.Sources.CombiTimeTable evapAirT_degC(
    tableOnFile=true,
    tableName="evapAirT_degC",
    fileName=fileNameRefBCs) annotation (Placement(transformation(
        extent={{-80,40},{-64,56}},
        rotation=0.0,
        origin={-16,-128})));
  .Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-67,-57})));
  .Modelica.Blocks.Sources.CombiTimeTable batteryTemp_degC(
    tableOnFile=true,
    tableName="batteryTemp_degC",
    fileName=fileNameRefBCs) annotation (Placement(transformation(
        extent={{80,40},{64,56}},
        rotation=0.0,
        origin={-10,32})));
    .Modelica.Blocks.Sources.CombiTimeTable coolantTout_degC(fileName = fileNameRefBCs,tableName = "coolantTout_degC",tableOnFile = true) annotation(Placement(transformation(extent = {{104.0,44.0},{88.0,60.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Sources.CombiTimeTable coolantP(fileName = fileNameRefBCs,tableName = "coolantP",tableOnFile = true) annotation(Placement(transformation(extent = {{104.0,22.0},{88.0,38.0}},rotation = 0.0,origin = {0.0,0.0})));
equation
  connect(flowSource.port, refrigerantSystem.portA)
    annotation (Line(points={{-60,10},{-50,10}}, color={0,0,255}));
  connect(pressureSource.port, refrigerantSystem.portB)
    annotation (Line(points={{60,10},{51,10}}, color={0,0,255}));
  connect(flowSourceAir.b[1, 1], refrigerantSystem.evaporatorIn) annotation (
      Line(points={{-60,-30},{-60,-15},{-50,-15}}, color={85,170,255}));
  connect(flowSinkAir.a, refrigerantSystem.evaporatorOut)
    annotation (Line(points={{60,-30},{60,-15},{50,-15}}, color={85,170,255}));
  connect(refrigerantSystem.controlBus, controlBus) annotation (Line(
      points={{0,59},{0,80}},
      color={255,204,51},
      thickness=0.5));
  connect(coolantFlowrate.y[1], flowSource.m_flow_in)
    annotation (Line(points={{-79.2,32},{-76,32},{-76,20}}, color={0,0,127}));
  connect(coolantT_degC.y[1], flowSource.T_in)
    annotation (Line(points={{-79.2,56},{-70,56},{-70,20}}, color={0,0,127}));
  connect(system.controlBus, controlBus) annotation (Line(
      points={{-20,80},{0,80}},
      color={255,204,51},
      thickness=0.5));
  connect(evapAir_phi.y[1], flowSourceAir.phi_in) annotation (Line(points={{-83.2,
          -40},{-82,-40},{-82,-36},{-79.5,-36},{-79.5,-35}}, color={0,0,127}));
  connect(evapAir_mdot.y[1], flowSourceAir.M_flow_in) annotation (Line(points={{
          -79.2,-60},{-74,-60},{-74,-39.5}}, color={0,0,127}));
  connect(toKelvin.Kelvin, flowSourceAir.T_in)
    annotation (Line(points={{-67,-51.5},{-67,-39.5}}, color={0,0,127}));
  connect(evapAirT_degC.y[1], toKelvin.Celsius) annotation (Line(points={{-79.2,
          -80},{-67,-80},{-67,-63}}, color={0,0,127}));
    connect(batteryTemp_degC.y[1],controlBus.batteryTemp_degC) annotation(Line(points = {{53.2,80},{0,80}},color = {0,0,127}));
    connect(coolantTout_degC.y[1],pressureSource.T_in) annotation(Line(points = {{87.2,52},{70,52},{70,20}},color = {0,0,127}));
    connect(coolantP.y[1],pressureSource.p_in) annotation(Line(points = {{87.2,30},{76,30},{76,20}},color = {0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1000,
      Tolerance=1e-07,
      __Dymola_Algorithm="Cvode"));
end RefSys_EvapChiller_BCbothSides;
