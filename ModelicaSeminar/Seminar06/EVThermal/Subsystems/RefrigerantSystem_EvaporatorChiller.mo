within ModelicaSeminar.Seminar06.EVThermal.Subsystems;
model RefrigerantSystem_EvaporatorChiller
  "refrigerant loop subsystem with evaporator and chiller in parallel"
  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.RefrigerantLoopEvaporatorChiller(redeclare replaceable
      package Medium =   .LiquidCooling.Media.AqueousSolutions.EthyleneGlycolWater50);
  RefrigerantSystem refrigerantSystem(redeclare package CoolantMedium = Medium,
      redeclare package AirMedium = AirMedium,redeclare replaceable package RefrigerantMedium = .AirConditioning.ThermoFluidPro.Media.ReferenceProperties.R1234yf)
    annotation (Placement(transformation(extent={{-27.604212887091933,-38.0},{48.39578711290807,26.0}},rotation = 0.0,origin = {0.0,0.0})));
  AirConditioning.Reservoirs.Air.FlowSourceAir  airIn_cond(redeclare package      Medium = AirMedium)                                  annotation (Placement(
        transformation(extent={{-84,42},{-64,62}}, rotation=0)));
  AirConditioning.Reservoirs.Air.FlowSinkAir  airOut_cond(redeclare package      Medium = AirMedium)                                 annotation (Placement(
        transformation(extent={{-84,-40},{-64,-20}},
                                                   rotation=0)));
.AirConditioning.ThermoFluidPro.Components.Compressors.Speed rps(phi(fixed=true, start=0), exact= true)  "rotational speed of compressor"  annotation (Placement(transformation(extent={{51,71},{69,89}}, rotation=0)));
  .Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-59,71})));
equation
  connect(refrigerantSystem.frontEvap_airOut, evaporatorOut) annotation (Line(
        points={{73.99578711290808,-33.2},{80,-33.2},{80,-50},{100,-50}}, color={85,170,255}));
  connect(evaporatorIn, refrigerantSystem.frontEvap_airIn) annotation (Line(
        points={{-100,-50},{-100,-80},{84,-80},{84,-3.5999999999999996},{74.39578711290807,-3.5999999999999996}},
        color={85,170,255}));
  connect(refrigerantSystem.coolant_out, portB) annotation (Line(points={{-1.7042128870919324,-64.30000000000001},{-1.7042128870919324,-76},{88,-76},{88,0},{102,0}},         color={0,0,255}));
  connect(portA, refrigerantSystem.coolant_in) annotation (Line(points={{-100,0},{-88,0},{-88,-72},{21.395787112908067,-72},{21.395787112908067,-64}}, color={0,0,255}));
  connect(controlBus, refrigerantSystem.controlBus) annotation (Line(
      points={{0,98},{0,86},{-84,86},{-84,-58},{-60.60421288709193,-58}},
      color={255,204,51},
      thickness=0.5));
  connect(airOut_cond.a, refrigerantSystem.condenser_airOut) annotation (Line(
        points={{-64,-30},{-59.60421288709193,-30},{-59.60421288709193,-13}}, color={85,170,255}));
  connect(airIn_cond.b[1, 1], refrigerantSystem.condenser_airIn) annotation (
      Line(points={{-64,52},{-59.60421288709193,52},{-59.60421288709193,34.6}}, color={85,170,255}));
  connect(rps.flange, refrigerantSystem.compressorShaft)
    annotation (Line(points={{69,80},{74.39578711290807,80},{74.39578711290807,30}}, color={0,0,0}));
  connect(rps.inPort, controlBus.compSpeed) annotation (Line(points={{49.2,80},
          {0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(toKelvin.Celsius, controlBus.condenserT_degC) annotation (Line(points=
         {{-53,71},{0,71},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(toKelvin.Kelvin, airIn_cond.T_in) annotation (Line(points={{-64.5,71},
          {-71,71},{-71,61.5}}, color={0,0,127}));
  connect(airIn_cond.M_flow_in, controlBus.mdot_airCondenser) annotation (Line(
        points={{-78,61.5},{-78,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(airIn_cond.phi_in, controlBus.condenserPhi) annotation (Line(points={
          {-83.5,57},{-88,57},{-88,80},{0,80},{0,98}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
end RefrigerantSystem_EvaporatorChiller;
