within ModelicaSeminar.Seminar02.MiniCar;
  
  model Mini4WDText
    extends .ModelicaSeminar.Icons.TextExample;
    parameter Real V_OCV = 3;
    parameter Real Rb = 0.8;
    parameter Real Rm = 1;
    parameter Real Lm = 1e-6;
    parameter Real Jm = 1.8e-3*0.005*0.005;
    parameter Real Jt = 5e-3*0.01*0.01;
    parameter Real Kt = 1.2e-3;
    parameter Real Ke = 1.2e-3;
    parameter Real Kg = 5;
    parameter Real Eg = 1;
    parameter Real m = 0.1;
    parameter Real r = 0.015;
    parameter Real myu = 0.1;
    parameter Real Cd = 0.3;
    parameter Real area = 0.004;
    parameter Real rho = 1.205;
    // Variables
    Real Vb;
    Real Vm;
    Real Vemf;
    Real taum;
    Real i;
    Real taut;
    Real omgm;
    Real omgt;
    Real f;
    Real fa;
    Real fr;
    Real fair;
    Real x;
    Real v;
    Real a;
  equation
    Vb = V_OCV - Rb*i;
    Vm = Vemf + Rm*i + Lm*der(i);
    Vemf = Ke*omgm;
    Vb = Vm;
    taum = Kt*i;
//Jm*der(omgm) = taum;　“omgmは状態量（独立変数）となる”
    taut = Eg*Kg*taum;
    Kg*omgt = omgm;
//Jt*der(omgt) = taut - r*f; 　“omgtは状態量（独立変数）となる”
    0 = taut - r*f;
    r*omgt = v;
    f = fa + fr + fair;
    fa = m*a;
    fr = if v >= 0 then myu*m*.Modelica.Constants.g_n else -myu*m*.Modelica.Constants.g_n;
    fair = if v >= 0 then rho*area*Cd*v*v/2 else -rho*area*Cd*v*v/2;
    a = der(v);
    v = der(x);
  end Mini4WDText;
