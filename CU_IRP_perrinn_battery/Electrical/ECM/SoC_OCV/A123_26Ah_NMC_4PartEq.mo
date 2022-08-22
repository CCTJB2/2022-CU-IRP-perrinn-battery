within CU_IRP_perrinn_battery.Electrical.ECM.SoC_OCV;
model A123_26Ah_NMC_4PartEq "Generalized SoC-OCV  Model"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain c(k=-0.106)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Modelica.Blocks.Math.Gain b(k=-0.0434)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Sources.Constant a(k=3.5)
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Math.Gain negative(k=-1)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=4)
    annotation (Placement(transformation(extent={{74,-10},{94,10}})));
  Modelica.Blocks.Sources.Constant m(k=1.403)
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  MathPower_InputBase Power
    annotation (Placement(transformation(extent={{10,40},{30,60}})));
  Modelica.Blocks.Math.Log log
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Blocks.Interfaces.RealInput s
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Gain d(k=0.7399)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Modelica.Blocks.Math.Gain n(k=2)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Math.Add minus(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-50,-40},{-30,-20}})));
  Modelica.Blocks.Sources.Constant One(k=1)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.Max max
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.Constant epsilon(k=ModelicaServices.Machine.small)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,70})));
equation
  connect(multiSum.y, y)
    annotation (Line(points={{95.7,0},{110,0}}, color={0,0,127}));
  connect(m.y, Power.power) annotation (Line(points={{1,20},{4,20},{4,46},{8,46}},
                  color={0,0,127}));
  connect(negative.y, Power.base) annotation (Line(points={{1,50},{4,50},{4,54},
          {8,54}},     color={0,0,127}));
  connect(log.y, negative.u)
    annotation (Line(points={{-29,50},{-22,50}}, color={0,0,127}));
  connect(Power.y, b.u)
    annotation (Line(points={{31,50},{38,50}}, color={0,0,127}));
  connect(a.y, multiSum.u[1]) annotation (Line(points={{41,80},{70,80},{70,5.25},
          {74,5.25}}, color={0,0,127}));
  connect(b.y, multiSum.u[2]) annotation (Line(points={{61,50},{68,50},{68,1.75},
          {74,1.75}}, color={0,0,127}));
  connect(c.y, multiSum.u[3]) annotation (Line(points={{51,20},{66,20},{66,
          -1.75},{74,-1.75}}, color={0,0,127}));
  connect(d.y, multiSum.u[4]) annotation (Line(points={{61,-30},{68,-30},{68,
          -5.25},{74,-5.25}}, color={0,0,127}));
  connect(exp.y, d.u)
    annotation (Line(points={{31,-30},{38,-30}}, color={0,0,127}));
  connect(n.y, exp.u)
    annotation (Line(points={{1,-30},{8,-30}}, color={0,0,127}));
  connect(One.y, minus.u2) annotation (Line(points={{-59,-50},{-56,-50},{-56,-36},
          {-52,-36}}, color={0,0,127}));
  connect(minus.y, n.u) annotation (Line(points={{-29,-30},{-25.5,-30},{-25.5,
          -30},{-22,-30}}, color={0,0,127}));
  connect(max.y, log.u)
    annotation (Line(points={{-59,50},{-52,50}}, color={0,0,127}));
  connect(epsilon.y, max.u1)
    annotation (Line(points={{-90,59},{-90,56},{-82,56}}, color={0,0,127}));
  connect(s, max.u2) annotation (Line(points={{-120,0},{-90,0},{-90,44},{-82,44}},
        color={0,0,127}));
  connect(c.u, max.u2) annotation (Line(points={{28,20},{20,20},{20,0},{-90,0},
          {-90,44},{-82,44}}, color={0,0,127}));
  connect(minus.u1, max.u2) annotation (Line(points={{-52,-24},{-90,-24},{-90,
          44},{-82,44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-90,-30},{90,-90}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="4PartEq"),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-90,30},{90,-30}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="SoC-OCV"),
        Text(
          extent={{-96,90},{98,30}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="A123 26Ah")}),                             Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end A123_26Ah_NMC_4PartEq;
