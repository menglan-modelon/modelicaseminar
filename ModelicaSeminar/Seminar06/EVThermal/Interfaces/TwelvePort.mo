within ModelicaSeminar.Seminar06.EVThermal.Interfaces;

model TwelvePort
  "Twelve port base model"
  replaceable package Medium =
         .LiquidCooling.Media.Water.IncompressibleWater                           constrainedby
    .Modelon.Media.Templates.CompressibleLiquid
                                       annotation(choicesAllMatching);
  parameter .Modelon.Media.Units.Temperature T_start=298.15 "Initial temperature";
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portU(
      redeclare package Medium = Medium) if PortU annotation (Placement(transformation(
          extent={{20.0,90.0},{40.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portV(
      redeclare package Medium = Medium) if PortV annotation (Placement(transformation(
          extent={{60.0,90.0},{80.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portT(
      redeclare package Medium = Medium) if PortT annotation (Placement(transformation(
          extent={{-40.0,90.0},{-20.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portS(
      redeclare package Medium = Medium) if PortS annotation (Placement(transformation(
          extent={{-80.0,90.0},{-60.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portQ(
      redeclare package Medium = Medium) if PortQ annotation (Placement(transformation(
          extent={{-160.0,90.0},{-140.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portY(
    redeclare package Medium = Medium) if PortY annotation(Placement(transformation(
    extent = {{180.0,90.0},{200.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portZ(
    redeclare package Medium = Medium) if PortZ annotation(Placement(transformation(extent = {{220.0,90.0},{240.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  .EVThermal.Interfaces.ControlBus controlBus
    annotation (Placement(transformation(extent={{-20.0,-120.0},{20.0,-80.0}},
        rotation=0.0,
        origin={0.0,0.0})
        ));
    .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portP(redeclare package Medium = Medium) if PortP annotation(Placement(transformation(extent = {{-240.0,90.0},{-220.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portP_Q(redeclare package Medium = Medium) if PortP_Q annotation(Placement(transformation(extent = {{-200.0,90.0},{-180.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portW(redeclare package Medium = Medium) if PortW annotation(Placement(transformation(extent = {{100.0,90.0},{120.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portR(redeclare package Medium = Medium) if PortR annotation(Placement(transformation(extent = {{-120.0,90.0},{-100.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
    parameter Boolean PortP = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortP_Q = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortQ = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortR = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortS = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortT = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortU = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortV = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortW = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortX = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortY = true annotation(Dialog(tab = "Ports"));
    parameter Boolean PortZ = true annotation(Dialog(tab = "Ports"));
    .Modelon.ThermoFluid.Interfaces.ApplicationSpecific.LiquidFlowPort portX(redeclare package Medium = Medium) if PortX annotation(Placement(transformation(extent = {{140.0,90.0},{160.0,110.0}},rotation = 0.0,origin = {0.0,0.0})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-260,100},
            {260,-100}}), graphics={Rectangle(extent={{-260,100},{260,-100}},lineColor={28,108,200},fillColor={255,255,255},fillPattern=FillPattern.Solid,origin={-2,0}),Text(extent={{-82,-60},{80,-100}},lineColor={28,108,200},textString="%name"),Text(textString="P",origin={-229,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="P_Q",origin={-190,74},extent={{-17,10},{17,-10}}),Text(textString="Q",origin={-150,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="R",origin={-110,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="S",origin={-70,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="T",origin={-30,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="U",origin={30,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="V",origin={70,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="W",origin={110,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="X",origin={150,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="Y",origin={190,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}}),Text(textString="Z",origin={230,74},extent={{-13.978723404255305,9.949194245561145},{13,-10}})}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-240,-100},{240,100}})));
end TwelvePort;
