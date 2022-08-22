within CU_IRP_perrinn_battery.Electrical.SoC_Estimation;
model Columb_Counting_delta995
  Modelica.Blocks.Interfaces.RealOutput DoD annotation (Placement(
        transformation(extent={{100,0},{120,20}}),iconTransformation(extent={{-10,-10},
            {10,10}},
        rotation=270,
        origin={-50,-110})));
  Modelica.Blocks.Interfaces.RealOutput SoC annotation (Placement(
        transformation(extent={{100,-40},{120,-20}}),iconTransformation(extent={{-10,-10},
            {10,10}},
        rotation=270,
        origin={50,-110})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Interfaces.RealInput Qtyp_Ah
    "Typical Capacity of cell in Amp-hour" annotation (Placement(transformation(
          extent={{-120,-40},{-100,-20}}),iconTransformation(extent={{-20,-20},
            {20,20}},
        rotation=270,
        origin={-60,120})));
  Modelica.Blocks.Math.Add add_DoDtoSoC(k1=-1)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Math.Gain gain(k=3600)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin
              p
    "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}),  iconTransformation(extent={{-120,
            -20},{-80,20}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin
              n "Negative pin" annotation (Placement(transformation(extent={{110,50},
            {90,70}}),          iconTransformation(extent={{120,-20},{80,20}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={0,80})));
  Modelica.Blocks.Math.Add add_Current annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=270,
        origin={-45,15})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
                                                                 annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode(
    Ron=0,
    Goff=0,
    Vknee=0) annotation (Placement(transformation(extent={{30,70},{50,90}})));
  Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode1(
    Ron=0,
    Goff=0,
    Vknee=0) annotation (Placement(transformation(extent={{-20,40},{-40,60}})));
  Modelica.Blocks.Math.Gain delta(k=0.995)
    annotation (Placement(transformation(extent={{5,-5},{-5,5}},
        rotation=0,
        origin={-25,35})));
equation
  connect(integrator.y, division.u1) annotation (Line(points={{-9,0},{-6,0},{-6,
          -4},{-2,-4}},      color={0,0,127}));
  connect(division.y, DoD) annotation (Line(points={{21,-10},{40,-10},{40,10},{
          110,10}},color={0,0,127}));
  connect(const.y, add_DoDtoSoC.u2) annotation (Line(points={{21,-50},{28,-50},
          {28,-56},{38,-56}}, color={0,0,127}));
  connect(add_DoDtoSoC.y, SoC) annotation (Line(points={{61,-50},{70,-50},{70,
          -30},{110,-30}}, color={0,0,127}));
  connect(division.y, add_DoDtoSoC.u1) annotation (Line(points={{21,-10},{30,-10},
          {30,-44},{38,-44}}, color={0,0,127}));
  connect(Qtyp_Ah, gain.u)
    annotation (Line(points={{-110,-30},{-62,-30}}, color={0,0,127}));
  connect(gain.y, division.u2) annotation (Line(points={{-39,-30},{-20,-30},{
          -20,-16},{-2,-16}}, color={0,0,127}));
  connect(currentSensor.p, p) annotation (Line(points={{-10,80},{-60,80},{-60,
          60},{-100,60}}, color={0,0,255}));
  connect(add_Current.y, integrator.u)
    annotation (Line(points={{-45,9.5},{-45,0},{-32,0}}, color={0,0,127}));
  connect(currentSensor.n, idealDiode.p)
    annotation (Line(points={{10,80},{30,80}}, color={0,0,255}));
  connect(idealDiode.n, n) annotation (Line(points={{50,80},{74,80},{74,60},{
          100,60}}, color={0,0,255}));
  connect(idealDiode1.n, p) annotation (Line(points={{-40,50},{-60,50},{-60,60},
          {-100,60}}, color={0,0,255}));
  connect(idealDiode1.p, currentSensor1.p)
    annotation (Line(points={{-20,50},{-10,50}}, color={0,0,255}));
  connect(currentSensor1.n, n) annotation (Line(points={{10,50},{74,50},{74,60},
          {100,60}}, color={0,0,255}));
  connect(delta.u, currentSensor1.i) annotation (Line(points={{-19,35},{-19,
          35.5},{-1.77636e-15,35.5},{-1.77636e-15,40}}, color={0,0,127}));
  connect(delta.y, add_Current.u1)
    annotation (Line(points={{-30.5,35},{-42,35},{-42,21}}, color={0,0,127}));
  connect(currentSensor.i, add_Current.u2) annotation (Line(points={{0,70},{0,
          64},{-48,64},{-48,21}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-100,100},{0,20}},
          lineColor={28,108,200},
          textString="Qtyp
(Ah)"), Text(
          extent={{-100,-40},{0,-100}},
          lineColor={28,108,200},
          textString="DoD"),
        Text(
          extent={{0,-40},{100,-100}},
          lineColor={28,108,200},
          textString="SoC")}), Diagram(coordinateSystem(preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200})}));
end Columb_Counting_delta995;
