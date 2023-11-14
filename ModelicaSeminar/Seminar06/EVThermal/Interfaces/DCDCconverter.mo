within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
partial model DCDCconverter "DC-DC converter model interface"
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
        Polygon(
          visible=not hide_component_icon,
          points={{-70,32},{-50,52},{70,52},{50,32},{-70,32}},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          visible=not hide_component_icon,
          points={{50,-68},{50,32},{70,52},{70,-48},{50,-68}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          visible=not hide_component_icon,
          extent={{-70,32},{50,-68}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          visible=not hide_component_icon,
          points={{-50,52},{-70,32},{-70,-68},{50,-68},{70,-48},{70,52},{-50,52}},
                        lineColor={0,0,0}),
        Line(visible=not hide_component_icon,
          points={{40,22},{-60,-58}}, color={0,0,0}),
      Line(visible=not hide_component_icon,points={{-56,12},{-16,12}}, color={0,0,0}),
      Line(visible=not hide_component_icon,points={{-56,2},{-42,2}},   color={0,0,0}),
      Line(visible=not hide_component_icon,points={{-30,2},{-16,2}},   color={0,0,0}),
      Line(visible=not hide_component_icon,points={{-4,-38},{36,-38}}, color={0,0,0}),
      Line(visible=not hide_component_icon,points={{-4,-48},{10,-48}}, color={0,0,0}),
      Line(visible=not hide_component_icon,points={{22,-48},{36,-48}}, color={0,0,0})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DCDCconverter;
