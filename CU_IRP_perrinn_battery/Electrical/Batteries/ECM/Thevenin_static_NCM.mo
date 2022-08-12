within CU_IRP_perrinn_battery.Electrical.Batteries.ECM;
block Thevenin_static_NCM
  Modelica.Electrical.Spice3.Basic.R_Resistor R0(R=1.5e-3)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R1(R=4.7e-3)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C2(C=2.932e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,0})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R2(R=300e-6)
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C1(C=180e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,0})));
  Modelica.Electrical.Analog.Interfaces.PositivePin
              p
    "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent
          ={{-120,-20},{-80,20}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin
              n "Negative pin" annotation (Placement(transformation(extent={{
            110,-10},{90,10}}), iconTransformation(extent={{120,-20},{80,20}})));
equation
  connect(R1.p,R0. n) annotation (Line(points={{-10,20},{-20,20},{-20,0},{-30,0}},
        color={0,0,255}));
  connect(C1.n,C2. p)
    annotation (Line(points={{10,0},{30,0}},   color={0,0,255}));
  connect(C1.p,R0. n)
    annotation (Line(points={{-10,0},{-30,0}}, color={0,0,255}));
  connect(R1.n,C2. p) annotation (Line(points={{10,20},{18,20},{18,0},{30,0}},
        color={0,0,255}));
  connect(R2.p,C2. p) annotation (Line(points={{30,20},{24,20},{24,0},{30,0}},
        color={0,0,255}));
  connect(R2.n, C2.n)
    annotation (Line(points={{50,20},{50,0}}, color={0,0,255}));
  connect(p, R0.p)
    annotation (Line(points={{-100,0},{-50,0}}, color={0,0,255}));
  connect(C2.n, n) annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-120,40},{-101,30},{-120,20},{-120,40}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Line(points={{-125,0},{-115,0}}, color={160,160,164}),
        Line(points={{-120,-5},{-120,5}}, color={160,160,164}),
        Line(points={{115,0},{125,0}}, color={160,160,164}),
        Text(
          extent={{-150,140},{150,100}},
          textString="%name",
          lineColor={0,0,255}),
        Rectangle(
          extent={{-160,32},{-120,28}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-160,100},{-100,40}},
          lineColor={160,160,164},
          textString="i"),
        Polygon(
          points={{140,40},{159,30},{140,20},{140,40}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{100,32},{140,28}},
          lineColor={160,160,164},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{100,100},{160,40}},
          lineColor={160,160,164},
          textString="i"),
        Text(
          extent={{-70,80},{70,-80}},
          lineColor={28,108,200},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          textString="2RC")}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end Thevenin_static_NCM;
