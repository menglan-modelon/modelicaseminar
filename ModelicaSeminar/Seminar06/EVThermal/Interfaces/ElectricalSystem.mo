within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model ElectricalSystem

  ControlBus controlBus annotation (Placement(transformation(extent={{-20,-20},
            {20,20}},
        rotation=270,
        origin={100,0}),
                    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-100,96},{100,56}},
          lineColor={28,108,200},
          fillColor={0,140,72},
          fillPattern=FillPattern.Solid,
          textString="%name"),
    Line(
      origin={1,52},
      points={{-61.0,-45.0},{-61.0,-10.0},{-26.0,-10.0}},
          color={28,108,200}),
    Line(
      origin={-2,57},
      points={{-83.0,-50.0},{-33.0,-50.0}},
          color={28,108,200}),
    Line(
      origin={-3,47},
      points={{-72.0,-55.0},{-42.0,-55.0}},
          color={28,108,200}),
    Line(
      origin={6.259,50},
      points={{53.7407,-58.0},{53.7407,-93.0},{-66.2593,-93.0},{-66.2593,-58.0}},
          color={28,108,200}),
    Line(
      origin={8,50},
      points={{32.0,-58.0},{72.0,-58.0}},
          color={28,108,200}),
    Line(
      origin={9,56},
      points={{31.0,-49.0},{71.0,-49.0}},
          color={28,108,200}),
    Line(
      origin={7,52},
      points={{18.0,-10.0},{53.0,-10.0},{53.0,-45.0}},
          color={28,108,200}),
    Rectangle(
      origin={20.312,84.8571},
      extent={{-45.3125,-57.8571},{4.6875,-27.8571}},
          lineColor={28,108,200})}),                             Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ElectricalSystem;
