within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model CabinEvaporator
  "cabin model interface with external evaporator interface"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  replaceable package AirMedium = .AirConditioning.ThermoFluidPro.Media.Air.MoistAir
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
  ControlBus controlBus annotation (Placement(transformation(extent={{-20,78},{20,
            118}}), iconTransformation(extent={{-10,50},{10,70}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowA evaporatorOut(redeclare package
      Medium = AirMedium)
    annotation (Placement(transformation(extent={{-110,40},{-90,60}})));
  .AirConditioning.ThermoFluidPro.Interfaces.AirFlow.FlowB evaporatorIn(redeclare package Medium =
        AirMedium)
    annotation (Placement(transformation(extent={{90,40},{110,60}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(extent={{-100,-60},{100,-100}},lineColor={28,108,200},textString="%name"),Bitmap(extent={{-76,-102},{85,83}},fileName="modelica://AirConditioning/Resources/Images/cabin.png",origin={-2,10})}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CabinEvaporator;
