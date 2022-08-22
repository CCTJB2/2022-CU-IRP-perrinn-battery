within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter;
block Ci
  "Electrode related capacitance, Input 1: SoC in fraction, Input 2: Temp in Kelvin"
  Modelica.Blocks.Math.MultiSum multiSum(nu=4)
    annotation (Placement(transformation(extent={{80,-10},{90,0}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput SoC
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput T "Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  parameter Modelica.Blocks.Interfaces.RealInput Lc "Thickness of cathode"
    annotation (Placement(transformation(extent={{-110,40},{-100,50}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ls "Thickness of seperator"
    annotation (Placement(transformation(extent={{-110,30},{-100,40}})));
  parameter Modelica.Blocks.Interfaces.RealInput La "Thickness of anode"
    annotation (Placement(transformation(extent={{-110,20},{-100,30}})));
  parameter Modelica.Blocks.Interfaces.RealInput Rcc
    "Current Collector Resistance in Ohms"
    annotation (Placement(transformation(extent={{-110,50},{-100,60}})));
  parameter Modelica.Blocks.Interfaces.RealInput A
    "Electrode area in square meter"
    annotation (Placement(transformation(extent={{-110,10},{-100,20}})));
  parameter Modelica.Blocks.Interfaces.RealInput Rbar
    "Universal Gas constant, 8.314 J/mol K"
    annotation (Placement(transformation(extent={{-110,-10},{-100,0}})));
  parameter Modelica.Blocks.Interfaces.RealInput F
    "Faraday's Constant, Coulmb/mol, Ampere-second/mol"
    annotation (Placement(transformation(extent={{-110,-20},{-100,-10}})));
  Ro_param.sigma_e sigma_e1(Ce_0=Ce_0)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Ro_param.ai a_c(epsilon=epsilon_c, R=radius_c)
    annotation (Placement(transformation(extent={{10,10},{20,20}})));
  parameter Modelica.Blocks.Interfaces.RealInput epsilon_c
    "active material volume fraction of cathode"
    annotation (Placement(transformation(extent={{-110,-30},{-100,-20}})));
  parameter Modelica.Blocks.Interfaces.RealInput epsilon_a
    "active material volume fraction of anode"
    annotation (Placement(transformation(extent={{-110,-40},{-100,-30}})));
  parameter Modelica.Blocks.Interfaces.RealInput radius_c
    "particle radius of cathode active material, in m, magnitude usually 1e-6"
    annotation (Placement(transformation(extent={{-110,-50},{-100,-40}})));
  parameter Modelica.Blocks.Interfaces.RealInput radius_a
    "particle radius of anode active material, in m, magnitude usually 1e-6"
    annotation (Placement(transformation(extent={{-110,-60},{-100,-50}})));
  Ro_param.ai a_a(epsilon=epsilon_a, R=radius_a)
    annotation (Placement(transformation(extent={{8,-52},{18,-42}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ce_0
    "Initial Electrolyte concentration, in mol/m^3, usually 1e3"
    annotation (Placement(transformation(extent={{-110,0},{-100,10}})));
  Modelica.Blocks.Sources.RealExpression Temp_express(y=T)
    annotation (Placement(transformation(extent={{-50,50},{-30,60}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{50,50},{60,60}})));
  Modelica.Blocks.Sources.RealExpression Rcc_express(y=Rcc)
    annotation (Placement(transformation(extent={{40,70},{60,80}})));
  Modelica.Blocks.Math.Gain gain(k=A)
    annotation (Placement(transformation(extent={{20,42},{30,52}})));
  Modelica.Blocks.Sources.RealExpression Lt(y=Lc + Ls + La)
    "Thickness of cell core"
    annotation (Placement(transformation(extent={{0,64},{40,74}})));
  Modelica.Blocks.Sources.RealExpression ConstantFor3and4Term1(y=Rbar*T/F)
    annotation (Placement(transformation(extent={{20,18},{40,28}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{50,-10},{60,0}})));
  Modelica.Blocks.Math.Division division2
    annotation (Placement(transformation(extent={{50,-50},{60,-40}})));
  Modelica.Blocks.Sources.RealExpression ConstantFor3and4Term(y=Rbar*T/F)
    annotation (Placement(transformation(extent={{20,-42},{40,-32}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=3)
    annotation (Placement(transformation(extent={{30,-20},{40,-10}})));
  Modelica.Blocks.Sources.RealExpression A_express(y=A*Lc)
    annotation (Placement(transformation(extent={{0,-4},{20,6}})));
  Ro_param.i0_ref i0_c_ref(
    F=F,
    k=kc,
    Ce_0=Ce_0,
    c_max=c_max_c)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.MultiProduct multiProduct1(nu=3)
    annotation (Placement(transformation(extent={{30,-60},{40,-50}})));
  Modelica.Blocks.Sources.RealExpression A_express1(y=A*La)
    annotation (Placement(transformation(extent={{0,-64},{20,-54}})));
  parameter Modelica.Blocks.Interfaces.RealInput kc
    "kinetic rate constant for cathode, reaction rate coefficient"
    annotation (Placement(transformation(extent={{-110,-70},{-100,-60}})));
  parameter Modelica.Blocks.Interfaces.RealInput ka
    "kinetic rate constant for anode, reaction rate coefficient"
    annotation (Placement(transformation(extent={{-110,-80},{-100,-70}})));
  parameter Modelica.Blocks.Interfaces.RealInput c_max_c
    "Maximum concentration of cathode, in mol/m^3"
    annotation (Placement(transformation(extent={{-110,-90},{-100,-80}})));
  parameter Modelica.Blocks.Interfaces.RealInput c_max_a
    "Maximum concentration of anode, in mol/m^3"
    annotation (Placement(transformation(extent={{-110,-100},{-100,-90}})));
  Ro_param.SoC_theta soC_theta_c(theta_0=theta_0_c, theta_100=theta_100_c)
    "Cathode"
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
  Modelica.Blocks.Sources.RealExpression SoC_express(y=SoC)
    annotation (Placement(transformation(extent={{-92,30},{-80,40}})));
  Ro_param.SoC_theta soC_theta_a(theta_0=theta_0_a, theta_100=theta_100_a)
    "Anode" annotation (Placement(transformation(extent={{-70,-90},{-50,-70}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_0_c
    "Molar Fraction of cathode at 0% SoC"
    annotation (Placement(transformation(extent={{-90,-70},{-80,-60}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_0_a
    "Molar Fraction of anode at 0% SoC"
    annotation (Placement(transformation(extent={{-90,-80},{-80,-70}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_100_c
    "Molar Fraction of cathode at 100% SoC"
    annotation (Placement(transformation(extent={{-90,-90},{-80,-80}})));
  parameter Modelica.Blocks.Interfaces.RealInput theta_100_a
    "Molar Fraction of anode at 1 SoC"
    annotation (Placement(transformation(extent={{-90,-100},{-80,-90}})));
  Ro_param.i0_ref i0_a_ref(
    F=F,
    Ce_0=Ce_0,
    c_max=c_max_a,
    k=ka) annotation (Placement(transformation(extent={{-40,-90},{-20,-70}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ea_i_o_c
    "Activation Energy for Cathode exchange current intensity, J/mol"
    annotation (Placement(transformation(extent={{-90,-30},{-80,-20}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ea_i_o_a
    "Activation Energy for Anode exchange current intensity, J/mol"
    annotation (Placement(transformation(extent={{-90,-40},{-80,-30}})));
  Arrh_Func arrh_Func(Tref=Tref, Rbar=Rbar)
    annotation (Placement(transformation(extent={{-6,-40},{14,-20}})));
  parameter Modelica.Blocks.Interfaces.RealInput Tref
    "Reference Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-90,-50},{-80,-40}})));
  Modelica.Blocks.Sources.RealExpression Ea_i_o_c_express(y=Ea_i_o_c)
    annotation (Placement(transformation(extent={{-32,-10},{-20,0}})));
  Modelica.Blocks.Sources.RealExpression Temp_express1(y=T)
    annotation (Placement(transformation(extent={{-32,-18},{-20,-8}})));
  Arrh_Func arrh_Func1(Tref=Tref, Rbar=Rbar)
    annotation (Placement(transformation(extent={{0,-90},{20,-70}})));
  Modelica.Blocks.Sources.RealExpression Ea_i_o_a_express(y=Ea_i_o_a)
    annotation (Placement(transformation(extent={{-32,-60},{-20,-50}})));
  Modelica.Blocks.Sources.RealExpression Temp_express2(y=T)
    annotation (Placement(transformation(extent={{-32,-70},{-20,-60}})));
equation
  connect(multiSum.y, y) annotation (Line(points={{90.85,-5},{95.425,-5},{
          95.425,0},{110,0}}, color={0,0,127}));
  connect(Temp_express.y, sigma_e1.T) annotation (Line(points={{-29,55},{-26.75,
          55},{-26.75,50},{-22,50}}, color={0,0,127}));
  connect(Rcc_express.y, multiSum.u[1]) annotation (Line(points={{61,75},{76,75},
          {76,-2.375},{80,-2.375}}, color={0,0,127}));
  connect(sigma_e1.y, gain.u) annotation (Line(points={{1,50},{16,50},{16,47},{
          19,47}}, color={0,0,127}));
  connect(gain.y, division.u2) annotation (Line(points={{30.5,47},{34.25,47},{
          34.25,52},{49,52}}, color={0,0,127}));
  connect(Lt.y, division.u1) annotation (Line(points={{42,69},{44.25,69},{44.25,
          58},{49,58}}, color={0,0,127}));
  connect(division.y, multiSum.u[2]) annotation (Line(points={{60.5,55},{74,55},
          {74,-4.125},{80,-4.125}}, color={0,0,127}));
  connect(ConstantFor3and4Term1.y, division1.u1) annotation (Line(points={{41,
          23},{44.5,23},{44.5,-2},{49,-2}}, color={0,0,127}));
  connect(a_c.y, multiProduct.u[1]) annotation (Line(points={{20.5,15},{26,15},
          {26,-12.6667},{30,-12.6667}}, color={0,0,127}));
  connect(multiProduct.y, division1.u2) annotation (Line(points={{40.85,-15},{
          46.425,-15},{46.425,-8},{49,-8}}, color={0,0,127}));
  connect(ConstantFor3and4Term.y, division2.u1) annotation (Line(points={{41,
          -37},{45.5,-37},{45.5,-42},{49,-42}}, color={0,0,127}));
  connect(multiProduct1.y, division2.u2) annotation (Line(points={{40.85,-55},{
          45.425,-55},{45.425,-48},{49,-48}}, color={0,0,127}));
  connect(A_express.y, multiProduct.u[2]) annotation (Line(points={{21,1},{24,1},
          {24,-15},{30,-15}}, color={0,0,127}));
  connect(a_a.y, multiProduct1.u[1]) annotation (Line(points={{18.5,-47},{25.25,
          -47},{25.25,-52.6667},{30,-52.6667}}, color={0,0,127}));
  connect(A_express1.y, multiProduct1.u[2]) annotation (Line(points={{21,-59},{
          25.5,-59},{25.5,-55},{30,-55}}, color={0,0,127}));
  connect(division1.y, multiSum.u[3]) annotation (Line(points={{60.5,-5},{70.25,
          -5},{70.25,-5.875},{80,-5.875}}, color={0,0,127}));
  connect(division2.y, multiSum.u[4]) annotation (Line(points={{60.5,-45},{72,
          -45},{72,-7.625},{80,-7.625}}, color={0,0,127}));
  connect(SoC_express.y, soC_theta_c.SoC) annotation (Line(points={{-79.4,35},{
          -72.7,35},{-72.7,-30},{-71,-30}}, color={0,0,127}));
  connect(SoC_express.y, soC_theta_a.SoC) annotation (Line(points={{-79.4,35},{
          -76,35},{-76,-80},{-71,-80}}, color={0,0,127}));
  connect(soC_theta_a.y, i0_a_ref.theta)
    annotation (Line(points={{-49,-80},{-41,-80}}, color={0,0,127}));
  connect(soC_theta_c.y, i0_c_ref.theta)
    annotation (Line(points={{-49,-30},{-41,-30}}, color={0,0,127}));
  connect(i0_c_ref.y, arrh_Func.P1)
    annotation (Line(points={{-19,-30},{-8,-30}}, color={0,0,127}));
  connect(Ea_i_o_c_express.y, arrh_Func.Ea) annotation (Line(points={{-19.4,-5},
          {-16,-5},{-16,-22},{-8,-22}}, color={0,0,127}));
  connect(Temp_express1.y, arrh_Func.T) annotation (Line(points={{-19.4,-13},{
          -18,-13},{-18,-26},{-8,-26}}, color={0,0,127}));
  connect(i0_a_ref.y, arrh_Func1.P1)
    annotation (Line(points={{-19,-80},{-2,-80}}, color={0,0,127}));
  connect(Ea_i_o_a_express.y, arrh_Func1.Ea) annotation (Line(points={{-19.4,
          -55},{-6,-55},{-6,-72},{-2,-72}}, color={0,0,127}));
  connect(Temp_express2.y, arrh_Func1.T) annotation (Line(points={{-19.4,-65},{
          -8,-65},{-8,-76},{-2,-76}}, color={0,0,127}));
  connect(arrh_Func.y, multiProduct.u[3]) annotation (Line(points={{15,-30},{26,
          -30},{26,-17.3333},{30,-17.3333}}, color={0,0,127}));
  connect(arrh_Func1.y, multiProduct1.u[3]) annotation (Line(points={{21,-80},{
          28,-80},{28,-57.3333},{30,-57.3333}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Ci;
