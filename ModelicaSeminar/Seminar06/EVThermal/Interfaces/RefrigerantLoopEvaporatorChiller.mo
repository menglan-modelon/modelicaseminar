within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model RefrigerantLoopEvaporatorChiller
  "refrigerant loop with evaporator and chiller interface"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  replaceable package AirMedium = ThermoFluidPro.Media.Air.MoistAir
    constrainedby .Modelica.Media.Interfaces.PartialCondensingGases
    "Medium in the component" annotation (choices(choice(redeclare replaceable
          package AirMedium =
                           ThermoFluidPro.Media.Air.MoistAir
          "Air: Moist air model (fog but no ice, 0..150 degC)"), choice(
          redeclare replaceable package Medium =
            ThermoFluidPro.Media.Air.NoncondensingAir
          "Air: Moist air model (non-condensing ideal gas, 200..6000 K)")));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort
                                           portA(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{-110,-10},{-90,10}}),
                                       iconTransformation(extent={{-110,-10},{-90,
            10}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidVolumePort
                                           portB(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{92,-10},{112,10}}),
                                     iconTransformation(extent={{92,-10},{112,10}})));
  .EVThermal.Interfaces.ControlBus controlBus annotation (Placement(transformation(extent={{-20,78},{20,
            118}}), iconTransformation(extent={{-10,88},{10,108}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA evaporatorIn(redeclare package Medium
      = AirMedium)
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB evaporatorOut(redeclare package
      Medium = AirMedium)
    annotation (Placement(transformation(extent={{90,-60},{110,-40}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0),
        Rectangle(
          extent={{-40,-34},{40,-60}},
          lineColor={85,170,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,12},{40,-14}},
          lineColor={0,0,255},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(extent={{-70,72},{70,6}},   lineColor={0,255,0}),
        Text(
          extent={{-100,-60},{100,-100}},
          lineColor={28,108,200},
          textString="%name"),
        Rectangle(extent={{-70,6},{70,-40}},  lineColor={0,255,0}),
        Ellipse(
          extent={{60,40},{80,20}},
          lineColor={0,255,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-40,26},{40,10}},
          textColor={28,108,200},
          textString="Chiller"),
        Text(
          extent={{-40,-18},{40,-34}},
          textColor={85,170,255},
          textString="Evaporator"),
        Polygon(
          points={{-76,40},{-70,30},{-64,40},{-76,40}},
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-76,20},{-70,30},{-64,20},{-76,20}},
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,86},{40,60}},
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RefrigerantLoopEvaporatorChiller;
