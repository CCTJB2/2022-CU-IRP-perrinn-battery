within CU_IRP_perrinn_battery.Electrical.Batteries.Electro_therml_3D;
model ECM_Chem_Ex_298K
  Modelica.Electrical.Spice3.Basic.R_Resistor Rcc_A(R=1e-3)
    annotation (Placement(transformation(extent={{0,0},{-20,20}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,-30})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_A2(R=4.3e-3)
    annotation (Placement(transformation(extent={{88,20},{68,40}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_C(C=39027.16) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={138,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_C2(R=6e-3)
    annotation (Placement(transformation(extent={{148,20},{128,40}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition=
        V_cell.v < 2.5)
    annotation (Placement(transformation(extent={{-86,-98},{-6,-90}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={270,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_A(C=74506.39) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={78,10})));
  Modelica.Electrical.Analog.Sources.SignalCurrent LoadCurrent annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={290,-30})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_OCV annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-10,-30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_cell annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={250,-30})));
  Modelica.Blocks.Tables.CombiTable1Ds DoD_OCV(
    tableOnFile=true,
    tableName="table",
    fileName=
        "Z:/OneDrive - The Hong Kong Polytechnic University/Cranfield Studies/4 Course Projects/IRP Battery/A123/A123_OCV_Discharge.mat")
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Columb_Counting columb_Counting annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,110})));
  Modelica.Blocks.Sources.Constant Ah(k=16.8)
    annotation (Placement(transformation(extent={{180,90},{160,110}})));
  Modelica.Blocks.Sources.Constant Idischarge_A(k=168) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={320,-30})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_S(R=6.7e-3)
    annotation (Placement(transformation(extent={{118,20},{98,40}})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cel_S(C=88698.08) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={108,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cdl_A(C=737.36) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,10})));
  Modelica.Electrical.Spice3.Basic.C_Capacitor Cdl_C(C=230.27) annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,10})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_A(R=4.3e-3)
    annotation (Placement(transformation(extent={{30,0},{10,20}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rcc_C(R=2e-3)
    annotation (Placement(transformation(extent={{240,0},{220,20}})));
  Modelica.Electrical.Spice3.Basic.R_Resistor Rel_C(R=6e-3)
    annotation (Placement(transformation(extent={{210,0},{190,20}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V_t annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={10,70})));
equation
  connect(LoadCurrent.n, ground.p)
    annotation (Line(points={{290,-40},{290,-60},{50,-60}},
                                                          color={0,0,255}));
  connect(V_OCV.p, OCV.p)
    annotation (Line(points={{-10,-20},{-40,-20}},
                                                color={0,0,255}));
  connect(OCV.n, V_OCV.n)
    annotation (Line(points={{-40,-40},{-10,-40}},
                                              color={0,0,255}));
  connect(V_cell.p, LoadCurrent.p)
    annotation (Line(points={{250,-20},{290,-20}},
                                                 color={0,0,255}));
  connect(V_cell.n, LoadCurrent.n) annotation (Line(points={{250,-40},{290,-40}},
                                               color={0,0,255}));
  connect(DoD_OCV.y[1], OCV.v)
    annotation (Line(points={{-59,-30},{-47,-30}},
                                                 color={0,0,127}));
  connect(Idischarge_A.y, LoadCurrent.i)
    annotation (Line(points={{309,-30},{297,-30}},
                                                 color={0,0,127}));
  connect(Ah.y, columb_Counting.Qtyp_Ah) annotation (Line(points={{159,100},{
          152,100},{152,110},{80,110}},
                                  color={0,0,127}));
  connect(currentSensor.i, columb_Counting.Iload_A)
    annotation (Line(points={{270,20},{270,116},{80.2,116}}, color={0,0,127}));
  connect(currentSensor.n, LoadCurrent.p)
    annotation (Line(points={{280,10},{290,10},{290,-20}},color={0,0,255}));
  connect(columb_Counting.DoD, DoD_OCV.u) annotation (Line(points={{60,116},{
          -90,116},{-90,-30},{-82,-30}},
                                       color={0,0,127}));
  connect(Rel_C2.p, Cel_C.p) annotation (Line(points={{148,30},{148,20},{148,20},
          {148,10}}, color={0,0,255}));
  connect(Rel_S.n, Cel_S.n) annotation (Line(points={{98,30},{98,20},{98,20},{
          98,10}}, color={0,0,255}));
  connect(Rel_A2.n, Cel_A.n) annotation (Line(points={{68,30},{68,20},{68,20},{
          68,10}}, color={0,0,255}));
  connect(Rel_S.p, Cel_S.p) annotation (Line(points={{118,30},{118,20},{118,20},
          {118,10}}, color={0,0,255}));
  connect(Rel_A2.p, Cel_A.p) annotation (Line(points={{88,30},{88,20},{88,20},{
          88,10}}, color={0,0,255}));
  connect(Rel_C2.n, Cel_C.n) annotation (Line(points={{128,30},{128,20},{128,20},
          {128,10}}, color={0,0,255}));
  connect(OCV.n, ground.p)
    annotation (Line(points={{-40,-40},{-40,-60},{50,-60}}, color={0,0,255}));
  connect(Rcc_A.p, Rel_A.n)
    annotation (Line(points={{0,10},{10,10}}, color={0,0,255}));
  connect(Rel_A.p, Cdl_A.n)
    annotation (Line(points={{30,10},{40,10}}, color={0,0,255}));
  connect(Cdl_A.p, Cel_A.n)
    annotation (Line(points={{60,10},{68,10}}, color={0,0,255}));
  connect(Cel_A.p, Cel_S.n)
    annotation (Line(points={{88,10},{98,10}}, color={0,0,255}));
  connect(Cel_S.p, Cel_C.n)
    annotation (Line(points={{118,10},{128,10}}, color={0,0,255}));
  connect(Cel_C.p, Cdl_C.n)
    annotation (Line(points={{148,10},{160,10}}, color={0,0,255}));
  connect(Cdl_C.p, Rel_C.n)
    annotation (Line(points={{180,10},{190,10}}, color={0,0,255}));
  connect(Rel_C.p, Rcc_C.n)
    annotation (Line(points={{210,10},{220,10}}, color={0,0,255}));
  connect(V_t.p, Rcc_C.p)
    annotation (Line(points={{20,70},{240,70},{240,10}}, color={0,0,255}));
  connect(Rcc_C.p, currentSensor.p)
    annotation (Line(points={{240,10},{260,10}}, color={0,0,255}));
  connect(V_t.n, OCV.n) annotation (Line(points={{0,70},{-50,70},{-50,-40},{-40,
          -40}}, color={0,0,255}));
  connect(Rcc_A.n, OCV.p)
    annotation (Line(points={{-20,10},{-40,10},{-40,-20}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{340,
            160}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            340,160}})),
    experiment(StopTime=360),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=false,
      OutputFlatModelica=false));
end ECM_Chem_Ex_298K;
