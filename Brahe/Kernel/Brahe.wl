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
BraheAnomalyMeanToEccentric::usage = "BraheAnomalyMeanToEccentric[m, e] converts mean anomaly 'm' [rad] to eccentric anomaly for an orbit with eccentricity 'e'.";
BraheAnomalyEccentricToMean::usage = "BraheAnomalyEccentricToMean[enm, e] converts eccentric anomaly 'enm' [rad] to mean anomaly for an orbit with eccentricity 'e'.";
BraheAnomalyTrueToEccentric::usage = "BraheAnomalyTrueToEccentric[nu, e] converts true anomaly 'nu' [rad] to eccentric anomaly for an orbit with eccentricity 'e'.";
BraheAnomalyEccentricToTrue::usage = "BraheAnomalyEccentricToTrue[enm, e] converts eccentric anomaly 'enm' [rad] to true anomaly for an orbit with eccentricity 'e'.";
BraheAnomalyTrueToMean::usage = "BraheAnomalyTrueToMean[nu, e] converts true anomaly 'nu' [rad] to mean anomaly for an orbit with eccentricity 'e'.";
BraheAnomalyMeanToTrue::usage = "BraheAnomalyMeanToTrue[m, e] converts mean anomaly 'm' [rad] to true anomaly for an orbit with eccentricity 'e'.";
BraheSemimajorAxisFromPeriod::usage = "BraheSemimajorAxisFromPeriod[period] computes the semi-major axis for a given orbital period 'period' [s] around Earth.";
BraheSemimajorAxisFromPeriodGeneral::usage = "BraheSemimajorAxisFromPeriodGeneral[period, gm] computes the semi-major axis for a given orbital period 'period' [s] and gravitational parameter 'gm' [m^3/s^2].";
BraheSemimajorAxisFromMeanMotion::usage = "BraheSemimajorAxisFromMeanMotion[n] computes the semi-major axis for a given mean motion 'n' [rad/s] around Earth.";
BraheSemimajorAxisFromMeanMotionGeneral::usage = "BraheSemimajorAxisFromMeanMotionGeneral[n, gm] computes the semi-major axis for a given mean motion 'n' [rad/s] and gravitational parameter 'gm' [m^3/s^2].";
BraheGeoSemimajorAxis::usage = "BraheGeoSemimajorAxis[] computes the semi-major axis of a geostationary orbit around Earth.";
BraheSunSynchronousInclination::usage = "BraheSunSynchronousInclination[a, e] computes the inclination [rad] required for a sun-synchronous orbit with semi-major axis 'a' [m] and eccentricity 'e'.";
BraheOrbitalPeriodFromState::usage = "BraheOrbitalPeriodFromState[state, gm] returns the orbital period for a given 6-element Cartesian state vector and gravitational parameter.";
BraheCelesTrakQuery::usage = "BraheCelesTrakQuery[group] downloads General Perturbations (GP) records from CelesTrak for a given group (e.g., \"stations\", \"active\", \"gnss\").";

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
  $iBraheAnomalyMeanToEccentric = LibraryFunctionLoad[$braheLib, "BraheAnomalyMeanToEccentric", {Real, Real}, Real];
  $iBraheAnomalyEccentricToMean = LibraryFunctionLoad[$braheLib, "BraheAnomalyEccentricToMean", {Real, Real}, Real];
  $iBraheAnomalyTrueToEccentric = LibraryFunctionLoad[$braheLib, "BraheAnomalyTrueToEccentric", {Real, Real}, Real];
  $iBraheAnomalyEccentricToTrue = LibraryFunctionLoad[$braheLib, "BraheAnomalyEccentricToTrue", {Real, Real}, Real];
  $iBraheAnomalyTrueToMean = LibraryFunctionLoad[$braheLib, "BraheAnomalyTrueToMean", {Real, Real}, Real];
  $iBraheAnomalyMeanToTrue = LibraryFunctionLoad[$braheLib, "BraheAnomalyMeanToTrue", {Real, Real}, Real];
  $iBraheSemimajorAxisFromPeriod = LibraryFunctionLoad[$braheLib, "BraheSemimajorAxisFromPeriod", {Real}, Real];
  $iBraheSemimajorAxisFromPeriodGeneral = LibraryFunctionLoad[$braheLib, "BraheSemimajorAxisFromPeriodGeneral", {Real, Real}, Real];
  $iBraheSemimajorAxisFromMeanMotion = LibraryFunctionLoad[$braheLib, "BraheSemimajorAxisFromMeanMotion", {Real}, Real];
  $iBraheSemimajorAxisFromMeanMotionGeneral = LibraryFunctionLoad[$braheLib, "BraheSemimajorAxisFromMeanMotionGeneral", {Real, Real}, Real];
  $iBraheGeoSemimajorAxis = LibraryFunctionLoad[$braheLib, "BraheGeoSemimajorAxis", {}, Real];
  $iBraheSunSynchronousInclination = LibraryFunctionLoad[$braheLib, "BraheSunSynchronousInclination", {Real, Real}, Real];
  $iBraheOrbitalPeriodFromState = LibraryFunctionLoad[$braheLib, "BraheOrbitalPeriodFromStateV2", {NumericArray, Real}, Real];

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

  BraheAnomalyMeanToEccentric[m_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToEccentric[m, e], "Radians"];
  BraheAnomalyMeanToEccentric[m_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToEccentric[QuantityMagnitude[UnitConvert[m, "Radians"]], e], "Radians"];

  BraheAnomalyEccentricToMean[enm_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToMean[enm, e], "Radians"];
  BraheAnomalyEccentricToMean[enm_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToMean[QuantityMagnitude[UnitConvert[enm, "Radians"]], e], "Radians"];

  BraheAnomalyTrueToEccentric[nu_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToEccentric[nu, e], "Radians"];
  BraheAnomalyTrueToEccentric[nu_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToEccentric[QuantityMagnitude[UnitConvert[nu, "Radians"]], e], "Radians"];

  BraheAnomalyEccentricToTrue[enm_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToTrue[enm, e], "Radians"];
  BraheAnomalyEccentricToTrue[enm_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToTrue[QuantityMagnitude[UnitConvert[enm, "Radians"]], e], "Radians"];

  BraheAnomalyTrueToMean[nu_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToMean[nu, e], "Radians"];
  BraheAnomalyTrueToMean[nu_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToMean[QuantityMagnitude[UnitConvert[nu, "Radians"]], e], "Radians"];

  BraheAnomalyMeanToTrue[m_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToTrue[m, e], "Radians"];
  BraheAnomalyMeanToTrue[m_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToTrue[QuantityMagnitude[UnitConvert[m, "Radians"]], e], "Radians"];

  BraheSemimajorAxisFromPeriod[period_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriod[period], "Meters"];
  BraheSemimajorAxisFromPeriod[period_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriod[QuantityMagnitude[UnitConvert[period, "Seconds"]]], "Meters"];

  BraheSemimajorAxisFromPeriodGeneral[period_?NumericQ, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[period, gm], "Meters"];
  BraheSemimajorAxisFromPeriodGeneral[period_Quantity, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[QuantityMagnitude[UnitConvert[period, "Seconds"]], gm], "Meters"];
  BraheSemimajorAxisFromPeriodGeneral[period_?NumericQ, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[period, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];
  BraheSemimajorAxisFromPeriodGeneral[period_Quantity, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[QuantityMagnitude[UnitConvert[period, "Seconds"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];

  BraheSemimajorAxisFromMeanMotion[n_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotion[n], "Meters"];
  BraheSemimajorAxisFromMeanMotion[n_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotion[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]]], "Meters"];

  BraheSemimajorAxisFromMeanMotionGeneral[n_?NumericQ, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[n, gm], "Meters"];
  BraheSemimajorAxisFromMeanMotionGeneral[n_Quantity, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]], gm], "Meters"];
  BraheSemimajorAxisFromMeanMotionGeneral[n_?NumericQ, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[n, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];
  BraheSemimajorAxisFromMeanMotionGeneral[n_Quantity, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];

  BraheGeoSemimajorAxis[] := Quantity[$iBraheGeoSemimajorAxis[], "Meters"];

  BraheSunSynchronousInclination[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheSunSynchronousInclination[a, e], "Radians"];
  BraheSunSynchronousInclination[a_Quantity, e_?NumericQ] := Quantity[$iBraheSunSynchronousInclination[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Radians"];

  BraheOrbitalPeriodFromState[state_?VectorQ, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodFromState[NumericArray[state, "Real64"], gm], "Seconds"];
  BraheOrbitalPeriodFromState[state_?VectorQ, gm_Quantity] := Quantity[$iBraheOrbitalPeriodFromState[NumericArray[state, "Real64"], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];
  BraheOrbitalPeriodFromState[state_ /; (VectorQ[state] && AnyTrue[state, MatchQ[#, _Quantity] &]), gm_] :=
    Module[{magState},
      magState = Join[
        QuantityMagnitude[UnitConvert[Take[state, 3], "Meters"]],
        QuantityMagnitude[UnitConvert[Drop[state, 3], "Meters"/"Seconds"]]
      ];
      BraheOrbitalPeriodFromState[magState, gm]
    ];
,
  Print["Warning: Brahe library not found at: ", braheLibraryPath[]];
];

BraheCelesTrakQuery[group_String] := 
  Module[{url, response},
    url = "https://celestrak.org/NORAD/elements/gp.php?GROUP=" <> ToLowerCase[group] <> "&FORMAT=json";
    response = URLRead[url, "Body"];
    If[StringQ[response],
      ImportString[response, "JSON"],
      $Failed
    ]
  ];

End[];
EndPackage[];
