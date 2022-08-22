within CU_IRP_perrinn_battery.Electrical.ECM.SoC_OCV;
model EP_16Ah8_NMC_4PartEq
  "Generalized SoC-OCV Model for EP 16.8 Ah NMC Battery"
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain c(k=-0.106)
    annotation (Placement(transformation(extent={{50,10},{60,20}})));
  Modelica.Blocks.Math.Gain b(k=-0.0434)
    annotation (Placement(transformation(extent={{50,40},{60,50}})));
  Modelica.Blocks.Sources.Constant a(k=3.5)
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Math.Gain negative(k=-1)
    annotation (Placement(transformation(extent={{-52,40},{-42,50}})));
  Modelica.Blocks.Math.Exp exp
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=4)
    annotation (Placement(transformation(extent={{80,-10},{90,0}})));
  Modelica.Blocks.Sources.Constant m(k=1.403)
    annotation (Placement(transformation(extent={{0,10},{10,20}})));
  Modelica.Blocks.Math.Log log
    annotation (Placement(transformation(extent={{-68,40},{-58,50}})));
  Modelica.Blocks.Interfaces.RealInput s
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Gain d(k=0.7399)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  MathPower_InputBase Power
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Math.Gain n(k=2)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Math.Add minus(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-50,-40},{-30,-20}})));
  Modelica.Blocks.Sources.Constant One(k=1)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin=1e-3, uMax=1)
    annotation (Placement(transformation(extent={{-84,40},{-74,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Modelica.Constants.inf, uMin=
        1e-2) annotation (Placement(transformation(extent={{-24,60},{-14,70}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,50},{10,60}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold
    annotation (Placement(transformation(extent={{-24,40},{-14,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMin=-Modelica.Constants.inf, uMax=
       -1e-2) annotation (Placement(transformation(extent={{-24,20},{-14,30}})));
equation
  connect(m.y, Power.power) annotation (Line(points={{10.5,15},{14,15},{14,46},
          {18,46}},
                  color={0,0,127}));
  connect(log.y, negative.u)
    annotation (Line(points={{-57.5,45},{-53,45}},
                                                 color={0,0,127}));
  connect(a.y, multiSum.u[1]) annotation (Line(points={{41,80},{70,80},{70,
          -2.375},{80,-2.375}},
                      color={0,0,127}));
  connect(b.y, multiSum.u[2]) annotation (Line(points={{60.5,45},{68,45},{68,
          -4.125},{80,-4.125}},
                      color={0,0,127}));
  connect(c.y, multiSum.u[3]) annotation (Line(points={{60.5,15},{66,15},{66,
          -5.875},{80,-5.875}},
                              color={0,0,127}));
  connect(d.y, multiSum.u[4]) annotation (Line(points={{61,-30},{68,-30},{68,
          -7.625},{80,-7.625}},
                              color={0,0,127}));
  connect(exp.y, d.u)
    annotation (Line(points={{31,-30},{38,-30}}, color={0,0,127}));
  connect(n.y, exp.u)
    annotation (Line(points={{1,-30},{8,-30}}, color={0,0,127}));
  connect(One.y, minus.u2) annotation (Line(points={{-59,-50},{-56,-50},{-56,-36},
          {-52,-36}}, color={0,0,127}));
  connect(minus.y, n.u) annotation (Line(points={{-29,-30},{-25.5,-30},{-25.5,
          -30},{-22,-30}}, color={0,0,127}));
  connect(Power.y, b.u) annotation (Line(points={{41,50},{46,50},{46,45},{49,45}},
        color={0,0,127}));
  connect(s, limiter.u) annotation (Line(points={{-120,0},{-90,0},{-90,45},{-85,
          45}}, color={0,0,127}));
  connect(limiter.y, log.u)
    annotation (Line(points={{-73.5,45},{-69,45}}, color={0,0,127}));
  connect(minus.u1, limiter.u) annotation (Line(points={{-52,-24},{-90,-24},{
          -90,45},{-85,45}}, color={0,0,127}));
  connect(c.u, limiter.u) annotation (Line(points={{49,15},{30,15},{30,0},{-90,
          0},{-90,45},{-85,45}}, color={0,0,127}));
  connect(negative.y, greaterEqualThreshold.u)
    annotation (Line(points={{-41.5,45},{-25,45}}, color={0,0,127}));
  connect(multiSum.y, y) annotation (Line(points={{90.85,-5},{96.425,-5},{
          96.425,0},{110,0}}, color={0,0,127}));
  connect(greaterEqualThreshold.y, switch1.u2) annotation (Line(points={{-13.5,
          45},{-8,45},{-8,55},{-1,55}}, color={255,0,255}));
  connect(limiter1.y, switch1.u1) annotation (Line(points={{-13.5,65},{-6,65},{
          -6,59},{-1,59}}, color={0,0,127}));
  connect(limiter2.y, switch1.u3) annotation (Line(points={{-13.5,25},{-6,25},{
          -6,51},{-1,51}}, color={0,0,127}));
  connect(switch1.y, Power.base) annotation (Line(points={{10.5,55},{14.25,55},
          {14.25,54},{18,54}}, color={0,0,127}));
  connect(limiter1.u, negative.y) annotation (Line(points={{-25,65},{-34,65},{
          -34,45},{-41.5,45}}, color={0,0,127}));
  connect(limiter2.u, negative.y) annotation (Line(points={{-25,25},{-34,25},{
          -34,45},{-41.5,45}}, color={0,0,127}));
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
          textString="EP 16Ah8")}),                              Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end EP_16Ah8_NMC_4PartEq;
