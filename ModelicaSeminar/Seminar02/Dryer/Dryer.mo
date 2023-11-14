within ModelicaSeminar.Seminar02.Dryer;
  
  model Dryer
    extends .Modelica.Icons.Example;
  
    .ModelicaSeminar.Seminar02.Dryer.Components.ElectricCircuitCompo electricCircuitCompo annotation(
      Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{-94.02754490145811,-48.027544901458114},{-49.972455098541886,-3.972455098541886}}, rotation = 0.0)));
    .ModelicaSeminar.Seminar02.Dryer.Components.MotorMechanicalCompo motorMechanicalCompo annotation(
      Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{20.22702115974559,20.22702115974559},{59.77297884025441,59.77297884025441}}, rotation = 0.0)));
    .ModelicaSeminar.Seminar02.Dryer.Components.HeatPipeCompo heatPipeCompo annotation(
      Placement(visible = true, transformation(origin = {0.0,0.0}, extent = {{33.29948371588095,-80.70051628411905},{78.70051628411905,-35.29948371588095}}, rotation = 0.0)));
  equation
    connect(motorMechanicalCompo.pin_p, electricCircuitCompo.pin_p) annotation(
      Line(points = {{20.622480736550678,55.422923495398436},{-34,55.422923495398436},{-34,-7.937413180804345},{-49.972455098541886,-7.937413180804345}}, color = {0, 0, 255}));
    connect(motorMechanicalCompo.pin_n, electricCircuitCompo.pin_n) annotation(
      Line(points = {{19.831561582940502,32.090808463898234},{-20,32.090808463898234},{-20,-16.74843114138759},{-49.53190420051273,-16.74843114138759}}, color = {0, 0, 255}));
    connect(electricCircuitCompo.port_a, heatPipeCompo.port_b) annotation(
      Line(points = {{-49.53190420051273,-43.62203592116649},{-46,-43.62203592116649},{-46,-69.35025814205952},{33.753494041563336,-69.35025814205952}}, color = {191, 0, 0}));
    connect(motorMechanicalCompo.flange_a, heatPipeCompo.flange_b) annotation(
      Line(points = {{59.77297884025441,35.254485078338945},{94,35.254485078338945},{94,-4},{20,-4},{20,-44.37969022952857},{33.29948371588095,-44.37969022952857}}));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.001),
      Diagram);
  end Dryer;
