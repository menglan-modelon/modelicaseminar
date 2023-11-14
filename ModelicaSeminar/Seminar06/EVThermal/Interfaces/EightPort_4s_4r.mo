within ModelicaSeminar.Seminar06.EVThermal.Interfaces;

model EightPort_4s_4r
  "eleven port with 4 supply ports and 4 ports on return side"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portU(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{20.0,90.0},{40.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portV(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{50.0,90.0},{70.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portT(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-50,90},{-30,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portS(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-80,90},{-60,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portQ(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-140,90},{-120,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portX(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{108.0,90.0},{128.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portY(
    redeclare package Medium = Medium) annotation(Placement(transformation(
    extent = {{136.0,90.0},{156.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portZ(
    redeclare package Medium = Medium) annotation(Placement(transformation(extent = {{162.0,90.0},{182.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .EVThermal.Interfaces.ControlBus controlBus
    annotation (Placement(transformation(extent={{-20.0,-120.0},{20.0,-80.0}},
        rotation=0.0,
        origin={0.0,0.0})
        ));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},
            {180,100}}), graphics={Rectangle(
          extent={{-180,100},{182,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-82,-60},{80,-100}},
          lineColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{180,100}})));
end EightPort_4s_4r;
