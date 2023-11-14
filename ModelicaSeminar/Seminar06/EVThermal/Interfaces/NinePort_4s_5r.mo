within ModelicaSeminar.Seminar06.EVThermal.Interfaces;
model NinePort_4s_5r
  "nine port with 4 supply ports and 5 ports on return side"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort
                                           portA(redeclare package Medium =
        Medium)                                                            annotation (Placement(transformation(
          extent={{150,90},{170,110}}),iconTransformation(extent={{150,90},{170,
            110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portB(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{110,90},{130,110}}), iconTransformation(extent={{110,90},{130,
            110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portD(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{30,90},{50,110}}), iconTransformation(extent={{30,90},{50,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portC(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{70,90},{90,110}}), iconTransformation(extent={{70,90},{90,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port1(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-50,90},{-30,110}}), iconTransformation(extent={{-50,90},{-30,
            110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port2(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-80,90},{-60,110}}), iconTransformation(extent={{-80,90},{-60,
            110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port3(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-110,90},{-90,110}}), iconTransformation(extent={{-110,90},{-90,
            110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port4(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-140,90},{-120,110}}), iconTransformation(extent={{-140,90},{
            -120,110}})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort port5(
      redeclare package Medium = Medium) annotation (Placement(transformation(
          extent={{-170,90},{-150,110}}), iconTransformation(extent={{-170,90},{
            -150,110}})));
  ControlBus controlBus
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={0,100}),
        iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,100})));
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
end NinePort_4s_5r;
