within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
model AirFlow
  replaceable package Medium =
     .Modelon.Media.PreDefined.IdealGases.FastDryAir           constrainedby
    .Modelon.Media.Templates.IdealGas           annotation(choicesAllMatching);
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.AirFlowPort
                                        port(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  ControlBus controlBus annotation (Placement(transformation(extent={{-20,78},{20,
            118}}), iconTransformation(extent={{10,50},{30,70}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-42,62},{82,-62}},
          startAngle=-90,
          endAngle=90,
          fillColor=DynamicSelect({255,255,255}, if enable_visualization then
              outletColor else {255,255,255}),
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Line(points={{-60,60},{-20,60},{0,20},{40,20},{60,60},{100,60}},  color={0,0,
              255}),
        Line(points={{-60,-60},{-20,-60},{0,-20},{40,-20},{60,-60},{100,-60}},
            color={0,0,255}),
        Ellipse(
          extent={{-30,50},{70,-50}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,46},{26,2}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{14,-2},{26,-46}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{22,6},{66,-6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-26,6},{18,-6}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{16,4},{24,-4}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end AirFlow;
