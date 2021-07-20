% Simscape(TM) Multibody(TM) version: 7.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 0 0];  % m
smiData.RigidTransform(1).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [1 0 0];
smiData.RigidTransform(1).ID = 'B[eslabon_1:1:-:base:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [4.9866704733735066e-19 -2.0761186409091369e-34 0.0069999999999999889];  % m
smiData.RigidTransform(2).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [1 0 0];
smiData.RigidTransform(2).ID = 'F[eslabon_1:1:-:base:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 -1.7763568394002505e-17 0];  % m
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = 'B[eslasbon_2:1:-:eslabon_1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [0.24000000000000005 0 0.0031749999999999834];  % m
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 0 0];
smiData.RigidTransform(4).ID = 'F[eslasbon_2:1:-:eslabon_1:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0.0069999999999999993];  % m
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [1 0 0];
smiData.RigidTransform(5).ID = 'B[base:1:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [4.4408920985006263e-18 0 0.0057032080132785358];  % m
smiData.RigidTransform(6).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(6).axis = [1 0 0];
smiData.RigidTransform(6).ID = 'F[base:1:-:]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [4.4408920985006263e-18 0 -0.0012967919867214639];  % m
smiData.RigidTransform(7).angle = 4.1633363423443395e-16;  % rad
smiData.RigidTransform(7).axis = [0 0 1];
smiData.RigidTransform(7).ID = 'RootGround[base:1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(3).mass = 0.0;
smiData.Solid(3).CoM = [0.0 0.0 0.0];
smiData.Solid(3).MoI = [0.0 0.0 0.0];
smiData.Solid(3).PoI = [0.0 0.0 0.0];
smiData.Solid(3).color = [0.0 0.0 0.0];
smiData.Solid(3).opacity = 0.0;
smiData.Solid(3).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 0.0026594126742274446;  % lbm
smiData.Solid(1).CoM = [6.1015409452108455e-14 -0.0081053542045068459 0.0035000000000000005];  % m
smiData.Solid(1).MoI = [6.9142216769127847e-08 4.531110156668012e-08 9.273478149628378e-08];  % lbm*m^2
smiData.Solid(1).PoI = [0 0 -1.3152654943535083e-18];  % lbm*m^2
smiData.Solid(1).color = [0.74901960784313726 0.74901960784313726 0.74901960784313726];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'base.ipt_{94E39296-4A4C-1257-227A-33B0EDD10A4A}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.013424150129858169;  % kg
smiData.Solid(2).CoM = [0.11576646832048985 0 0.0014810494716795807];  % m
smiData.Solid(2).MoI = [6.3876978902782905e-08 6.7755836026894473e-05 6.7781101132363884e-05];  % kg*m^2
smiData.Solid(2).PoI = [0 -1.6543119472663366e-07 0];  % kg*m^2
smiData.Solid(2).color = [0.99607843137254903 0.99607843137254903 1];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'eslabon_1.ipt_{AD2576BF-476E-96C8-9A80-29B3107F29A2}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.0078855994513064402;  % kg
smiData.Solid(3).CoM = [0.17850768257707794 0 0.0015570381653357765];  % m
smiData.Solid(3).MoI = [3.3787385142519378e-08 8.9384914959831217e-05 8.9403943018543351e-05];  % kg*m^2
smiData.Solid(3).PoI = [0 -4.2879299499088577e-08 0];  % kg*m^2
smiData.Solid(3).color = [0.92156862745098034 0.92156862745098034 0.92156862745098034];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'eslasbon_2.ipt_{41E195E8-43BB-CEE8-2A62-AC8D61AE3B04}';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the CylindricalJoint structure array by filling in null values.
smiData.CylindricalJoint(1).Rz.Pos = 0.0;
smiData.CylindricalJoint(1).Pz.Pos = 0.0;
smiData.CylindricalJoint(1).ID = '';

smiData.CylindricalJoint(1).Rz.Pos = 2.385416011097639e-14;  % deg
smiData.CylindricalJoint(1).Pz.Pos = 0;  % m
smiData.CylindricalJoint(1).ID = '[base:1:-:]';


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Pos = 0.0;
smiData.RevoluteJoint(2).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = -51.107460221380364;  % deg
smiData.RevoluteJoint(1).ID = '[eslabon_1:1:-:base:1]';

smiData.RevoluteJoint(2).Rz.Pos = 140.73076669110893;  % deg
smiData.RevoluteJoint(2).ID = '[eslasbon_2:1:-:eslabon_1:1]';

