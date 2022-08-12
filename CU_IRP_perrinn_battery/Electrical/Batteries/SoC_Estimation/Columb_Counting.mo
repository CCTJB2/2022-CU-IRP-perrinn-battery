within CU_IRP_perrinn_battery.Electrical.Batteries.SoC_Estimation;
model Columb_Counting
  Modelica.Blocks.Interfaces.RealOutput DoD annotation (Placement(
        transformation(extent={{80,0},{100,20}}), iconTransformation(extent={{100,40},
            {120,60}})));
  Modelica.Blocks.Interfaces.RealInput Iload_A annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent=
           {{-122,40},{-82,80}})));
  Modelica.Blocks.Interfaces.RealOutput SoC annotation (Placement(
        transformation(extent={{80,-40},{100,-20}}), iconTransformation(extent={{100,-10},
            {120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Interfaces.RealInput Qtyp_Ah
    "Typical Capacity of cell in Amp-hour" annotation (Placement(transformation(
          extent={{-110,-40},{-90,-20}}), iconTransformation(extent={{-120,-20},
            {-80,20}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Math.Gain gain(k=3600)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
equation
  connect(Iload_A, integrator.u) annotation (Line(points={{-100,0},{-72,0},{-72,
          10},{-42,10}}, color={0,0,127}));
  connect(integrator.y, division.u1) annotation (Line(points={{-19,10},{-12,10},
          {-12,-4},{-2,-4}}, color={0,0,127}));
  connect(division.y, DoD) annotation (Line(points={{21,-10},{40,-10},{40,10},{
          90,10}}, color={0,0,127}));
  connect(const.y, add.u2) annotation (Line(points={{21,-50},{28,-50},{28,-56},
          {38,-56}}, color={0,0,127}));
  connect(add.y, SoC) annotation (Line(points={{61,-50},{70,-50},{70,-30},{90,
          -30}}, color={0,0,127}));
  connect(division.y, add.u1) annotation (Line(points={{21,-10},{30,-10},{30,
          -44},{38,-44}}, color={0,0,127}));
  connect(Qtyp_Ah, gain.u)
    annotation (Line(points={{-100,-30},{-62,-30}}, color={0,0,127}));
  connect(gain.y, division.u2) annotation (Line(points={{-39,-30},{-20,-30},{
          -20,-16},{-2,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-60,100},{60,60}},
          lineColor={28,108,200},
          textString="Iload_A"),
        Text(
          extent={{-60,40},{60,0}},
          lineColor={28,108,200},
          textString="Qtyp_Ah"),
        Text(
          extent={{122,100},{220,60}},
          lineColor={28,108,200},
          textString="DoD"),
        Text(
          extent={{120,40},{220,0}},
          lineColor={28,108,200},
          textString="SoC")}), Diagram(coordinateSystem(preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200})}));
end Columb_Counting;
