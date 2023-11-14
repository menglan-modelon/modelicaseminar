within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model PTCHeater
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
  ControlBus controlBus annotation (Placement(transformation(extent={{-20,78},{20,
            118}}), iconTransformation(extent={{-10,50},{10,70}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-80,60},{80,-60}}, lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,20},{-60,-20},{-40,20},{-20,-20},{0,20},{20,-20},{40,20},
              {60,-20},{80,20}}, color={238,46,47}),
        Text(
          extent={{-100,-60},{100,-100}},
          lineColor={238,46,47},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PTCHeater;
