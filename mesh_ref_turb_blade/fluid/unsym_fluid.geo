// report
SetFactory("OpenCASCADE");

L=200;
//+
Point(1) = {0, 0, 0};
//+
Point(2) = {100, 0, 0};
//+
Point(3) = {95.023, 0.881, 0};
//+
Point(4) = {90.049, 1.739, 0};
//+
Point(5) = {85.07, 2.618, 0};
//+
Point(6) = {80.084, 3.492, 0};
//+
Point(7) = {75.089, 4.344, 0};
//+
Point(8) = {70.087, 5.153, 0};
//+
Point(9) = {65.076, 5.899, 0};
//+
Point(10) = {60.057, 6.562, 0};
//+
Point(11) = {55.031, 7.125, 0};
//+
Point(12) = {50, 7.567, 0};
//+
Point(13) = {44.964, 7.894, 0};
//+
Point(14) = {39.924, 8.062, 0};
//+
Point(15) = {34.882, 8.059, 0};
//+
Point(16) = {29.84, 7.872, 0};
//+
Point(17) = {24.8, 7.499, 0};
//+
Point(18) = {19.765, 6.929, 0};
//+
Point(19) = {14.735, 6.138, 0};
//+
Point(20) = {9.718, 5.063, 0};
//+
Point(21) = {7.218, 4.379, 0};
//+
Point(22) = {4.727, 3.544, 0};
//+
Point(23) = {2.257, 2.46, 0};
//+
Point(24) = {1.041, 1.719, 0};
//+
Point(25) = {0.567, 1.32, 0};
//+
Point(26) = {0.336, 1.071, 0};
//+
Point(27) = {94.977, 0.33, 0};
//+
Point(28) = {89.951, 0.329, 0};
//+
Point(29) = {84.93, 0.074, 0};
//+
Point(30) = {79.916, -0.308, 0};
//+
Point(31) = {74.911, -0.764, 0};
//+
Point(32) = {69.913, -1.265, 0};
//+
Point(33) = {64.924, -1.799, 0};
//+
Point(34) = {59.943, -2.278, 0};
//+
Point(35) = {54.969, -2.745, 0};
//+
Point(36) = {50, -3.164, 0};
//+
Point(37) = {45.035, -3.514, 0};
//+
Point(38) = {40.076, -3.778, 0};
//+
Point(39) = {35.1118, -3.939, 0};
//+
Point(40) = {30.16, -3.984, 0};
//+
Point(41) = {25.2, -3.919, 0};
//+
Point(42) = {20.235, -3.745, 0};
//+
Point(43) = {15.265, -3.446, 0};
//+
Point(44) = {10.282, -2.995, 0};
//+
Point(45) = {7.782, -2.685, 0};
//+
Point(46) = {5.273, -2.28, 0};
//+
Point(47) = {2.743, -1.716, 0};
//+
Point(48) = {1.459, -1.291, 0};
//+
Point(49) = {0.933, -1.04, 0};
//+
Point(50) = {0.664, -0.871, 0};
//+
Point(51) = {-100, -150, 0};
//+
Point(52) = {-100, 150, 0};
//+
Point(53) = {200, 150, 0};
//+
Point(54) = {200, -150, 0};


//+
Spline(1) = {1, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2};
//+
Spline(2) = {2, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 1};
//+
Line Loop(1) = {1, 2};
//+
Plane Surface(1) = {1};
//+
Extrude {0, 0, L} {
  Surface{1}; 
}
//+
Surface Loop(2) = {1, 2, 3, 4};
//+
Line(7) = {51, 52};
//+
Line(8) = {52, 53};
//+
Line(9) = {53, 54};
//+
Line(10) = {54, 51};
//+
Line Loop(7) = {7, 8, 9, 10};
//+
Plane Surface(7) = {7};
//+
Extrude {0, 0, 300} {
  Surface{7}; 
}

Surface Loop(4) = {9, 8, 11, 10, 12, 7};

BooleanDifference(3) = { Volume{2}; Delete; }{ Volume{1}; Delete; };


//+
Physical Surface("inlet") = {8};
//+
Physical Surface("outlet") = {10};
//+
Physical Surface("upper_wall") = {12};
//+
Physical Surface("lower_wall") = {7};
//+
Physical Surface("side_wall") = {11, 9};
//+
Physical Surface("wetSurface0") = {5, 25, 6, 21};
//+
Physical Volume("fluid") = {3};


Mesh.ElementOrder=1;
Mesh.Optimize=1;
//Mesh.RemeshParametrization = 7;

// Display control
//Mesh.SurfaceEdges = 1;
Mesh.SurfaceFaces = 1;
Mesh.VolumeEdges = 0;
//Mesh.VolumeFaces = 0;

//Mesh 3;

//Mesh.SaveGroupsOfNodes = 1;
// Mesh.CharacteristicLengthMax = 5;
//Save "inner.msh";
//Save "fluid.su2";
