function mInfo = dymModelInfo

mInfo.ModelName = 'ECM_2RC';
mInfo.extIncDirs = '';
mInfo.extLibDirs = '-L"C:/Program Files/Dymola 2019/Modelica/Library/Modelica 3.2.2/Resources/Library/win64"';
mInfo.libLine = ' ModelicaMatIO ModelicaStandardTables zlib';

if (isunix && verLessThan('matlab', '8.4.0'))
  % Modifications needed for mex on older Linux versions
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, '" -L', '"-L');
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, ' ', '\\ ');
  mInfo.extLibDirs = strrep(mInfo.extLibDirs, '"-L', '" -L');
end
