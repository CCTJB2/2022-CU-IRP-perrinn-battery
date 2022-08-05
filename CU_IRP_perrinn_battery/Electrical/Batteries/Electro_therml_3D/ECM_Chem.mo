within CU_IRP_perrinn_battery.Electrical.Batteries.Electro_therml_3D;
model ECM_Chem "Chemically dependent Equivalent Circuit Model"
  Modelica.Electrical.Spice3.Basic.R_Resistor R0(R=1.5e-3)
    annotation (Placement(transformation(extent={{50,38},{70,58}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-30,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R1(R=4.7e-3)
    annotation (Placement(transformation(extent={{90,58},{110,78}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C2(C=2.932e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={140,48})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R2(R=300e-6)
    annotation (Placement(transformation(extent={{130,58},{150,78}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition=
        V_cell.v < 2.5)
    annotation (Placement(transformation(extent={{-134,-94},{-54,-86}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={228,50})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor C1(C=180e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,48})));
  Modelica.Electrical.Analog.Sources.SignalCurrent LoadCurrent annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={250,10})));
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
        origin={210,10})));
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
    annotation (Placement(transformation(extent={{140,82},{120,102}})));
  Modelica.Blocks.Sources.Constant Idischarge_A(k=260) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={290,10})));
  Columb_Counting columb_Counting1
    annotation (Placement(transformation(extent={{160,80},{180,100}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor R3(R=1.5e-3)
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Electrical.Analog.Basic.VariableResistor RA(useHeatPort=false)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rcc(R=1.5e-3)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor CdlA(C=180e3) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={40,34})));
equation
  connect(R1.p, R0.n) annotation (Line(points={{90,68},{80,68},{80,48},{70,48}},
        color={0,0,255}));
  connect(C1.n, C2.p)
    annotation (Line(points={{110,48},{130,48}},
                                               color={0,0,255}));
  connect(R1.n, C2.p) annotation (Line(points={{110,68},{118,68},{118,48},{130,
          48}},
        color={0,0,255}));
  connect(R2.p, C2.p) annotation (Line(points={{130,68},{124,68},{124,48},{130,
          48}},
        color={0,0,255}));
  connect(LoadCurrent.n, ground.p)
    annotation (Line(points={{250,0},{250,-20},{50,-20}}, color={0,0,255}));
  connect(OCV.n, ground.p)
    annotation (Line(points={{-30,0},{-30,-20},{50,-20}}, color={0,0,255}));
  connect(V_OCV.p, OCV.p)
    annotation (Line(points={{10,20},{-30,20}}, color={0,0,255}));
  connect(OCV.n, V_OCV.n)
    annotation (Line(points={{-30,0},{10,0}}, color={0,0,255}));
  connect(V_cell.p, LoadCurrent.p)
    annotation (Line(points={{210,20},{250,20}}, color={0,0,255}));
  connect(DoD_OCV.y[1], OCV.v)
    annotation (Line(points={{-59,10},{-37,10}}, color={0,0,127}));
  connect(Idischarge_A.y, LoadCurrent.i)
    annotation (Line(points={{279,10},{257,10}}, color={0,0,127}));
  connect(Ah.y, columb_Counting.Qtyp_Ah) annotation (Line(points={{119,92},{92,
          92},{92,110},{80,110}}, color={0,0,127}));
  connect(currentSensor.i, columb_Counting.Iload_A)
    annotation (Line(points={{228,60},{228,116},{80.2,116}}, color={0,0,127}));
  connect(currentSensor.n, LoadCurrent.p)
    annotation (Line(points={{238,50},{250,50},{250,20}}, color={0,0,255}));
  connect(columb_Counting.DoD, DoD_OCV.u) annotation (Line(points={{60,116},{
          -90,116},{-90,10},{-82,10}}, color={0,0,127}));
  connect(V_cell.n, LoadCurrent.n)
    annotation (Line(points={{210,0},{250,0}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{320,
            140}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-100},{
            320,140}})),
    experiment(StopTime=360),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end ECM_Chem;
