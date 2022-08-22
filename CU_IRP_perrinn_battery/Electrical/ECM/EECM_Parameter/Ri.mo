within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter;
block Ri
  "Electrode related resistance, Input 1: SoC in fraction, Input 2: Temp in Kelvin"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput T "Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-120,80},{-100,100}})));
  parameter Modelica.Blocks.Interfaces.RealInput Lc "Thickness of cathode"
    annotation (Placement(transformation(extent={{-110,50},{-100,60}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ls "Thickness of seperator"
    annotation (Placement(transformation(extent={{-110,40},{-100,50}})));
  parameter Modelica.Blocks.Interfaces.RealInput La "Thickness of anode"
    annotation (Placement(transformation(extent={{-110,30},{-100,40}})));
  parameter Modelica.Blocks.Interfaces.RealInput Rcc
    "Current Collector Resistance in Ohms"
    annotation (Placement(transformation(extent={{-110,60},{-100,70}})));
  parameter Modelica.Blocks.Interfaces.RealInput A
    "Electrode area in square meter"
    annotation (Placement(transformation(extent={{-110,20},{-100,30}})));
  parameter Modelica.Blocks.Interfaces.RealInput Rbar
    "Universal Gas constant, 8.314 J/mol K"
    annotation (Placement(transformation(extent={{-110,0},{-100,10}})));
  parameter Modelica.Blocks.Interfaces.RealInput F
    "Faraday's Constant, Coulmb/mol, Ampere-second/mol"
    annotation (Placement(transformation(extent={{-110,-10},{-100,0}})));
  parameter Modelica.Blocks.Interfaces.RealInput epsilon_s
    "active material volume fraction of electrode"
    annotation (Placement(transformation(extent={{-110,-20},{-100,-10}})));
  parameter Modelica.Blocks.Interfaces.RealInput radius
    "particle radius of electrode active material, in m, magnitude usually 1e-6"
    annotation (Placement(transformation(extent={{-110,-40},{-100,-30}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ce_0
    "Initial Electrolyte concentration, in mol/m^3, usually 1e3"
    annotation (Placement(transformation(extent={{-110,10},{-100,20}})));
  Modelica.Blocks.Sources.RealExpression Lt(y=Lc + Ls + La)
    "Thickness of cell core"
    annotation (Placement(transformation(extent={{-60,28},{-22,38}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ea_D_e
    "Activation Energy for electrolyte diffusion coefficient, J/mol"
    annotation (Placement(transformation(extent={{-110,-70},{-100,-60}})));
  parameter Modelica.Blocks.Interfaces.RealInput Tref
    "Reference Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-110,-80},{-100,-70}})));
  Modelica.Blocks.Sources.RealExpression numerator1(y=coeff*Rbar*T*(1 - t_0))
    "first unnamed numerator"
    annotation (Placement(transformation(extent={{-60,38},{-20,50}})));
  RC_param.gamma_i gamma_i(
    t_0=t_0,
    F=F,
    epsilon_e=epsilon_e) "cathode"
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  parameter Modelica.Blocks.Interfaces.RealInput Beta
    "Liquid phase Activity Coefficient, Tuneable parameter"
    annotation (Placement(transformation(extent={{-110,-90},{-100,-80}})));
  parameter Modelica.Blocks.Interfaces.RealInput t_0 "transference number"
    annotation (Placement(transformation(extent={{-110,-60},{-100,-50}})));
  Arrh_Func arrh_Func2(Tref=Tref, Rbar=Rbar)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Math.Division division3
    annotation (Placement(transformation(extent={{10,10},{20,20}})));
  parameter Modelica.Blocks.Interfaces.RealInput D_e_ref
    "Eletrolyte Diffusion Coefficient"
    annotation (Placement(transformation(extent={{-110,-100},{-100,-90}})));
  Modelica.Blocks.Sources.RealExpression D_e_express(y=D_e_ref)
    "Electrolyte Diffusion Coefficient"
    annotation (Placement(transformation(extent={{-60,0},{-40,10}})));
  Modelica.Blocks.Sources.RealExpression Ea_D_e_express(y=Ea_D_e)
    annotation (Placement(transformation(extent={{-60,20},{-40,30}})));
  Modelica.Blocks.Sources.RealExpression Temp_express3(y=T)
    annotation (Placement(transformation(extent={{-60,12},{-40,22}})));
  Modelica.Blocks.Math.MultiProduct multiProduct(nu=4)
    annotation (Placement(transformation(extent={{40,0},{52,12}})));
  Modelica.Blocks.Sources.RealExpression numerator2(y=1 + Beta)
    "second unamed numerator"
    annotation (Placement(transformation(extent={{0,-42},{20,-32}})));
  Ro_param.ai ai(epsilon=epsilon_s, R=radius)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{70,-20},{80,-10}})));
  Modelica.Blocks.Sources.RealExpression denominator(y=A*F^2*Ce_0)
    annotation (Placement(transformation(extent={{0,-60},{20,-50}})));
  parameter Modelica.Blocks.Interfaces.RealInput coeff
    "numerical ceofficient of numerator, cathode is 0.248, anode 0.234"
    annotation (Placement(transformation(extent={{-110,70},{-100,80}})));
  parameter Modelica.Blocks.Interfaces.RealInput epsilon_e
    "volume fraction of electrolyte"
    annotation (Placement(transformation(extent={{-110,-30},{-100,-20}})));
equation
  connect(Lt.y, division3.u1) annotation (Line(points={{-20.1,33},{4,33},{4,18},
          {9,18}}, color={0,0,127}));
  connect(arrh_Func2.y, division3.u2)
    annotation (Line(points={{1,10},{4,10},{4,12},{9,12}}, color={0,0,127}));
  connect(D_e_express.y, arrh_Func2.P1) annotation (Line(points={{-39,5},{-30,5},
          {-30,10},{-22,10}}, color={0,0,127}));
  connect(Ea_D_e_express.y, arrh_Func2.Ea) annotation (Line(points={{-39,25},{
          -30.7,25},{-30.7,18},{-22,18}}, color={0,0,127}));
  connect(Temp_express3.y, arrh_Func2.T) annotation (Line(points={{-39,17},{
          -30.7,17},{-30.7,14},{-22,14}}, color={0,0,127}));
  connect(multiProduct.y, division1.u1) annotation (Line(points={{53.02,6},{60,
          6},{60,-12},{69,-12}}, color={0,0,127}));
  connect(numerator1.y, multiProduct.u[1]) annotation (Line(points={{-18,44},{
          36,44},{36,9.15},{40,9.15}}, color={0,0,127}));
  connect(division3.y, multiProduct.u[2]) annotation (Line(points={{20.5,15},{
          34,15},{34,7.05},{40,7.05}}, color={0,0,127}));
  connect(gamma_i.y, multiProduct.u[3]) annotation (Line(points={{21,-10},{28,
          -10},{28,4.95},{40,4.95}}, color={0,0,127}));
  connect(numerator2.y, multiProduct.u[4]) annotation (Line(points={{21,-37},{
          30,-37},{30,2.85},{40,2.85}}, color={0,0,127}));
  connect(denominator.y, division1.u2) annotation (Line(points={{21,-55},{60,
          -55},{60,-18},{69,-18}}, color={0,0,127}));
  connect(division1.y, y) annotation (Line(points={{80.5,-15},{92.25,-15},{
          92.25,0},{110,0}}, color={0,0,127}));
  connect(ai.y, gamma_i.ai) annotation (Line(points={{-19,-20},{-12,-20},{-12,
          -6},{-2,-6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Ri;
