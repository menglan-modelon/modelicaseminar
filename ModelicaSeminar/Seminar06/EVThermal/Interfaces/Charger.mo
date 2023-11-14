within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model Charger "charger model interface"
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
        Text(
          extent={{-100,-60},{100,-100}},
          lineColor={28,108,200},
          textString="%name"),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={0,0,0},
          pattern=LinePattern.Dot,
          lineThickness=1),
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-12,36},{12,12}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,18},{38,-6}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{2,-8},{26,-32}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-28,-8},{-4,-32}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-36,20},{-12,-4}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-32,16},{-16,0}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,204,51},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-8,32},{8,16}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,204,51},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{18,14},{34,-2}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,204,51},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{6,-12},{22,-28}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,204,51},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-24,-12},{-8,-28}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,204,51},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Charger;
