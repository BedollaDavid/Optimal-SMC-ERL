% Simscape(TM) Multibody(TM) version: 6.0

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(5).translation = [0.0 0.0 0.0];
smiData.RigidTransform(5).angle = 0.0;
smiData.RigidTransform(5).axis = [0.0 0.0 0.0];
smiData.RigidTransform(5).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [338.20100000000002 1.2212453270876722e-12 50];  % mm
smiData.RigidTransform(1).angle = 0;%3.1415926535897931;  % rad
smiData.RigidTransform(1).axis = [0 0 0];%[1 0 0];
smiData.RigidTransform(1).ID = 'B[Hombro-3:-:Brazo-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [2.2736379378909112e-13 -1.0866900604479712e-14 6.3948846218409774e-14];  % mm
smiData.RigidTransform(2).angle = 0;%3.1415926535897931;  % rad
smiData.RigidTransform(2).axis = [0 0 0];%[-1 -6.4146353042212696e-50 2.7755575615628914e-17];
smiData.RigidTransform(2).ID = 'F[Hombro-3:-:Brazo-4]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 -10.16 0];  % mm
smiData.RigidTransform(3).angle = pi/2;%2.0943951023931935;  % rad
smiData.RigidTransform(3).axis = [1 0 0];%[-0.57735026918962506 -0.57735026918962506 -0.57735026918962717];
smiData.RigidTransform(3).ID = 'B[Eje-3:-:Hombro-3]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [6.6613381477509392e-14 -3.2507330161024584e-13 10.16];  % mm
smiData.RigidTransform(4).angle = 0;%3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [0 0 0];%[-1 -1.3876238576750228e-32 1.6649521029997527e-16];
smiData.RigidTransform(4).ID = 'F[Eje-3:-:Hombro-3]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0];  % mm
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];%
smiData.RigidTransform(5).ID = 'RootGround[Eje-3]';


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
smiData.Solid(1).mass = 0.0087003700990956698;  % kg
smiData.Solid(1).CoM = [0 -0.20000000000000001 0];  % in
smiData.Solid(1).MoI = [0.0010349815263715892 0.0018379531834339605 0.001034981526371589];  % kg*in^2
smiData.Solid(1).PoI = [0 0 0];  % kg*in^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'Eje*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = gain*2;  % kg
smiData.Solid(2).CoM = [0.0229 0 0];  % m
smiData.Solid(2).MoI = gain*[0 0 0.0229];  % kg*m^2 
smiData.Solid(2).PoI = [0 0 0];  % kg*m^2
smiData.Solid(2).color = [0.1 0.1 0.7];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'Brazo*:*Predeterminado';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = gain*3;  % kg
smiData.Solid(3).CoM = [0.0983 0 0];  % m
smiData.Solid(3).MoI = gain*[0 0 0.0229];  % kg*m^2
smiData.Solid(3).PoI = [0 0 0];  % kg*m^2
smiData.Solid(3).color = [0.1 0.7 0.1];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'Hombro*:*Predeterminado';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Pos = 0.0;
smiData.RevoluteJoint(2).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(1).ID = '[Hombro-3:-:Brazo-4]';

smiData.RevoluteJoint(2).Rz.Pos = 0;  % deg
smiData.RevoluteJoint(2).ID = '[Eje-3:-:Hombro-3]';


%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(2).Rz.Vel = 0.0;
smiData.RevoluteJoint(2).ID = '';

smiData.RevoluteJoint(1).Rz.Vel = 0;  % deg/s
smiData.RevoluteJoint(1).ID = '[Hombro-3:-:Brazo-4]';

smiData.RevoluteJoint(2).Rz.Vel = 0;  % deg/s
smiData.RevoluteJoint(2).ID = '[Eje-3:-:Hombro-3]';

