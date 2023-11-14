within ModelicaSeminar.Seminar06.EVThermal.Interfaces;

partial model BrakeSteering "Brake/Steering model interface"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
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
  .ModelicaSeminar.Seminar06.EVThermal.Interfaces.ControlBus controlBus annotation (Placement(transformation(extent={{-20,78},{20,
            118}}), iconTransformation(extent={{-10,50},{10,70}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(extent={{-100,-60},{100,-100}},lineColor={28,108,200},textString="%name"),Ellipse(extent={{2,-8},{26,-32}},lineColor={0,0,255},pattern=LinePattern.None,fillColor={255,255,255},fillPattern=FillPattern.Solid),Bitmap(origin={2,4},extent={{-70,-81},{70,81}},fileName="modelica://ModelicaSeminar/Resources/BrakeSteering.png")}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BrakeSteering;
