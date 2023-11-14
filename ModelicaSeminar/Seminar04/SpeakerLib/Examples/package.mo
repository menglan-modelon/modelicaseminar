within ModelicaSeminar.Seminar04.SpeakerLib;

    package Examples
        extends .Modelica.Icons.ExamplesPackage;
        model Model1
    extends Modelica.Icons.Example;
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance r = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.ElectricalResistor R(R = r) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-79.0,37.0},{-65.0,51.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.SpeakerCone speakerCone annotation(Placement(visible = true,transformation(origin = {104,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance r_w(h = rw) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-4.0,10.0},{16.0,30.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.AcousticMass acousticMass(M = ml / A ^ 2) annotation(Placement(visible = true,transformation(origin = {164,20},extent = {{-8,-8},{8,8}},rotation = 180)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalInductance n_w(n = nw) annotation(Placement(visible = true,transformation(origin = {6,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalMass m_w(m = mw) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{32.0,10.0},{52.0,30.0}},rotation = 0.0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.AcousticResistor acousticResistor(Z = rl / A ^ 2) annotation(Placement(visible = true,transformation(origin = {134.0,20.0},extent = {{-8.0,-8.0},{8.0,8.0}},rotation = 180.0)));
            .Modelica.Electrical.Analog.Basic.TranslationalEMF emf(k = B0 * l) annotation(Placement(visible = true,transformation(origin = {-34,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Sources.ElectricPotential electricPotential annotation(Placement(visible = true,transformation(origin = {-84,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(f = 5,offset = 1e-3) annotation(Placement(visible = true,transformation(origin = {-116,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true,transformation(origin = {-84,-12},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.ElectricalInductor L(L = 1e-6) annotation(Placement(visible = true,transformation(origin = {0.0,0.0},extent = {{-41.0,37.0},{-55.0,51.0}},rotation = 0.0)));
            .Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(visible = true,transformation(origin = {74,20},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            connect(r_w.flange_b,m_w.flange_a) annotation(Line(points = {{16,20},{32,20}},color = {0,127,0}));
            connect(sine.y,electricPotential.uIn) annotation(Line(points = {{-105,20},{-95,20}},color = {0,0,127}));
            connect(electricPotential.p,ground.p) annotation(Line(points = {{-84,9.8},{-84,-2.2}},color = {0,0,255}));
            connect(emf.n,electricPotential.p) annotation(Line(points = {{-34,10},{-34,-2},{-84,-2},{-84,10}},color = {0,0,255}));
            connect(n_w.flange_b,m_w.flange_a) annotation(Line(points = {{16,42},{26,42},{26,20},{32,20}},color = {0,127,0}));
            connect(emf.flange,r_w.flange_a) annotation(Line(points = {{-24,20},{-4,20}},color = {0,127,0}));
            connect(n_w.flange_a,emf.flange) annotation(Line(points = {{-4,42},{-14,42},{-14,20},{-24,20}},color = {0,127,0}));
            connect(R.n,L.n) annotation(Line(points = {{-65,44},{-55,44}},color = {0,0,255}));
            connect(L.p,emf.p) annotation(Line(points = {{-40.86,44},{-34,44},{-34,30}},color = {0,0,255}));
            connect(electricPotential.n,R.p) annotation(Line(points = {{-84,30},{-84,44},{-79.14,44}},color = {0,0,255}));
            connect(speakerCone.acousticPort_b,acousticResistor.acousticPort_b) annotation(Line(points = {{113.8,19.8},{125.8,19.8}},color = {255,170,0}));
            connect(acousticResistor.acousticPort_a,acousticMass.acousticPort_b) annotation(Line(points = {{141.92,19.92},{155.92,19.92}},color = {255,170,0}));
            connect(m_w.flange_b,forceSensor.flange_a) annotation(Line(points = {{52,20},{64,20}},color = {0,127,0}));
            connect(forceSensor.flange_b,speakerCone.flange_a) annotation(Line(points = {{84,20},{94,20}},color = {0,127,0}));
            connect(forceSensor.f,speakerCone.driveForce) annotation(Line(points = {{66,10},{94,10}},color = {0,0,127}));
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end Model1;
        model Model2
    extends Modelica.Icons.Example;
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance R = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.SpeakerCone speakerCone annotation(Placement(visible = true,transformation(origin = {70,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.AcousticMass acousticMass(M = ml / A ^ 2,stateSelect = StateSelect.never) annotation(Placement(visible = true,transformation(origin = {102,20},extent = {{-8,-8},{8,8}},rotation = 180)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.AcousticResistor acousticResistor(Z = rl / A ^ 2,stateSelect = StateSelect.never) annotation(Placement(visible = true,transformation(origin = {130,20},extent = {{-8,-8},{8,8}},rotation = 180)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance electricAdmittance(h = rel) annotation(Placement(visible = true,transformation(origin = {-28,-30},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalInductance n_w(n = nw) annotation(Placement(visible = true,transformation(origin = {-32,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance r_w(h = rw) annotation(Placement(visible = true,transformation(origin = {-32,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(visible = true,transformation(origin = {-76,-16},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalMass m_w(m = mw) annotation(Placement(visible = true,transformation(origin = {10,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = B0 * l / R,f = 5) annotation(Placement(visible = true,transformation(origin = {-110,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Sources.MechanicalFlow mechanicalFlow annotation(Placement(visible = true,transformation(origin = {-76,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(visible = true,transformation(origin = {40,20},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            connect(speakerCone.acousticPort_b,acousticMass.acousticPort_b) annotation(Line(points = {{80,20},{94,20}},color = {255,170,0}));
            connect(acousticMass.acousticPort_a,acousticResistor.acousticPort_b) annotation(Line(points = {{110,20},{122,20}},color = {255,170,0}));
            connect(mechanicalFlow.flange_b,r_w.flange_a) annotation(Line(points = {{-76,20},{-42,20}},color = {0,127,0}));
            connect(n_w.flange_b,m_w.flange_a) annotation(Line(points = {{-22,42},{-12,42},{-12,20},{0,20}},color = {0,127,0}));
            connect(sine.y,mechanicalFlow.fIn) annotation(Line(points = {{-99,10},{-86,10}},color = {0,0,127}));
            connect(electricAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{-18,-30},{-12,-30},{-12,20},{0,20}},color = {0,127,0}));
            connect(n_w.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-42,42},{-52,42},{-52,20},{-76,20}},color = {0,127,0}));
            connect(electricAdmittance.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-38,-30},{-52,-30},{-52,20},{-76,20}},color = {0,127,0}));
            connect(r_w.flange_b,m_w.flange_a) annotation(Line(points = {{-22,20},{0,20}},color = {0,127,0}));
            connect(mechanicalFlow.flange_a,fixed.flange) annotation(Line(points = {{-76,0},{-76,-16}},color = {0,127,0}));
            connect(m_w.flange_b,forceSensor.flange_a) annotation(Line(points = {{20,20},{30,20}},color = {0,127,0}));
            connect(forceSensor.flange_b,speakerCone.flange_a) annotation(Line(points = {{50,20},{60,20}},color = {0,127,0}));
            connect(forceSensor.f,speakerCone.driveForce) annotation(Line(points = {{32,10},{60,10}},color = {0,0,127}));
        protected
            annotation(Icon(coordinateSystem(initialScale = 1)));
        end Model2;
        model Model3
    extends Modelica.Icons.Example;
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance R = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalMass m_w(m = mw) annotation(Placement(visible = true,transformation(origin = {66,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalInductance n_w(n = nw) annotation(Placement(visible = true,transformation(origin = {0,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance r_w(h = rw) annotation(Placement(visible = true,transformation(origin = {0,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalMass acousticMass(m = ml) annotation(Placement(visible = true,transformation(origin = {66,44},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance acousticAdmittance(h = rl) annotation(Placement(visible = true,transformation(origin = {2,-6},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Sources.MechanicalFlow mechanicalFlow annotation(Placement(visible = true,transformation(origin = {-44,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(visible = true,transformation(origin = {-44,-16},extent = {{-10,-10},{10,10}},rotation = 0)));
            .ModelicaSeminar.Seminar04.SpeakerLib.Components.MechanicalAdmittance electricAdmittance(h = rel) annotation(Placement(visible = true,transformation(origin = {4,-30},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = B0 * l / R,f = 10) annotation(Placement(visible = true,transformation(origin = {-78,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Units.SI.Pressure p;
            .Modelica.Units.SI.VolumeFlowRate q;
            .Modelica.Units.SI.Velocity v;
            .Modelica.Units.SI.Acceleration a;
        equation
            p = ml * A * a + rl * A * v;
            q = A * v;
            v = r_w.v_rel;
            a = der(v);
            connect(mechanicalFlow.flange_a,fixed.flange) annotation(Line(points = {{-44,0},{-44,-16}},color = {0,127,0}));
            connect(sine.y,mechanicalFlow.fIn) annotation(Line(points = {{-67,10},{-54,10}},color = {0,0,127}));
            connect(mechanicalFlow.flange_b,r_w.flange_a) annotation(Line(points = {{-44,20},{-10,20}},color = {0,127,0}));
            connect(r_w.flange_b,m_w.flange_a) annotation(Line(points = {{10,20},{56,20}},color = {0,127,0}));
            connect(n_w.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-10,42},{-20,42},{-20,20},{-44,20}},color = {0,127,0}));
            connect(electricAdmittance.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-6,-30},{-20,-30},{-20,20},{-44,20}},color = {0,127,0}));
            connect(n_w.flange_b,m_w.flange_a) annotation(Line(points = {{10,42},{20,42},{20,20},{56,20}},color = {0,127,0}));
            connect(electricAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{14,-30},{20,-30},{20,20},{56,20}},color = {0,127,0}));
            connect(acousticAdmittance.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-8,-6},{-20,-6},{-20,20},{-44,20}},color = {0,127,0}));
            connect(acousticAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{12,-6},{20,-6},{20,20},{56,20}},color = {0,127,0}));
            connect(acousticMass.flange_a,m_w.flange_b) annotation(Line(points = {{56,44},{44,44},{44,30},{86,30},{86,20},{76,20}},color = {0,127,0}));
            annotation(Icon(coordinateSystem(initialScale = 1)),experiment(StartTime = 0,StopTime = 1,Tolerance = 1e-08,Interval = 0.002));
        end Model3;
        model ModelByText
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance R = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            parameter .Modelica.Units.SI.Frequency freq = 10 "Oscillation frequency";
            .Modelica.Units.SI.ElectricCurrent i;
            .Modelica.Units.SI.Voltage u0;
            .Modelica.Units.SI.Length s;
            .Modelica.Units.SI.Velocity v;
            .Modelica.Units.SI.Acceleration a;
            .Modelica.Units.SI.Force fw;
            .Modelica.Units.SI.Force fm;
            .Modelica.Units.SI.Force fp;
            .Modelica.Units.SI.Force f;
            .Modelica.Units.SI.Pressure p(start = 0,fixed = true);
            .Modelica.Units.SI.VolumeFlowRate q;
        equation
            v = der(s);
            a = der(v);
            u0 = 1 * sin(2 * .Modelica.Constants.pi * freq * time);
            u0 = i * R + B0 * l * v;
            fw = B0 * l * i;
            fm = (-v / rw) - s / nw;
            mw * a = fm + fw - fp;
            f = fm - fp;
            p = ml * A * a + rl * A * v;
            q = A * v;
            fp = A * p;
            annotation(Icon(coordinateSystem(initialScale = 1)),experiment(StartTime = 0,StopTime = 1,Tolerance = 1e-08,Interval = 0.002));
        end ModelByText;
        model Model4
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance r = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            .SpeakerLib.Components.ElectricalResistor R(R = r) annotation(Placement(visible = true,transformation(origin = {-71,43},extent = {{-7,-7},{7,7}},rotation = 0)));
            .SpeakerLib.Components.MechanicalAdmittance r_w(h = rw) annotation(Placement(visible = true,transformation(origin = {6,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalInductance n_w(n = nw) annotation(Placement(visible = true,transformation(origin = {6,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalMass m_w(m = mw) annotation(Placement(visible = true,transformation(origin = {70,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Electrical.Analog.Basic.TranslationalEMF emf(k = B0 * l) annotation(Placement(visible = true,transformation(origin = {-34,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Sources.ElectricPotential electricPotential annotation(Placement(visible = true,transformation(origin = {-84,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(f = 5,offset = 0) annotation(Placement(visible = true,transformation(origin = {-116,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Electrical.Analog.Basic.Ground ground annotation(Placement(visible = true,transformation(origin = {-84,-12},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalAdmittance mechanicalAdmittance(h = rl) annotation(Placement(visible = true,transformation(origin = {6,-4},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalMass mechanicalMass(m = ml) annotation(Placement(visible = true,transformation(origin = {70,46},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.ElectricalInductor L(L = 1e-6) annotation(Placement(visible = true,transformation(origin = {-49,43},extent = {{7,-7},{-7,7}},rotation = 0)));
        equation
            connect(r_w.flange_b,m_w.flange_a) annotation(Line(points = {{16,20},{60,20}},color = {0,127,0}));
            connect(sine.y,electricPotential.uIn) annotation(Line(points = {{-105,20},{-95,20}},color = {0,0,127}));
            connect(electricPotential.p,ground.p) annotation(Line(points = {{-84,9.8},{-84,-2.2}},color = {0,0,255}));
            connect(emf.n,electricPotential.p) annotation(Line(points = {{-34,10},{-34,-2},{-84,-2},{-84,10}},color = {0,0,255}));
            connect(n_w.flange_b,m_w.flange_a) annotation(Line(points = {{16,42},{26,42},{26,20},{60,20}},color = {0,127,0}));
            connect(emf.flange,r_w.flange_a) annotation(Line(points = {{-24,20},{-4,20}},color = {0,127,0}));
            connect(n_w.flange_a,emf.flange) annotation(Line(points = {{-4,42},{-14,42},{-14,20},{-24,20}},color = {0,127,0}));
            connect(electricPotential.n,R.p) annotation(Line(points = {{-84,30},{-84,44},{-78,44}},color = {0,0,255}));
            connect(mechanicalAdmittance.flange_a,emf.flange) annotation(Line(points = {{-4,-4},{-14,-4},{-14,20},{-24,20}},color = {0,127,0}));
            connect(mechanicalAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{16,-4},{26,-4},{26,20},{60,20}},color = {0,127,0}));
            connect(R.n,L.n) annotation(Line(points = {{-64,44},{-56,44}},color = {0,0,255}));
            connect(L.p,emf.p) annotation(Line(points = {{-42,44},{-34,44},{-34,30}},color = {0,0,255}));
            connect(mechanicalMass.flange_a,m_w.flange_b) annotation(Line(points = {{60,46},{48,46},{48,32},{88,32},{88,20},{80,20}},color = {0,127,0}));
            annotation(Icon(coordinateSystem(initialScale = 1)),experiment(StartTime = 0,StopTime = 1,Tolerance = 1e-8,Interval = 0.002));
        end Model4;
        model ModelByTextSweep
            .Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineVar(constantAmplitude = 1,useConstantAmplitude = true) annotation(Placement(visible = true,transformation(origin = {-42,0},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.Ramp rampFrequency(duration = 30,height = 15,offset = 5) annotation(Placement(visible = true,transformation(origin = {-94,-6},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.SpeakerByText speakerByText annotation(Placement(visible = true,transformation(origin = {0,0},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            connect(rampFrequency.y,sineVar.f) annotation(Line(points = {{-82,-6},{-54,-6}},color = {0,0,127}));
            connect(sineVar.y,speakerByText.u0) annotation(Line(points = {{-30,0},{-8,0}},color = {0,0,127}));
        protected
            annotation(experiment(StartTime = 0,StopTime = 30,Tolerance = 1e-08,Interval = 0.001));
        end ModelByTextSweep;
        model Model3Sweep
            parameter .Modelica.Units.SI.MagneticFluxDensity B0 = 0.8;
            parameter .Modelica.Units.SI.Length l = 8 "Coil lenght";
            parameter .Modelica.Units.SI.Resistance R = 6 "Electric register";
            parameter .Modelica.Units.SI.Mass mw = 0.03 "Mechanical movable mass";
            parameter .Modelica.Units.SI.Inductance nw = 2.1e-3 "Mechanical inductance of spring";
            parameter .Modelica.Units.SI.Admittance rw = 1e-3 "Mechanical admittance of damper";
            parameter .Modelica.Units.SI.Mass ml = 3.2e-3 "Mechanical movable mass of air";
            parameter .Modelica.Units.SI.Admittance rl = 8e-3 "Mechanical admittance of air damper";
            parameter .Modelica.Units.SI.Admittance rel = 6.82 "Mechanical admittance of electric register";
            parameter .Modelica.Units.SI.Area A = .Modelica.Constants.pi * 0.1 ^ 2 "Area of speaker cone";
            .SpeakerLib.Components.MechanicalMass m_w(m = mw) annotation(Placement(visible = true,transformation(origin = {66,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalInductance n_w(n = nw) annotation(Placement(visible = true,transformation(origin = {0,42},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalAdmittance r_w(h = rw) annotation(Placement(visible = true,transformation(origin = {0,20},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalMass acousticMass(m = ml) annotation(Placement(visible = true,transformation(origin = {66,44},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalAdmittance acousticAdmittance(h = rl) annotation(Placement(visible = true,transformation(origin = {2,-6},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Sources.MechanicalFlow mechanicalFlow annotation(Placement(visible = true,transformation(origin = {-44,10},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(visible = true,transformation(origin = {-44,-16},extent = {{-10,-10},{10,10}},rotation = 0)));
            .SpeakerLib.Components.MechanicalAdmittance electricAdmittance(h = rel) annotation(Placement(visible = true,transformation(origin = {4,-30},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Units.SI.Pressure p;
            .Modelica.Units.SI.VolumeFlowRate q;
            .Modelica.Units.SI.Velocity v;
            .Modelica.Units.SI.Acceleration a;
            .Modelica.Blocks.Sources.Ramp rampFrequency(duration = 30,height = 15,offset = 5) annotation(Placement(visible = true,transformation(origin = {-130,4},extent = {{-10,-10},{10,10}},rotation = 0)));
            .Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineVar(constantAmplitude = B0 * l / R,useConstantAmplitude = true) annotation(Placement(visible = true,transformation(origin = {-78,10},extent = {{-10,-10},{10,10}},rotation = 0)));
        equation
            p = ml * A * a + rl * A * v;
            q = A * v;
            v = r_w.v_rel;
            a = der(v);
            connect(mechanicalFlow.flange_a,fixed.flange) annotation(Line(points = {{-44,0},{-44,-16}},color = {0,127,0}));
            connect(mechanicalFlow.flange_b,r_w.flange_a) annotation(Line(points = {{-44,20},{-10,20}},color = {0,127,0}));
            connect(r_w.flange_b,m_w.flange_a) annotation(Line(points = {{10,20},{56,20}},color = {0,127,0}));
            connect(n_w.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-10,42},{-20,42},{-20,20},{-44,20}},color = {0,127,0}));
            connect(electricAdmittance.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-6,-30},{-20,-30},{-20,20},{-44,20}},color = {0,127,0}));
            connect(n_w.flange_b,m_w.flange_a) annotation(Line(points = {{10,42},{20,42},{20,20},{56,20}},color = {0,127,0}));
            connect(electricAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{14,-30},{20,-30},{20,20},{56,20}},color = {0,127,0}));
            connect(acousticAdmittance.flange_a,mechanicalFlow.flange_b) annotation(Line(points = {{-8,-6},{-20,-6},{-20,20},{-44,20}},color = {0,127,0}));
            connect(acousticAdmittance.flange_b,m_w.flange_a) annotation(Line(points = {{12,-6},{20,-6},{20,20},{56,20}},color = {0,127,0}));
            connect(m_w.flange_b,acousticMass.flange_a) annotation(Line(points = {{76,20},{86,20},{86,30},{44,30},{44,44},{56,44}},color = {0,127,0}));
            connect(rampFrequency.y,sineVar.f) annotation(Line(points = {{-119,4},{-91,4}},color = {0,0,127}));
            connect(sineVar.y,mechanicalFlow.fIn) annotation(Line(points = {{-66,10},{-54,10}},color = {0,0,127}));
            annotation(Icon(coordinateSystem(initialScale = 1)),experiment(StartTime = 0,StopTime = 30,Tolerance = 1e-08,Interval = 0.001));
        end Model3Sweep;
        annotation(Icon(coordinateSystem(initialScale = 1)));
    end Examples;