within CU_IRP_perrinn_battery.Electrical.Batteries;
model SoC_OCV "Generalized SoC-OCV  Model"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Log log
    annotation (Placement(transformation(extent={{-6,-52},{14,-32}})));
  Modelica.Blocks.Math.Gain c(k=1)
    annotation (Placement(transformation(extent={{-38,-52},{-18,-32}})));
  Modelica.Blocks.Math.Gain b(k=-0.0334)
    annotation (Placement(transformation(extent={{30,40},{50,60}})));
  Modelica.Blocks.Sources.Constant a(k=3.5)
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Modelica.Blocks.Math.Gain d(k=0.7399)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Blocks.Math.Gain negative(k=-1)
    annotation (Placement(transformation(extent={{-22,40},{-2,60}})));
  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{22,-80},{42,-60}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=5)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Math.Power power
    annotation (Placement(transformation(extent={{24,-20},{44,0}})));
  Modelica.Blocks.Sources.Constant m(k=1.4)
    annotation (Placement(transformation(extent={{-28,72},{-8,92}})));
  MathPower_InputBase mathPower_InputBase
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Blocks.Sources.Constant m1(k=10)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant m2(k=3)
    annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
equation
  connect(multiSum.u[1], a.y)
    annotation (Line(points={{70,5.6},{70,80},{61,80}}, color={0,0,127}));
  connect(b.y, multiSum.u[2]) annotation (Line(points={{51,50},{60,50},{60,2.8},
          {70,2.8}}, color={0,0,127}));
  connect(m.y, power.u) annotation (Line(points={{-7,82},{16,82},{16,-10},{22,
          -10}}, color={0,0,127}));
  connect(mathPower_InputBase.y, realValue.numberPort)
    annotation (Line(points={{-19,10},{-11.5,10}}, color={0,0,127}));
  connect(m2.y, mathPower_InputBase.power) annotation (Line(points={{-49,-20},{
          -44,-20},{-44,6},{-40,6}}, color={0,0,127}));
  connect(m1.y, mathPower_InputBase.base) annotation (Line(points={{-59,30},{
          -50,30},{-50,14},{-40,14}}, color={0,0,127}));
  connect(multiSum.y, y)
    annotation (Line(points={{91.7,0},{110,0}}, color={0,0,127}));
  connect(negative.y, b.u)
    annotation (Line(points={{-1,50},{28,50}}, color={0,0,127}));
  connect(power.y, multiSum.u[3]) annotation (Line(points={{45,-10},{58,-10},{
          58,0},{70,0}}, color={0,0,127}));
  connect(log.y, multiSum.u[4]) annotation (Line(points={{15,-42},{62,-42},{62,
          -2.8},{70,-2.8}}, color={0,0,127}));
  connect(c.y, log.u)
    annotation (Line(points={{-17,-42},{-8,-42}}, color={0,0,127}));
  connect(c.u, mathPower_InputBase.power) annotation (Line(points={{-40,-42},{
          -44,-42},{-44,6},{-40,6}}, color={0,0,127}));
  connect(d.u, c.u) annotation (Line(points={{-22,-70},{-46,-70},{-46,-42},{-40,
          -42}}, color={0,0,127}));
  connect(d.y, exp.u)
    annotation (Line(points={{1,-70},{20,-70}}, color={0,0,127}));
  connect(exp.y, multiSum.u[5])
    annotation (Line(points={{43,-70},{70,-70},{70,-5.6}}, color={0,0,127}));
  connect(negative.u, mathPower_InputBase.base) annotation (Line(points={{-24,
          50},{-50,50},{-50,14},{-40,14}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SoC_OCV;
