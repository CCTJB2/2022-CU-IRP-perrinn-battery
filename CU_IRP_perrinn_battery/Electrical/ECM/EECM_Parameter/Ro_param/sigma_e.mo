within CU_IRP_perrinn_battery.Electrical.ECM.EECM_Parameter.Ro_param;
block sigma_e "Calculation of effective conductivity of electrolyte"
  Modelica.Blocks.Interfaces.RealOutput y
    "effective ionic conductivity of electrolyte, mS/cm"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput T "Temperature in Kelvins"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  parameter Modelica.Blocks.Interfaces.RealInput Ce_0
    "Initial Electrolyte Concentration in mol/m^3, 1e3"
    annotation (Placement(transformation(extent={{-110,-66},{-100,-56}})));
  Modelica.Blocks.Math.MultiProduct T_square(nu=2) "Square of Temperature"
    annotation (Placement(transformation(extent={{-82,-20},{-72,-10}})));
  Modelica.Blocks.Sources.Constant K00(k=-10.5) "Coefficient i j"
    annotation (Placement(transformation(extent={{-52,80},{-42,90}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{60,0},{70,10}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=5)
    annotation (Placement(transformation(extent={{20,10},{30,20}})));
  Modelica.Blocks.Math.Gain K01(k=0.074) "Coefficient i j"
    annotation (Placement(transformation(extent={{-52,60},{-42,70}})));
  Modelica.Blocks.Math.Gain K02(k=-6.96e-5) "Coefficient i j"
    annotation (Placement(transformation(extent={{-52,40},{-42,50}})));
  Modelica.Blocks.Math.Gain K11(k=-0.0178) "Coefficient i j"
    annotation (Placement(transformation(extent={{-32,0},{-22,10}})));
  Modelica.Blocks.Math.Gain K12(k=2.8e-5) "Coefficient i j"
    annotation (Placement(transformation(extent={{-32,-20},{-22,-10}})));
  Modelica.Blocks.Math.Gain K21(k=-8.86e-4) "Coefficient i j"
    annotation (Placement(transformation(extent={{-60,-60},{-50,-50}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=Ce_0*1e-3)
    annotation (Placement(transformation(extent={{-66,-80},{-50,-70}})));
  Modelica.Blocks.Sources.Constant K20(k=0.494) "Coefficient i j"
    annotation (Placement(transformation(extent={{-60,-40},{-50,-30}})));
  Modelica.Blocks.Sources.Constant K10(k=0.668) "Coefficient i j"
    annotation (Placement(transformation(extent={{-32,20},{-22,30}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-2,0},{8,10}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{0,-40},{10,-30}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{40,10},{50,20}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{-22,-80},{-12,-70}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-30,-40},{-20,-30}})));
  Modelica.Blocks.Math.Gain Gain(k=0.1) "Coefficient i j"
    annotation (Placement(transformation(extent={{80,0},{90,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=Ce_0*1e-3)
    annotation (Placement(transformation(extent={{20,-80},{36,-70}})));
equation
  connect(T_square.u[1], T) annotation (Line(points={{-82,-13.25},{-86,-13.25},
          {-86,0},{-120,0}}, color={0,0,127}));
  connect(T_square.u[2], T) annotation (Line(points={{-82,-16.75},{-92,-16.75},
          {-92,0},{-120,0}}, color={0,0,127}));
  connect(K00.y, multiSum.u[1]) annotation (Line(points={{-41.5,85},{16,85},{16,
          17.8},{20,17.8}}, color={0,0,127}));
  connect(K01.u, T) annotation (Line(points={{-53,65},{-92,65},{-92,0},{-120,0}},
        color={0,0,127}));
  connect(K01.y, multiSum.u[2]) annotation (Line(points={{-41.5,65},{14,65},{14,
          16.4},{20,16.4}}, color={0,0,127}));
  connect(K02.y, multiSum.u[3]) annotation (Line(points={{-41.5,45},{12,45},{12,
          15},{20,15}}, color={0,0,127}));
  connect(T_square.y, K02.u) annotation (Line(points={{-71.15,-15},{-68,-15},{
          -68,45},{-53,45}}, color={0,0,127}));
  connect(K11.u, T) annotation (Line(points={{-33,5},{-75.5,5},{-75.5,0},{-120,
          0}}, color={0,0,127}));
  connect(K12.u, T_square.y) annotation (Line(points={{-33,-15},{-71.15,-15}},
                                    color={0,0,127}));
  connect(K11.y, add3_1.u2) annotation (Line(points={{-21.5,5},{-3,5}},
                  color={0,0,127}));
  connect(K10.y, add3_1.u1) annotation (Line(points={{-21.5,25},{-12.75,25},{
          -12.75,9},{-3,9}},
                           color={0,0,127}));
  connect(K12.y, add3_1.u3) annotation (Line(points={{-21.5,-15},{-11.75,-15},{
          -11.75,1},{-3,1}},
                          color={0,0,127}));
  connect(multiSum.y, product2.u2) annotation (Line(points={{30.85,15},{35.425,
          15},{35.425,12},{39,12}}, color={0,0,127}));
  connect(multiSum.y, product2.u1) annotation (Line(points={{30.85,15},{34.425,
          15},{34.425,18},{39,18}}, color={0,0,127}));
  connect(product2.y, product.u1) annotation (Line(points={{50.5,15},{54.25,15},
          {54.25,8},{59,8}}, color={0,0,127}));
  connect(add3_1.y, multiSum.u[4]) annotation (Line(points={{8.5,5},{12,5},{12,
          14},{20,14},{20,13.6}}, color={0,0,127}));
  connect(product3.y, product1.u2) annotation (Line(points={{-11.5,-75},{-4,-75},
          {-4,-38},{-1,-38}}, color={0,0,127}));
  connect(add.y, product1.u1) annotation (Line(points={{-19.5,-35},{-3.75,-35},
          {-3.75,-32},{-1,-32}},color={0,0,127}));
  connect(add.u2, K21.y) annotation (Line(points={{-31,-38},{-36,-38},{-36,-55},
          {-49.5,-55}},
                      color={0,0,127}));
  connect(K20.y, add.u1) annotation (Line(points={{-49.5,-35},{-38,-35},{-38,
          -32},{-31,-32}},
                     color={0,0,127}));
  connect(product1.y, multiSum.u[5]) annotation (Line(points={{10.5,-35},{14,
          -35},{14,12.2},{20,12.2}}, color={0,0,127}));
  connect(realExpression2.y, product3.u2) annotation (Line(points={{-49.2,-75},
          {-29.75,-75},{-29.75,-78},{-23,-78}}, color={0,0,127}));
  connect(product3.u1, realExpression2.y) annotation (Line(points={{-23,-72},{
          -30,-72},{-30,-75},{-49.2,-75}}, color={0,0,127}));
  connect(K21.u, T) annotation (Line(points={{-61,-55},{-96,-55},{-96,0},{-120,
          0}}, color={0,0,127}));
  connect(Gain.u, product.y) annotation (Line(points={{79,5},{75.5,5},{75.5,5},
          {70.5,5}}, color={0,0,127}));
  connect(Gain.y, y) annotation (Line(points={{90.5,5},{96.25,5},{96.25,0},{110,
          0}}, color={0,0,127}));
  connect(realExpression1.y, product.u2) annotation (Line(points={{36.8,-75},{
          54,-75},{54,2},{59,2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{70,38},{98,20}},
          lineColor={28,108,200},
          textString="mS/cm to S/m")}));
end sigma_e;
