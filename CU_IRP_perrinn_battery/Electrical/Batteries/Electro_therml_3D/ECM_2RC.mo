within CU_IRP_perrinn_battery.Electrical.Batteries.Electro_therml_3D;
model ECM_2RC
  Modelica.Electrical.Spice3.Basic.R_Resistor R0(R=1.5e-3)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R1(R=4.7e-3)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C2(C=2.932e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,50})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R2(R=300e-6)
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition=
        V_cell.v < 2.5)
    annotation (Placement(transformation(extent={{-86,-76},{-6,-68}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={130,50})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C1(C=180e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,50})));
  Modelica.Electrical.Analog.Sources.SignalCurrent LoadCurrent annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={10,10})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_cell annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,10})));
  Modelica.Blocks.Tables.CombiTable1Ds DoD_OCV(
    tableOnFile=true,
    tableName="table",
    fileName=
        "Z:/OneDrive - The Hong Kong Polytechnic University/Cranfield Studies/4 Course Projects/IRP Battery/A123/A123_OCV_Discharge.mat")
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Columb_Counting columb_Counting annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,110})));
  Modelica.Blocks.Sources.Constant Ah(k=26)
    annotation (Placement(transformation(extent={{120,80},{100,100}})));
  Modelica.Blocks.Sources.Constant Idischarge_A(k=260) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={190,10})));
  Columb_Counting columb_Counting1
    annotation (Placement(transformation(extent={{160,80},{180,100}})));
equation
  connect(R1.p, R0.n) annotation (Line(points={{40,70},{30,70},{30,50},{20,50}},
        color={0,0,255}));
  connect(C1.n, C2.p)
    annotation (Line(points={{60,50},{80,50}}, color={0,0,255}));
  connect(C1.p, R0.n)
    annotation (Line(points={{40,50},{20,50}}, color={0,0,255}));
  connect(R1.n, C2.p) annotation (Line(points={{60,70},{68,70},{68,50},{80,50}},
        color={0,0,255}));
  connect(R2.p, C2.p) annotation (Line(points={{80,70},{74,70},{74,50},{80,50}},
        color={0,0,255}));
  connect(OCV.p, R0.p)
    annotation (Line(points={{-30,20},{-30,50},{0,50}}, color={0,0,255}));
  connect(LoadCurrent.n, ground.p)
    annotation (Line(points={{150,0},{150,-20},{50,-20}}, color={0,0,255}));
  connect(OCV.n, ground.p)
    annotation (Line(points={{-30,0},{-30,-20},{50,-20}}, color={0,0,255}));
  connect(V_OCV.p, OCV.p)
    annotation (Line(points={{10,20},{-30,20}}, color={0,0,255}));
  connect(OCV.n, V_OCV.n)
    annotation (Line(points={{-30,0},{10,0}}, color={0,0,255}));
  connect(V_cell.p, LoadCurrent.p)
    annotation (Line(points={{110,20},{150,20}}, color={0,0,255}));
  connect(V_cell.n, LoadCurrent.n) annotation (Line(points={{110,-3.55271e-15},
          {130,-3.55271e-15},{130,0},{150,0}}, color={0,0,255}));
  connect(DoD_OCV.y[1], OCV.v)
    annotation (Line(points={{-59,10},{-37,10}}, color={0,0,127}));
  connect(Idischarge_A.y, LoadCurrent.i)
    annotation (Line(points={{179,10},{157,10}}, color={0,0,127}));
  connect(Ah.y, columb_Counting.Qtyp_Ah) annotation (Line(points={{99,90},{92,
          90},{92,110},{80,110}}, color={0,0,127}));
  connect(currentSensor.i, columb_Counting.Iload_A)
    annotation (Line(points={{130,60},{130,116},{80.2,116}}, color={0,0,127}));
  connect(C2.n, currentSensor.p)
    annotation (Line(points={{100,50},{120,50}}, color={0,0,255}));
  connect(R2.n, currentSensor.p) annotation (Line(points={{100,70},{110,70},{
          110,50},{120,50}}, color={0,0,255}));
  connect(currentSensor.n, LoadCurrent.p)
    annotation (Line(points={{140,50},{150,50},{150,20}}, color={0,0,255}));
  connect(columb_Counting.DoD, DoD_OCV.u) annotation (Line(points={{60,116},{
          -90,116},{-90,10},{-82,10}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{220,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            220,140}})),
    experiment(StopTime=360),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end ECM_2RC;
