within CU_IRP_perrinn_battery.Test_Bench;
model Single_Cell_Test
  Modelica.Electrical.Analog.Sensors.VoltageSensor Vt annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={86,10})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-40,-62},{-20,-42}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent I_Load annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={50,10})));
  Modelica.Thermal.FluidHeatFlow.Examples.Utilities.DoubleRamp doubleRamp(
    offset=0,
    duration_1=0,
    duration_2=0,
    startTime=0,
    height_1=16.8,
    height_2=-33.6,
    interval=3600)
    annotation (Placement(transformation(extent={{20,0},{30,10}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(
      terminationText="Terminatd since V_t is lower than 2.5", condition=Vt.v
         < 2.5)
    annotation (Placement(transformation(extent={{-78,-92},{2,-84}})));
  Thermal_ECM.Thermal_ECM thermal_ECM annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,10})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-58,10})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=25
         + 275.15)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  Modelica.Blocks.Sources.Constant const(k=20)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(Vt.n, I_Load.n) annotation (Line(points={{86,3.55271e-15},{68,
          3.55271e-15},{68,0},{50,0}}, color={0,0,255}));
  connect(doubleRamp.y, I_Load.i) annotation (Line(points={{30.5,5},{36.25,5},{
          36.25,10},{43,10}}, color={0,0,127}));
  connect(Vt.p, I_Load.p)
    annotation (Line(points={{86,20},{50,20}}, color={0,0,255}));
  connect(thermal_ECM.n, ground.p)
    annotation (Line(points={{-30,0},{-30,-42},{-30,-42}}, color={0,0,255}));
  connect(I_Load.n, ground.p) annotation (Line(points={{50,0},{50,-20},{-30,-20},
          {-30,-42}}, color={0,0,255}));
  connect(thermal_ECM.p, I_Load.p) annotation (Line(points={{-30,20},{-30,40},{
          50,40},{50,20}}, color={0,0,255}));
  connect(convection.solid, thermal_ECM.port_a)
    annotation (Line(points={{-48,10},{-40,10}}, color={191,0,0}));
  connect(fixedTemperature.port, convection.fluid)
    annotation (Line(points={{-80,10},{-68,10}}, color={191,0,0}));
  connect(const.y, convection.Gc)
    annotation (Line(points={{-79,50},{-58,50},{-58,20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Single_Cell_Test;
