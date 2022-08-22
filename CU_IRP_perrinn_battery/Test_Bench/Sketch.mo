within CU_IRP_perrinn_battery.Test_Bench;
model Sketch "Sketch board for testing functions and blocks"
  Modelica.Blocks.Interfaces.RealOutput SoC_out
    annotation (Placement(transformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Sources.Constant Temp(k=25 + 273.15)
    annotation (Placement(transformation(extent={{-60,2},{-40,22}})));

  Modelica.Blocks.Sources.Constant radius_c(k=4e-6)
    "particle radius of cathode active material"
    annotation (Placement(transformation(extent={{10,80},{20,90}})));
  Electrical.ECM.EECM_Parameter.Ro ro(
    Lc=Lc.k,
    Ls=Ls.k,
    La=La.k,
    Rcc=Rcc.k,
    A=A.k,
    Rbar=Rbar.k,
    F=F.k,
    epsilon_s_c=epsilon_c.k,
    epsilon_s_a=epsilon_a.k,
    radius_c=radius_c.k,
    radius_a=radius_a.k,
    Ce_0=Ce_0.k,
    kc=kc.k,
    ka=ka.k,
    c_max_c=c_max_c.k,
    c_max_a=c_max_a.k,
    theta_0_c=theta_0_c.k,
    theta_0_a=theta_0_a.k,
    theta_100_c=theta_100_c.k,
    theta_100_a=theta_100_a.k,
    Ea_i_o_c=Ea_i_o_c.k,
    Ea_i_o_a=Ea_i_o_a.k,
    Tref=Tref.k)
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Sources.Constant Lc(k=7.5e-5) "Thickness of Cathode"
    annotation (Placement(transformation(extent={{-100,90},{-90,100}})));
  Modelica.Blocks.Sources.Constant Ls(k=2e-5) "Thickness of Seperator"
    annotation (Placement(transformation(extent={{-90,80},{-80,90}})));
  Modelica.Blocks.Sources.Constant La(k=7e-5) "Thickness of Anode"
    annotation (Placement(transformation(extent={{-80,90},{-70,100}})));
  Modelica.Blocks.Sources.Constant Rcc(k=0.4e-3) "Current Collector Resistance"
    annotation (Placement(transformation(extent={{-70,80},{-60,90}})));
  Modelica.Blocks.Sources.Constant A(k=2) "Electrode Area"
    annotation (Placement(transformation(extent={{-60,90},{-50,100}})));
  Modelica.Blocks.Sources.Constant Rbar(k=8.314) "Universal Gas Constant"
    annotation (Placement(transformation(extent={{-50,80},{-40,90}})));
  Modelica.Blocks.Sources.Constant F(k=9.65e4) "Faraday's constant"
    annotation (Placement(transformation(extent={{-40,90},{-30,100}})));
  Modelica.Blocks.Sources.Constant epsilon_c(k=5.46e-1)
    "cathode active material volume fraction"
    annotation (Placement(transformation(extent={{-30,80},{-20,90}})));
  Modelica.Blocks.Sources.Constant epsilon_a(k=5.1e-1)
    "anode active material volume fraction"
    annotation (Placement(transformation(extent={{-20,90},{-10,100}})));
  Modelica.Blocks.Sources.Constant radius_a(k=3e-6)
    "particle radius of cathode active material"
    annotation (Placement(transformation(extent={{20,90},{30,100}})));
  Modelica.Blocks.Sources.Constant Ce_0(k=1e3)
    "Initial Electrolyte concentration, mol/m^3, 1e3"
    annotation (Placement(transformation(extent={{30,80},{40,90}})));
  Modelica.Blocks.Sources.Ramp SoC(duration=1)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.Constant c_max_c(k=4.3e4)
    "Cathode maximum concentration, mol/m^3"
    annotation (Placement(transformation(extent={{40,90},{50,100}})));
  Modelica.Blocks.Sources.Constant c_max_a(k=3.13e4)
    "Anode maximum concentration, mol/m^3"
    annotation (Placement(transformation(extent={{50,80},{60,90}})));
  Modelica.Blocks.Sources.Constant kc(k=3e-11)
    "kinetic rate constant for cathode"
    annotation (Placement(transformation(extent={{60,90},{70,100}})));
  Modelica.Blocks.Sources.Constant ka(k=9e-11)
    "kinetic rate constant for anode"
    annotation (Placement(transformation(extent={{70,80},{80,90}})));
  Modelica.Blocks.Interfaces.RealOutput Rcc_out
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  Modelica.Blocks.Interfaces.RealOutput phi_ohmic
    annotation (Placement(transformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Interfaces.RealOutput eta_a
    annotation (Placement(transformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Interfaces.RealOutput eta_c
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Modelica.Blocks.Sources.RealExpression phi_ohmic_express(y=ro.division.y)
    annotation (Placement(transformation(extent={{40,0},{80,20}})));
  Modelica.Blocks.Sources.RealExpression Rcc_express(y=Rcc.k)
    annotation (Placement(transformation(extent={{40,20},{80,40}})));
  Modelica.Blocks.Sources.RealExpression eta_a_express(y=ro.division2.y)
    "anode" annotation (Placement(transformation(extent={{40,-20},{80,0}})));
  Modelica.Blocks.Sources.RealExpression eta_c_express(y=ro.division1.y)
    annotation (Placement(transformation(extent={{40,-40},{80,-20}})));
  Modelica.Blocks.Sources.Constant Ea_i_o_c(k=5.52e4)
    "Activation Energy for cathode exchange current intensity"
    annotation (Placement(transformation(extent={{-102,70},{-92,80}})));
  Modelica.Blocks.Sources.Constant Ea_i_o_a(k=6.28e3)
    "Activation Energy for Anode exchange current intensity"
    annotation (Placement(transformation(extent={{-90,60},{-80,70}})));
  Modelica.Blocks.Sources.Constant Tref(k=20 + 273.15) "Reference Temperature"
    annotation (Placement(transformation(extent={{-60,70},{-50,80}})));
  Modelica.Blocks.Sources.Constant Beta(k=1.75) "Reference Temperature"
    annotation (Placement(transformation(extent={{-50,60},{-40,70}})));
  Modelica.Blocks.Sources.Constant t_0(k=0.363) "Transference number"
    annotation (Placement(transformation(extent={{-40,70},{-30,80}})));
  Modelica.Blocks.Sources.Constant D_e_ref(k=2.0576e-10)
    "Electrolyte diffusion coefficientm m^2/s"
    annotation (Placement(transformation(extent={{-30,60},{-20,70}})));
  Electrical.ECM.EECM_Parameter.Ri rc(
    Lc=Lc.k,
    Ls=Ls.k,
    La=La.k,
    Rcc=Rcc.k,
    A=A.k,
    Rbar=Rbar.k,
    F=F.k,
    epsilon_s=epsilon_c.k,
    radius=radius_c.k,
    Ce_0=Ce_0.k,
    Ea_D_e=Ea_D_e.k,
    Tref=Tref.k,
    Beta=Beta.k,
    D_e_ref=D_e_ref.k,
    t_0=t_0.k,
    coeff=0.248,
    epsilon_e=epsilon_e.k) "resistance for cathode"
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.Constant Ea_D_e(k=1.31e3)
    "Activation Energy for electrolyte diffusion coefficient"
    annotation (Placement(transformation(extent={{-80,70},{-70,80}})));
  Modelica.Blocks.Sources.RealExpression rc_express(y=rc.y)
    annotation (Placement(transformation(extent={{40,-60},{80,-40}})));
  Modelica.Blocks.Sources.Constant theta_0_c(k=0.9903)
    "kinetic rate constant for cathode"
    annotation (Placement(transformation(extent={{60,70},{70,80}})));
  Modelica.Blocks.Sources.Constant theta_0_a(k=0.0621)
    "kinetic rate constant for cathode"
    annotation (Placement(transformation(extent={{70,60},{80,70}})));
  Modelica.Blocks.Sources.Constant theta_100_c(k=0.4384)
    "kinetic rate constant for cathode"
    annotation (Placement(transformation(extent={{80,70},{90,80}})));
  Modelica.Blocks.Sources.Constant theta_100_a(k=0.9373)
    "kinetic rate constant for cathode"
    annotation (Placement(transformation(extent={{90,60},{100,70}})));
  Modelica.Blocks.Sources.Constant epsilon_e(k=0.5)
    "volume fracion of electrolyte"
    annotation (Placement(transformation(extent={{-10,80},{0,90}})));
  Electrical.ECM.EECM_Parameter.Ri ra(
    Lc=Lc.k,
    Ls=Ls.k,
    La=La.k,
    Rcc=Rcc.k,
    A=A.k,
    Rbar=Rbar.k,
    F=F.k,
    Ce_0=Ce_0.k,
    Ea_D_e=Ea_D_e.k,
    Tref=Tref.k,
    Beta=Beta.k,
    D_e_ref=D_e_ref.k,
    t_0=t_0.k,
    epsilon_e=epsilon_e.k,
    epsilon_s=epsilon_a.k,
    radius=radius_a.k,
    coeff=0.234) "resistance for anode"
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
equation
  connect(Temp.y, ro.T) annotation (Line(points={{-39,12},{-30,12},{-30,37},{
          -21,37}}, color={0,0,127}));
  connect(SoC.y, ro.SoC) annotation (Line(points={{-39,50},{-30,50},{-30,39},{
          -21,39}}, color={0,0,127}));
  connect(phi_ohmic_express.y, phi_ohmic)
    annotation (Line(points={{82,10},{110,10}}, color={0,0,127}));
  connect(Rcc_express.y, Rcc_out)
    annotation (Line(points={{82,30},{110,30}}, color={0,0,127}));
  connect(eta_a_express.y, eta_a)
    annotation (Line(points={{82,-10},{110,-10}}, color={0,0,127}));
  connect(eta_c_express.y, eta_c)
    annotation (Line(points={{82,-30},{110,-30}}, color={0,0,127}));
  connect(SoC_out, SoC.y)
    annotation (Line(points={{110,50},{-39,50}}, color={0,0,127}));
  connect(rc.T, ro.T) annotation (Line(points={{-21,-1},{-30,-1},{-30,37},{-21,
          37}}, color={0,0,127}));
  connect(ra.T, ro.T) annotation (Line(points={{-21,-41},{-30,-41},{-30,37},{
          -21,37}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Sketch;
