within ModelicaSeminar.Seminar05.CityLib;

    package Examples
    extends Modelica.Icons.ExamplesPackage;
        model TestBattery
    extends Modelica.Icons.Example;
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(initialSOC = 0,maxWh = 1) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{6.0,16.0},{34.0,44.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SignalPower signalPower annotation(Placement(visible = true,transformation(origin = {-20.0,0.0},extent = {{-12.0,-12.0},{12.0,12.0}},rotation = 90.0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = 4,f = 1) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-68.0,-10.0},{-48.0,10.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-30.0,-60.0},{-10.0,-40.0}},rotation = 0.0)));
        equation
            connect(ground.electricity,signalPower.p) annotation(Line(points = {{-20,-40},{-20,-12}}));
            connect(sine.y,signalPower.Pflow_in) annotation(Line(points = {{-47,0},{-30.799999999999997,0}},color = {0,0,127}));
            connect(signalPower.n,battery.p) annotation(Line(points = {{-20,12.239999999999995},{-20,30},{5.999999999999998,30}}));
            connect(battery.n,signalPower.p) annotation(Line(points = {{34.28,30},{60,30},{60,-30},{-20,-30},{-20,-12}}));
            annotation(experiment(StartTime = 0,StopTime = 1,Tolerance = 1e-6,Interval = 0.002));
        end TestBattery;
        model TestBattery2
    extends Modelica.Icons.Example;
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery1(initialSOC = 1,maxWh = 2,minSOC = 0) annotation(Placement(visible = true,transformation(origin = {-20.33333333333333,1.0},extent = {{-16.0,-16.0},{16.0,16.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery2(initialSOC = 0,maxWh = 1) annotation(Placement(visible = true,transformation(origin = {40.0,0.0},extent = {{-15.0,-15.0},{15.0,15.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-30.0,-80.0},{-10.0,-60.0}},rotation = 0.0)));
        equation
            connect(battery1.n,battery2.n) annotation(Line(points = {{-20.33333333333333,17},{-20.33333333333333,40},{40,40},{40,15.3}}));
            connect(battery1.p,battery2.p) annotation(Line(points = {{-20.33333333333333,-15},{-20.33333333333333,-40},{40,-40},{40,-15}}));
            connect(ground.electricity,battery1.p) annotation(Line(points = {{-20,-60},{-20.33333333333333,-60},{-20.33333333333333,-15}}));
        protected
            annotation(experiment(StartTime = 0,StopTime = 2,Tolerance = 1e-06,Interval = 0.004));
        end TestBattery2;
        model TestWindPower
        extends Modelica.Icons.Example;
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-95.1310005899219,-29.1310005899219},{-36.8689994100781,29.1310005899219}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(initialSOC = 0.1,maxSOC = 1,maxWh = 1069e3 * 3600 * 10) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{32.0,22.0},{68.0,58.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0,-54},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-18.0,-18.0},{18.0,18.0}},rotation = 90.0)));
        equation
                    overPower = battery.Pflow - battery.Pfb;   
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-41.52995950446561,-0.5826200117984381},{-41.52995950446561,0.18000000000000357},{-16.38,0.18000000000000357}},color = {0,0,127}));
            connect(windPower.n,battery.p) annotation(Line(points = {{4.076738946423575e-15,18.36},{4.076738946423575e-15,40},{32,40}}));
            connect(battery.n,windPower.p) annotation(Line(points = {{68.36,40},{80,40},{80,-32},{-3.9968028886505635e-15,-32},{-3.9968028886505635e-15,-18}}));
            connect(ground.electricity,windPower.p) annotation(Line(points = {{0,-44},{0,-18},{-3.9968028886505635e-15,-18}}));

            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestWindPower;
        model TestWindPower2
        extends Modelica.Icons.Example;
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-100.0,22.0},{-64.0,58.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {-40,10},extent = {{-16,-16},{16,16}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-50.0,-64.0},{-30.0,-44.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home annotation(Placement(visible = true,transformation(origin = {10.0,10.0},extent = {{-16.0,-16.0},{16.0,16.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(maxWh = 1e10,v_max = 100) annotation(Placement(visible = true,transformation(origin = {60.0,8.0},extent = {{-12.0,-12.0},{12.0,12.0}},rotation = -90.0)));
        equation
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-66.88,39.64},{-60,39.64},{-60,10},{-55,10}},color = {0,0,127}));
            connect(windPower.n,home.n) annotation(Line(points = {{-40,26},{-40,40},{10.000000000000004,40},{10.000000000000004,26.32}}));
            connect(home.n,battery.p) annotation(Line(points = {{10.000000000000004,26.32},{10.000000000000004,40},{60,40},{60,20}}));
            connect(ground.electricity,windPower.p) annotation(Line(points = {{-40,-44},{-40,-6}}));
            overPower = battery.Pflow - battery.Pfb;
        connect(windPower.p,home.p) annotation(Line(points = {{-40,-6},{-40,-14},{1.9999999999999964,-14},{1.9999999999999964,-8}},color = {0,0,0}));
        connect(battery.n,home.p) annotation(Line(points = {{58,-6.239999999999998},{58,-14},{-3.552713678800501e-15,-14},{-3.552713678800501e-15,-8}},color = {0,0,0}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestWindPower2;
        model TestBattery3
        extends Modelica.Icons.Example;
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery1(initialSOC = 0.5,maxWh = 2,minSOC = 0) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-6.0,14.0},{26.0,46.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery2(initialSOC = 0,maxWh = 1) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{45.0,15.0},{75.0,45.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-40.0,-80.0},{-20.0,-60.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SignalPower signalPower annotation(Placement(visible = true,transformation(origin = {-30.0,-10.0},extent = {{-14.0,-14.0},{14.0,14.0}},rotation = 90.0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = 0.1,f = 1) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-80.0,-20.0},{-60.0,0.0}},rotation = 0.0)));
        equation
     overPower = battery1.Pflow - max(battery1.Pfb,battery2.Pfb);
    
            connect(sine.y,signalPower.Pflow_in) annotation(Line(points = {{-59,-10},{-42.6,-10},{-42.6,-9.999999999999996}},color = {0,0,127}));
            connect(signalPower.n,battery1.p) annotation(Line(points = {{-29.999999999999996,4.280000000000001},{-29.999999999999996,30},{-6,30}}));
            connect(battery1.n,battery2.p) annotation(Line(points = {{26.32,30},{45,30}}));
            connect(battery2.n,signalPower.p) annotation(Line(points = {{75.3,30},{90,30},{90,-40},{-30.000000000000004,-40},{-30.000000000000004,-24}}));
            connect(ground.electricity,signalPower.p) annotation(Line(points = {{-30,-60},{-30,-24},{-30.000000000000004,-24}}));
           
       // protected
            annotation(experiment(StartTime = 0,StopTime = 2,Tolerance = 1e-06,Interval = 0.004));
        end TestBattery3;
        model TestWindPower3
    extends Modelica.Icons.Example;
    
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-114.0,62.0},{-78.0,98.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {-60.0,60.0},extent = {{-16.0,-16.0},{16.0,16.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-70.0,-12.0},{-50.0,8.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home annotation(Placement(visible = true,transformation(origin = {50.0,60.0},extent = {{-13.0,-13.0},{13.0,13.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery genBat(R = 1e-2,initialSOC = 0,maxWh = 1069e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {-20.0,60.0},extent = {{-12.0,-12.0},{12.0,12.0}},rotation = -90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery homeBat(R = 1e-2,initialSOC = 0.5,maxWh = 500 * 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {92,60},extent = {{-12,-12},{12,12}},rotation = -90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity2 annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-110.0,-58.0},{-74.0,-22.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower2 annotation(Placement(visible = true,transformation(origin = {-40.0,-54.0},extent = {{-16.0,-16.0},{16.0,16.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery genBat2(R = 1e-2,initialSOC = 0,maxWh = 1069e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{38.0,-44.0},{62.0,-20.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home2 annotation(Placement(visible = true,transformation(origin = {0.0,-50.0},extent = {{-13.0,-13.0},{13.0,13.0}},rotation = 90.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground2 annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-50.0,-100.0},{-30.0,-80.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery homeBat2(R = 1e-2,initialSOC = 0.5,maxWh = 500 * 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {88.0,-50.0},extent = {{-12.0,-12.0},{12.0,12.0}},rotation = -90.0)));
        equation
                overPower = genBat.Pflow - max(genBat.Pfb,homeBat.Pfb);
    
            connect(homeBat.n,home.p) annotation(Line(points = {{92,47.76},{92,20},{50,20},{50,47}}));
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-80.88,79.64},{-80.88,60.160000000000004},{-74.56,60.160000000000004}},color = {0,0,127}));

            connect(genBat.n,windPower.p) annotation(Line(points = {{-19.999999999999996,47.760000000000005},{-19.999999999999996,20},{-60,20},{-60,44}}));
            connect(windPower.n,genBat.p) annotation(Line(points = {{-59.99999999999999,76.32},{-59.99999999999999,96.32},{-20.000000000000004,96.32},{-20.000000000000004,72}}));
            connect(genBat.n,home.p) annotation(Line(points = {{-19.999999999999996,47.760000000000005},{-19.999999999999996,20},{50,20},{50,47}}));
            connect(ground.electricity,windPower.p) annotation(Line(points = {{-60,8},{-60,44}}));
            connect(genBat.p,homeBat.p) annotation(Line(points = {{-20.000000000000004,72},{-20.000000000000004,96},{92,96},{92,72}}));
            connect(genBat.p,home.n) annotation(Line(points = {{-20.000000000000004,72},{-20.000000000000004,96},{50,96},{50,73.26}}));
            connect(windVelocity2.v,windPower2.vWind) annotation(Line(points = {{-76.88,-40.36},{-64,-40.36},{-64,-53.839999999999996},{-54.56,-53.839999999999996}},color = {0,0,127}));
            connect(windPower2.n,genBat2.p) annotation(Line(points = {{-39.99999999999999,-37.68},{-39.99999999999999,-32},{38,-32}}));
            connect(genBat2.p,home2.n) annotation(Line(points = {{38,-32},{2.9443114613059155e-15,-32},{2.9443114613059155e-15,-36.739999999999995}}));
            connect(windPower2.p,ground2.electricity) annotation(Line(points = {{-40,-70},{-40,-80}}));
            connect(windPower2.p,home2.p) annotation(Line(points = {{-40,-70},{-40,-74},{-2.886579864025407e-15,-74},{-2.886579864025407e-15,-63}}));
            connect(genBat2.n,homeBat2.p) annotation(Line(points = {{62.239999999999995,-32},{88,-32},{88,-38}}));
            connect(homeBat2.n,ground2.electricity) annotation(Line(points = {{88,-62.239999999999995},{88,-74},{-40,-74},{-40,-80}}));
            connect(home.n,homeBat.p) annotation(Line(points = {{50,73.26},{50,96},{92,96},{92,72}}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestWindPower3;
        model TestSolarPower
    extends Modelica.Icons.Example;
    
            parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery homeBat(R = 1e-2,initialSOC = 0.,maxWh = 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {8,52},extent = {{-14,-14},{14,14}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {-40,-10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower homePV(A = 3 * 10,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-40,36},extent = {{-10,-10},{10,10}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-78,36},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
                overPower = homeBat.Pflow - homeBat.Pfb;
    
            connect(homePV.n,homeBat.p) annotation(Line(points = {{-40,46},{-40,52},{-6,52}}));
            connect(homeBat.n,homePV.p) annotation(Line(points = {{22,52},{40,52},{40,12},{-40,12},{-40,26}}));
            connect(homePV.p,ground.electricity) annotation(Line(points = {{-40,26},{-40,0}}));
            connect(sunShine.sun,homePV.sun) annotation(Line(points = {{-70,36},{-50,36}},color = {0,0,127}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestSolarPower;
        model TestGenHome
    extends Modelica.Icons.Example;
            parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {-87,85},extent = {{-13,-13},{13,13}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {-22,56},extent = {{-16,-16},{16,16}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {-46,-96},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home annotation(Placement(visible = true,transformation(origin = {-20,-56},extent = {{-13,-13},{13,13}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery genBat(R = 1e-2,maxWh = 1069e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {40,18},extent = {{-12,-12},{12,12}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery homeBat(R = 1e-2,maxWh = 500 * 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {82,-30},extent = {{-12,-12},{12,12}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower genPV(A = 50 * 400,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-22,18},extent = {{-15,-15},{15,15}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower homePV(A = 500 * 3 * 10,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-22,-20},extent = {{-15,-15},{15,15}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-84,38},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
                overPower = genBat.Pflow - max(genBat.Pfb,homeBat.Pfb);
    
            connect(home.n,genBat.p) annotation(Line(points = {{-7,-56},{-7,18},{28,18}}));
            connect(genBat.n,homeBat.p) annotation(Line(points = {{52,18},{60,18},{60,-30},{70,-30}}));
            connect(homeBat.n,home.p) annotation(Line(points = {{94,-30},{94,-74},{-46,-74},{-46,-55.2969},{-33,-55.2969},{-33,-56}}));
            connect(windPower.n,home.n) annotation(Line(points = {{-6,56},{-6,-6.5},{-5.68,-6.5},{-5.68,-57}}));
            connect(windPower.p,home.p) annotation(Line(points = {{-38,56},{-46,56},{-46,-57},{-32,-57}}));
            connect(ground.electricity,home.p) annotation(Line(points = {{-46,-86},{-46,-56},{-33,-56}}));
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-76,85},{-22,85},{-22,71}},color = {0,0,127}));
            connect(genPV.n,windPower.n) annotation(Line(points = {{-6.7,18},{-6.7,31.5},{-6,31.5},{-6,56}}));
            connect(genPV.p,windPower.p) annotation(Line(points = {{-37,18},{-47,18},{-47,56},{-38,56}}));
            connect(homePV.n,home.n) annotation(Line(points = {{-7,-20},{-7,-37.5},{-6.7,-37.5},{-6.7,-55}}));

            connect(homePV.p,home.p) annotation(Line(points = {{-37,-20},{-46,-20},{-46,-56},{-32,-56}}));
            connect(sunShine.sun,genPV.sun) annotation(Line(points = {{-76,38},{-22,38},{-22,32}},color = {0,0,127}));
            connect(sunShine.sun,homePV.sun) annotation(Line(points = {{-76,38},{-64,38},{-64,0},{-22,0},{-22,-6}},color = {0,0,127}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestGenHome;
        model TestGeneratorArea
        extends Modelica.Icons.Example;
            parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            Real Hr = time / 3600 "Time [Hr]";
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {-52,-6},extent = {{-18,-18},{18,18}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(initialSOC = 0.1,maxSOC = 1,maxWh = 1069e3 * 3600 * 10) annotation(Placement(visible = true,transformation(origin = {100,-4},extent = {{-18,-18},{18,18}},rotation = -90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {0,-54},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {8.88178e-16,-6},extent = {{-18,-18},{18,18}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-52,48},extent = {{-16,-16},{16,16}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower genPV(A = 50 * 400,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {52,-6},extent = {{-17,-17},{17,17}},rotation = 90)));
        equation
                overPower = battery.Pflow - battery.Pfb;
    
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-37,-6},{-16,-6}},color = {0,0,127}));
            connect(windPower.n,battery.p) annotation(Line(points = {{0,12},{0,26},{100,26},{100,14}}));
            connect(battery.n,windPower.p) annotation(Line(points = {{100,-22},{100,-32},{0,-32},{0,-24}}));
            connect(ground.electricity,windPower.p) annotation(Line(points = {{0,-44},{0,-24}}));
            connect(sunShine.sun,genPV.sun) annotation(Line(points = {{-38,48},{24,48},{24,-6},{36,-6}},color = {0,0,127}));
            connect(windPower.n,genPV.n) annotation(Line(points = {{0,12},{0,26},{52,26},{52,12}}));
            connect(windPower.p,genPV.p) annotation(Line(points = {{0,-24},{0,-32},{52,-32},{52,-22}}));

            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestGeneratorArea;
        model TestHomeArea
            extends Modelica.Icons.Example;
    
            parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            Real Hr = time / 3600 "Time [Hr]";
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {-40,-70},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home annotation(Placement(visible = true,transformation(origin = {11,-1},extent = {{-15,-15},{15,15}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(maxWh = 500 * 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {58,-2},extent = {{-12,-12},{12,12}},rotation = -90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-86,-2},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower homePV(A = 500 * 3 * 10,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-40,-2},extent = {{-15,-15},{15,15}},rotation = 90)));
        equation
            overPower = battery.Pflow - battery.Pfb;
    
            connect(home.n,battery.p) annotation(Line(points = {{11,14},{11,40},{58,40},{58,10.32}}));
            connect(home.p,battery.n) annotation(Line(points = {{11,-16},{11,-40},{58,-40},{58,-14}}));
            connect(sunShine.sun,homePV.sun) annotation(Line(points = {{-78,-2},{-54,-2}},color = {0,0,127}));
            connect(homePV.p,ground.electricity) annotation(Line(points = {{-40,-16},{-40,-60}}));
        connect(homePV.n,home.n) annotation(Line(points = {{-40,13.3},{-40,40},{11.000000000000004,40},{11.000000000000004,14.3}},color = {0,0,0}));
        connect(homePV.p,home.p) annotation(Line(points = {{-40,-17},{-40,-40},{10.999999999999996,-40},{10.999999999999996,-16}},color = {0,0,0}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestHomeArea;

model TestPublicArea
    extends Modelica.Icons.Example;
    parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            Real Hr = time / 3600 "Time [Hr]";
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {-40,-50},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-86,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower publicPV(A = 30 * 40,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-40,2.22045e-16},extent = {{-12,-12},{12,12}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery battery(R = 1e-2,maxWh = 24 * 2 * 200e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {46,0},extent = {{-12,-12},{12,12}},rotation = -90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SignalPower powerPublic annotation(Placement(visible = true,transformation(origin = {6,0},extent = {{-10,-10},{10,10}},rotation = 90)));
            .Modelica.Blocks.Sources.Constant publicPflow(k = -2 * 200e3) annotation(Placement(visible = true,transformation(origin = {-36,54},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            overPower = battery.Pflow - battery.Pfb;
            connect(sunShine.sun,publicPV.sun) annotation(Line(points = {{-78,0},{-51,0}},color = {0,0,127}));
            connect(publicPflow.y,powerPublic.Pflow_in) annotation(Line(points = {{-24,54},{-14,54},{-14,0},{-2,0}},color = {0,0,127}));
            connect(publicPV.n,powerPublic.n) annotation(Line(points = {{-40,12},{-42,12},{-42,30},{6,30},{6,10}}));
            connect(powerPublic.n,battery.p) annotation(Line(points = {{6,10},{6,30},{46,30},{46,12}}));
            connect(publicPV.p,powerPublic.p) annotation(Line(points = {{-40,-12},{-40,-24},{6,-24},{6,-10}}));
            connect(powerPublic.p,battery.n) annotation(Line(points = {{6,-10},{6,-24},{46,-24},{46,-12}}));
            connect(ground.electricity,publicPV.p) annotation(Line(points = {{-40,-40},{-40,-12}}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestPublicArea;
        model TestCityAllArea
            extends Modelica.Icons.Example;
            parameter Real eta_c = 1;
            .Modelica.Units.SI.Power overPower;
            Real Hr = time / 3600 "Time [Hr]";
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindVelocity windVelocity annotation(Placement(visible = true,transformation(origin = {-224,-38},extent = {{-14,-14},{14,14}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.WindPower windPower annotation(Placement(visible = true,transformation(origin = {-190,-38},extent = {{-16,-16},{16,16}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Ground ground annotation(Placement(visible = true,transformation(origin = {-190,-90},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.Home home annotation(Placement(visible = true,transformation(origin = {-53,-39},extent = {{-13,-13},{13,13}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery genBat(R = 1e-2,maxWh = 1069e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {74,0},extent = {{-12,-12},{12,12}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery homeBat(R = 1e-2,maxWh = 500 * 30e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {124,0},extent = {{-12,-12},{12,12}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower genPV(A = 50 * 400,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-139,-39},extent = {{-15,-15},{15,15}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower homePV(A = 500 * 3 * 10,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-85,-39},extent = {{-15,-15},{15,15}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SolarPower publicPV(A = 30 * 40,eta_c = eta_c) annotation(Placement(visible = true,transformation(origin = {-5,-41},extent = {{-15,-15},{15,15}},rotation = 90)));
            .ModelicaSeminar.Seminar05.CityLib.Components.Battery publicBat(R = 1e-2,maxWh = 24 * 2 * 200e3 * 3600,v_max = 100) annotation(Placement(visible = true,transformation(origin = {172,0},extent = {{-12,-12},{12,12}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SunShine sunShine annotation(Placement(visible = true,transformation(origin = {-218,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Constant publicPflow(k = -2 * 200e3) annotation(Placement(visible = true,transformation(origin = {-38,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar05.CityLib.Sources.SignalPower publicPower annotation(Placement(visible = true,transformation(origin = {32,-40},extent = {{-10,-10},{10,10}},rotation = 90)));
        equation
          overPower = genBat.Pflow - max([genBat.Pfb,homeBat.Pfb,publicBat.Pfb]);
            connect(genBat.n,homeBat.p) annotation(Line(points = {{86.24,0},{112.24,0}}));
            connect(windVelocity.v,windPower.vWind) annotation(Line(points = {{-212,-38},{-205,-38}},color = {0,0,127}));
            connect(sunShine.sun,genPV.sun) annotation(Line(points = {{-210,20},{-165,20},{-165,-39.5},{-153,-39.5},{-153,-39}},color = {0,0,127}));
            connect(homeBat.n,publicBat.p) annotation(Line(points = {{136.24,0},{160.24,0}}));
            connect(sunShine.sun,publicPV.sun) annotation(Line(points = {{-210,20},{-105.6,20},{-105.6,19.8},{-27,19.8},{-27,-39.6},{-19,-39.6},{-19,-41}},color = {0,0,127}));
            connect(homePV.sun,sunShine.sun) annotation(Line(points = {{-99,-39},{-112,-39},{-112,20},{-210,20}},color = {0,0,127}));
            connect(publicPflow.y,publicPower.Pflow_in) annotation(Line(points = {{-26,42},{12,42},{12,-40},{23,-40}},color = {0,0,127}));
            connect(windPower.p,ground.electricity) annotation(Line(points = {{-190,-54},{-190,-80}}));
            connect(genPV.p,ground.electricity) annotation(Line(points = {{-138,-54},{-138,-68},{-190,-68},{-190,-80}}));
            connect(homePV.p,ground.electricity) annotation(Line(points = {{-84,-54},{-86,-54},{-86,-68},{-190,-68},{-190,-80}}));
            connect(home.p,ground.electricity) annotation(Line(points = {{-52,-52},{-52,-68},{-190,-68},{-190,-80}}));
            connect(publicPV.p,ground.electricity) annotation(Line(points = {{-4,-56},{-6,-56},{-6,-68},{-190,-68},{-190,-80}}));
            connect(publicPower.p,ground.electricity) annotation(Line(points = {{32,-50},{32,-68},{-190,-68},{-190,-80}}));
            connect(publicBat.n,ground.electricity) annotation(Line(points = {{184,0},{198,0},{198,-68},{-190,-68},{-190,-80}}));
        connect(windPower.n,genPV.n) annotation(Line(points = {{-190,-21.68},{-190,0},{-139,0},{-139,-23.7}},color = {0,0,0}));
        connect(genPV.n,homePV.n) annotation(Line(points = {{-139,-23.7},{-139,0},{-85,0},{-85,-23.7}},color = {0,0,0}));
        connect(homePV.n,home.n) annotation(Line(points = {{-85,-23.7},{-85,0},{-53,0},{-53,-25.74}},color = {0,0,0}));
        connect(home.n,publicPV.n) annotation(Line(points = {{-53,-25.74},{-53,0},{-4.9999999999999964,0},{-4.9999999999999964,-25.7}},color = {0,0,0}));
        connect(publicPV.n,publicPower.n) annotation(Line(points = {{-4.9999999999999964,-25.7},{-4.9999999999999964,0},{32,0},{32,-29.799999999999997}},color = {0,0,0}));
        connect(genBat.p,publicPower.n) annotation(Line(points = {{62,0},{32,0},{32,-29.799999999999997}},color = {0,0,0}));
            annotation(experiment(StartTime = 0,StopTime = 86400,Tolerance = 1e-06,Interval = 60));
        end TestCityAllArea;
    end Examples;
