within CU_IRP_perrinn_battery.Thermal;
block Thermal_1D
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow(
      T_ref=298.15)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=Cp*m, T(start=
          298.15, fixed=true))
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=
        k*A/L) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={30,-50})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Math.Add add_Heat_Rejection(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{-6,-48},{6,-36}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Blocks.Interfaces.RealOutput Temp
    annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
        iconTransformation(extent={{100,-50},{120,-30}})));
  constant
  Modelica.Blocks.Interfaces.RealInput m "mass in grams" annotation (Placement(
        transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent=
           {{-140,20},{-100,60}})));
  constant
  Modelica.Blocks.Interfaces.RealInput Cp "specific heat, calorific capacity"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_m
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Interaction.Show.RealValue realValue_Cp
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Interaction.Show.RealValue realvalue_k "thermal_conductivity"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  constant
  Modelica.Blocks.Interfaces.RealInput k
    "effective thermal conductivity along cell layer stack direction"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interaction.Show.RealValue realvalue_A "thermal_conductivity"
    annotation (Placement(transformation(extent={{-58,-50},{-38,-30}})));
  constant
  Modelica.Blocks.Interfaces.RealInput A "area of cell facing x-direction"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}),
        iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interaction.Show.RealValue realvalue_L
    "thermal_conductivity W/m K"
    annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));
  constant
  Modelica.Blocks.Interfaces.RealInput L
    "distance along direction of heat flow, cell thickness"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}),
        iconTransformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealInput Qirr "Irreversible heat generation"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={70,120})));
  Modelica.Blocks.Interfaces.RealInput Qrev "Reversible heat generation"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  connect(add_Heat_Rejection.y, prescribedHeatFlow.Q_flow) annotation (Line(
        points={{6.6,-42},{12,-42},{12,0},{20,0}}, color={0,0,127}));
  connect(prescribedHeatFlow.port, heatCapacitor.port)
    annotation (Line(points={{40,0},{50,0}}, color={191,0,0}));
  connect(thermalConductor.port_b, heatCapacitor.port)
    annotation (Line(points={{40,-50},{50,-50},{50,0}}, color={191,0,0}));
  connect(heatCapacitor.port, temperatureSensor.port)
    annotation (Line(points={{50,0},{70,0}}, color={191,0,0}));
  connect(Temp, temperatureSensor.T)
    annotation (Line(points={{110,-40},{100,-40},{100,0},{90,0}},
                                              color={0,0,127}));
  connect(realValue_Cp.numberPort, Cp)
    annotation (Line(points={{-61.5,80},{-120,80}}, color={0,0,127}));
  connect(realValue_m.numberPort, m)
    annotation (Line(points={{-61.5,40},{-120,40}}, color={0,0,127}));
  connect(realvalue_k.numberPort, k)
    annotation (Line(points={{-61.5,0},{-120,0}}, color={0,0,127}));
  connect(realvalue_A.numberPort, A)
    annotation (Line(points={{-59.5,-40},{-120,-40}}, color={0,0,127}));
  connect(thermalConductor.port_a, port_a) annotation (Line(points={{20,-50},{
          10,-50},{10,-80},{0,-80},{0,-100}}, color={191,0,0}));
  connect(realvalue_L.numberPort, L)
    annotation (Line(points={{-61.5,-80},{-120,-80}}, color={0,0,127}));
  connect(Qrev, add_Heat_Rejection.u2) annotation (Line(points={{0,120},{0,80},
          {-30,80},{-30,-45.6},{-7.2,-45.6}}, color={0,0,127}));
  connect(Qirr, add_Heat_Rejection.u1) annotation (Line(points={{60,120},{60,68},
          {-20,68},{-20,-38.4},{-7.2,-38.4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-100,100},{-40,50}},
          lineColor={28,108,200},
          textString="Cp"),
        Text(
          extent={{-100,-12},{-36,-62}},
          lineColor={28,108,200},
          textString="A"),
        Text(
          extent={{-100,66},{-40,16}},
          lineColor={28,108,200},
          textString="m"),
        Text(
          extent={{-100,28},{-40,-22}},
          lineColor={28,108,200},
          textString="k"),
        Text(
          extent={{-100,-50},{-36,-100}},
          lineColor={28,108,200},
          textString="L"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{4,0},{94,-80}},
          lineColor={28,108,200},
          textString="Temp"),
        Text(
          extent={{0,50},{100,0}},
          lineColor={28,108,200},
          textString="Qirr"),
        Text(
          extent={{-40,100},{60,50}},
          lineColor={28,108,200},
          textString="Qrev")}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end Thermal_1D;
