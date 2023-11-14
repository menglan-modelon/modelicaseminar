within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model ComponentController
  extends .Modelon.Icons.DigitalController;
  ControlBus controlBus annotation (Placement(transformation(extent={{-20,-20},
            {20,20}},
        rotation=270,
        origin={100,0}),
                    iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,0})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-100,90},{100,50}},
          lineColor={0,0,0},
          fillColor={0,140,72},
          fillPattern=FillPattern.Solid,
          textString="%name"),
                Text(
          extent={{-30,40},{30,-20}},
          lineColor={0,128,0},
          textString="C",
          textStyle={TextStyle.Bold})}),                         Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ComponentController;
