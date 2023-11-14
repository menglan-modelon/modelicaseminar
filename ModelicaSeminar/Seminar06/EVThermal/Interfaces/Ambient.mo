within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model Ambient "ambient model interface"

  ControlBus controlBus annotation (Placement(transformation(extent={{-20,-20},{
            20,20}},
        rotation=270,
        origin={100,0}),
                    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-60,60},{60,-60}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,-58},{10,-58},{0,-80},{-10,-58}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-10,11},{10,11},{0,-11},{-10,11}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          origin={70,-1},
          rotation=90),
        Polygon(
          points={{-10,11},{10,11},{0,-11},{-10,11}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          origin={0,69},
          rotation=180),
        Polygon(
          points={{-10,11},{10,11},{0,-11},{-10,11}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid,
          origin={-68,1},
          rotation=270),
        Text(
          extent={{-100,108},{100,68}},
          lineColor={255,255,255},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Ambient;
