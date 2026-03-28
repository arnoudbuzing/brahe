BeginPackage["Brahe`"];

BraheOrbitalPeriod::usage = "BraheOrbitalPeriod[a] computes the orbital period for a semi-major axis 'a' [m].";
BraheOrbitalPeriodGeneral::usage = "BraheOrbitalPeriodGeneral[a, gm] computes the orbital period for a semi-major axis 'a' [m] and gravitational parameter 'gm' [m^3/s^2].";
BrahePeriapsisDistance::usage = "BrahePeriapsisDistance[a, e] computes the periapsis distance for a semi-major axis 'a' [m] and eccentricity 'e'.";
BraheApoapsisDistance::usage = "BraheApoapsisDistance[a, e] computes the apoapsis distance for a semi-major axis 'a' [m] and eccentricity 'e'.";
BraheMeanMotion::usage = "BraheMeanMotion[a] computes the mean motion for a semi-major axis 'a' [m].";
BraheMeanMotionGeneral::usage = "BraheMeanMotionGeneral[a, gm] computes the mean motion for a semi-major axis 'a' [m] and gravitational parameter 'gm' [m^3/s^2].";
BrahePeriapsisVelocity::usage = "BrahePeriapsisVelocity[a, e, gm] computes the periapsis velocity for a semi-major axis 'a' [m], eccentricity 'e', and gravitational parameter 'gm' [m^3/s^2].";
BraheApoapsisVelocity::usage = "BraheApoapsisVelocity[a, e, gm] computes the apoapsis velocity for a semi-major axis 'a' [m], eccentricity 'e', and gravitational parameter 'gm' [m^3/s^2].";
BrahePerigeeVelocity::usage = "BrahePerigeeVelocity[a, e] computes the perigee velocity for a semi-major axis 'a' [m] and eccentricity 'e'.";
BraheApogeeVelocity::usage = "BraheApogeeVelocity[a, e] computes the apogee velocity for a semi-major axis 'a' [m] and eccentricity 'e'.";
BrahePeriapsisAltitude::usage = "BrahePeriapsisAltitude[a, e, rBody] computes the periapsis altitude for a semi-major axis 'a' [m], eccentricity 'e', and body radius 'rBody' [m].";
BraheApoapsisAltitude::usage = "BraheApoapsisAltitude[a, e, rBody] computes the apoapsis altitude for a semi-major axis 'a' [m], eccentricity 'e', and body radius 'rBody' [m].";
BrahePerigeeAltitude::usage = "BrahePerigeeAltitude[a, e] computes the perigee altitude for a semi-major axis 'a' [m] and eccentricity 'e'.";
BraheApogeeAltitude::usage = "BraheApogeeAltitude[a, e] computes the apogee altitude for a semi-major axis 'a' [m] and eccentricity 'e'.";

Begin["`Private`"];

(* --- Library Loading logic --- *)

$brahePacletDir = DirectoryName[$InputFileName, 2];

braheLibraryPath[] := Module[{ext, libName = "libbrahe_rs"},
  ext = Switch[$OperatingSystem, "MacOSX", ".dylib", "Unix", ".so", "Windows", ".dll"];
  FileNameJoin[{$brahePacletDir, "LibraryResources", $SystemID, libName <> ext}]
];

loadBraheLibrary[] := Module[{libPath},
  libPath = braheLibraryPath[];
  If[FileExistsQ[libPath],
    libPath,
    $Failed
  ]
];

(* --- Function definition using LibraryLink --- *)

$braheLib = loadBraheLibrary[];

If[$braheLib =!= $Failed,
  $iBraheOrbitalPeriod = LibraryFunctionLoad[$braheLib, "BraheOrbitalPeriod", {Real}, Real];
  $iBraheOrbitalPeriodGeneral = LibraryFunctionLoad[$braheLib, "BraheOrbitalPeriodGeneral", {Real, Real}, Real];
  $iBrahePeriapsisDistance = LibraryFunctionLoad[$braheLib, "BrahePeriapsisDistance", {Real, Real}, Real];
  $iBraheApoapsisDistance = LibraryFunctionLoad[$braheLib, "BraheApoapsisDistance", {Real, Real}, Real];
  $iBraheMeanMotion = LibraryFunctionLoad[$braheLib, "BraheMeanMotion", {Real}, Real];
  $iBraheMeanMotionGeneral = LibraryFunctionLoad[$braheLib, "BraheMeanMotionGeneral", {Real, Real}, Real];
  $iBrahePeriapsisVelocity = LibraryFunctionLoad[$braheLib, "BrahePeriapsisVelocity", {Real, Real, Real}, Real];
  $iBraheApoapsisVelocity = LibraryFunctionLoad[$braheLib, "BraheApoapsisVelocity", {Real, Real, Real}, Real];
  $iBrahePerigeeVelocity = LibraryFunctionLoad[$braheLib, "BrahePerigeeVelocity", {Real, Real}, Real];
  $iBraheApogeeVelocity = LibraryFunctionLoad[$braheLib, "BraheApogeeVelocity", {Real, Real}, Real];
  $iBrahePeriapsisAltitude = LibraryFunctionLoad[$braheLib, "BrahePeriapsisAltitude", {Real, Real, Real}, Real];
  $iBraheApoapsisAltitude = LibraryFunctionLoad[$braheLib, "BraheApoapsisAltitude", {Real, Real, Real}, Real];
  $iBrahePerigeeAltitude = LibraryFunctionLoad[$braheLib, "BrahePerigeeAltitude", {Real, Real}, Real];
  $iBraheApogeeAltitude = LibraryFunctionLoad[$braheLib, "BraheApogeeAltitude", {Real, Real}, Real];

  BraheOrbitalPeriod[a_?NumericQ] := Quantity[$iBraheOrbitalPeriod[a], "Seconds"];
  BraheOrbitalPeriod[a_Quantity] := Quantity[$iBraheOrbitalPeriod[QuantityMagnitude[UnitConvert[a, "Meters"]]], "Seconds"];

  BraheOrbitalPeriodGeneral[a_?NumericQ, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodGeneral[a, gm], "Seconds"];
  BraheOrbitalPeriodGeneral[a_Quantity, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], gm], "Seconds"];
  BraheOrbitalPeriodGeneral[a_?NumericQ, gm_Quantity] := Quantity[$iBraheOrbitalPeriodGeneral[a, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];
  BraheOrbitalPeriodGeneral[a_Quantity, gm_Quantity] := Quantity[$iBraheOrbitalPeriodGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];

  BrahePeriapsisDistance[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePeriapsisDistance[a, e], "Meters"];
  BrahePeriapsisDistance[a_Quantity, e_?NumericQ] := Quantity[$iBrahePeriapsisDistance[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  BraheApoapsisDistance[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApoapsisDistance[a, e], "Meters"];
  BraheApoapsisDistance[a_Quantity, e_?NumericQ] := Quantity[$iBraheApoapsisDistance[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  BraheMeanMotion[a_?NumericQ] := Quantity[$iBraheMeanMotion[a], "Radians"/"Seconds"];
  BraheMeanMotion[a_Quantity] := Quantity[$iBraheMeanMotion[QuantityMagnitude[UnitConvert[a, "Meters"]]], "Radians"/"Seconds"];

  BraheMeanMotionGeneral[a_?NumericQ, gm_?NumericQ] := Quantity[$iBraheMeanMotionGeneral[a, gm], "Radians"/"Seconds"];
  BraheMeanMotionGeneral[a_Quantity, gm_?NumericQ] := Quantity[$iBraheMeanMotionGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], gm], "Radians"/"Seconds"];
  BraheMeanMotionGeneral[a_?NumericQ, gm_Quantity] := Quantity[$iBraheMeanMotionGeneral[a, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Radians"/"Seconds"];
  BraheMeanMotionGeneral[a_Quantity, gm_Quantity] := Quantity[$iBraheMeanMotionGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Radians"/"Seconds"];

  BrahePeriapsisVelocity[a_?NumericQ, e_?NumericQ, gm_?NumericQ] := Quantity[$iBrahePeriapsisVelocity[a, e, gm], "Meters"/"Seconds"];
  BrahePeriapsisVelocity[a_Quantity, e_?NumericQ, gm_?NumericQ] := Quantity[$iBrahePeriapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, gm], "Meters"/"Seconds"];
  BrahePeriapsisVelocity[a_?NumericQ, e_?NumericQ, gm_Quantity] := Quantity[$iBrahePeriapsisVelocity[a, e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];
  BrahePeriapsisVelocity[a_Quantity, e_?NumericQ, gm_Quantity] := Quantity[$iBrahePeriapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];

  BraheApoapsisVelocity[a_?NumericQ, e_?NumericQ, gm_?NumericQ] := Quantity[$iBraheApoapsisVelocity[a, e, gm], "Meters"/"Seconds"];
  BraheApoapsisVelocity[a_Quantity, e_?NumericQ, gm_?NumericQ] := Quantity[$iBraheApoapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, gm], "Meters"/"Seconds"];
  BraheApoapsisVelocity[a_?NumericQ, e_?NumericQ, gm_Quantity] := Quantity[$iBraheApoapsisVelocity[a, e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];
  BraheApoapsisVelocity[a_Quantity, e_?NumericQ, gm_Quantity] := Quantity[$iBraheApoapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];

  BrahePerigeeVelocity[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePerigeeVelocity[a, e], "Meters"/"Seconds"];
  BrahePerigeeVelocity[a_Quantity, e_?NumericQ] := Quantity[$iBrahePerigeeVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"/"Seconds"];

  BraheApogeeVelocity[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApogeeVelocity[a, e], "Meters"/"Seconds"];
  BraheApogeeVelocity[a_Quantity, e_?NumericQ] := Quantity[$iBraheApogeeVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"/"Seconds"];

  BrahePeriapsisAltitude[a_?NumericQ, e_?NumericQ, rb_?NumericQ] := Quantity[$iBrahePeriapsisAltitude[a, e, rb], "Meters"];
  BrahePeriapsisAltitude[a_Quantity, e_?NumericQ, rb_?NumericQ] := Quantity[$iBrahePeriapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, rb], "Meters"];
  BrahePeriapsisAltitude[a_?NumericQ, e_?NumericQ, rb_Quantity] := Quantity[$iBrahePeriapsisAltitude[a, e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];
  BrahePeriapsisAltitude[a_Quantity, e_?NumericQ, rb_Quantity] := Quantity[$iBrahePeriapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];

  BraheApoapsisAltitude[a_?NumericQ, e_?NumericQ, rb_?NumericQ] := Quantity[$iBraheApoapsisAltitude[a, e, rb], "Meters"];
  BraheApoapsisAltitude[a_Quantity, e_?NumericQ, rb_?NumericQ] := Quantity[$iBraheApoapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, rb], "Meters"];
  BraheApoapsisAltitude[a_?NumericQ, e_?NumericQ, rb_Quantity] := Quantity[$iBraheApoapsisAltitude[a, e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];
  BraheApoapsisAltitude[a_Quantity, e_?NumericQ, rb_Quantity] := Quantity[$iBraheApoapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];

  BrahePerigeeAltitude[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePerigeeAltitude[a, e], "Meters"];
  BrahePerigeeAltitude[a_Quantity, e_?NumericQ] := Quantity[$iBrahePerigeeAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  BraheApogeeAltitude[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApogeeAltitude[a, e], "Meters"];
  BraheApogeeAltitude[a_Quantity, e_?NumericQ] := Quantity[$iBraheApogeeAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];
,
  Print["Warning: Brahe library not found at: ", braheLibraryPath[]];
];

End[];
EndPackage[];
