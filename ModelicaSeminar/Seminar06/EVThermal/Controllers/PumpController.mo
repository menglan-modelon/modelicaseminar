within ModelicaSeminar.Seminar06.EVThermal.Controllers;

model PumpController

  extends .ModelicaSeminar.Seminar06.EVThermal.Interfaces.Controller_Pump;  
  .Modelica.Blocks.Routing.RealPassThrough pump_speed_set
    annotation (Placement(transformation(extent={{54.0,-4.0},{62.0,4.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Blocks.Interfaces.RealOutput pump_signal annotation(Placement(transformation(extent = {{96,-10},{116,10}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Interfaces.RealInput batteryTemp_degC annotation(Placement(transformation(extent = {{-122.0,-20.0},{-82.0,20.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelon.Blocks.Tables.ModelonTable1Ds modelonTable1D(
    extrapLower = .Modelon.Types.Extrapolation.HoldLastPoint,
    extrapUpper = .Modelon.Types.Extrapolation.HoldLastPoint,
    descriptor = "DeltaT2PumpSpeed",
    table = [1,0.3;5,0.3;6,0.4;7,0.5;8,0.6;9,0.7;10,0.8;16,0.8]) annotation(Placement(transformation(extent = {{20.0,-10.0},{40.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    
    .Modelica.Blocks.Math.Abs abs annotation(Placement(transformation(extent = {{-20.0,-10.0},{0.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-50.0,-10.0},{-30.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression realExpression(y = T_nominal) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {-40.0,-40.0},rotation = 90.0)));
    parameter Real T_nominal = 25 "Target nominal temperature";
equation
    connect(abs.y,modelonTable1D.u[1]) annotation(Line(points = {{1,0},{18,0}},color = {0,0,127}));
    connect(realExpression.y,feedback.u2) annotation(Line(points = {{-40,-29},{-40,-8}},color = {0,0,127}));
    connect(feedback.y,abs.u) annotation(Line(points = {{-31,0},{-22,0}},color = {0,0,127}));
    connect(modelonTable1D.y[1],pump_speed_set.u) annotation(Line(points = {{41,0},{53.2,0}},color = {0,0,127}));
    connect(pump_speed_set.y,pump_signal) annotation(Line(points = {{62.4,0},{106,0}},color = {0,0,127}));
    connect(feedback.u1,batteryTemp_degC) annotation(Line(points = {{-48,0},{-102,0}},color = {0,0,127}));
end PumpController;
