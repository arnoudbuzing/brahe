BeginPackage["Brahe`"];

OrbitalPeriod::usage = "OrbitalPeriod[a] computes the orbital period for a semi-major axis 'a' [m].";
OrbitalPeriodGeneral::usage = "OrbitalPeriodGeneral[a, gm] computes the orbital period for a semi-major axis 'a' [m] and gravitational parameter 'gm' [m^3/s^2].";
PeriapsisDistance::usage = "PeriapsisDistance[a, e] computes the periapsis distance for a semi-major axis 'a' [m] and eccentricity 'e'.";
ApoapsisDistance::usage = "ApoapsisDistance[a, e] computes the apoapsis distance for a semi-major axis 'a' [m] and eccentricity 'e'.";
MeanMotion::usage = "MeanMotion[a] computes the mean motion for a semi-major axis 'a' [m].";
MeanMotionGeneral::usage = "MeanMotionGeneral[a, gm] computes the mean motion for a semi-major axis 'a' [m] and gravitational parameter 'gm' [m^3/s^2].";
PeriapsisVelocity::usage = "PeriapsisVelocity[a, e, gm] computes the periapsis velocity for a semi-major axis 'a' [m], eccentricity 'e', and gravitational parameter 'gm' [m^3/s^2].";
ApoapsisVelocity::usage = "ApoapsisVelocity[a, e, gm] computes the apoapsis velocity for a semi-major axis 'a' [m], eccentricity 'e', and gravitational parameter 'gm' [m^3/s^2].";
PerigeeVelocity::usage = "PerigeeVelocity[a, e] computes the perigee velocity for a semi-major axis 'a' [m] and eccentricity 'e'.";
ApogeeVelocity::usage = "ApogeeVelocity[a, e] computes the apogee velocity for a semi-major axis 'a' [m] and eccentricity 'e'.";
PeriapsisAltitude::usage = "PeriapsisAltitude[a, e, rBody] computes the periapsis altitude for a semi-major axis 'a' [m], eccentricity 'e', and body radius 'rBody' [m].";
ApoapsisAltitude::usage = "ApoapsisAltitude[a, e, rBody] computes the apoapsis altitude for a semi-major axis 'a' [m], eccentricity 'e', and body radius 'rBody' [m].";
PerigeeAltitude::usage = "PerigeeAltitude[a, e] computes the perigee altitude for a semi-major axis 'a' [m] and eccentricity 'e'.";
ApogeeAltitude::usage = "ApogeeAltitude[a, e] computes the apogee altitude for a semi-major axis 'a' [m] and eccentricity 'e'.";
AnomalyMeanToEccentric::usage = "AnomalyMeanToEccentric[m, e] converts mean anomaly 'm' [rad] to eccentric anomaly for an orbit with eccentricity 'e'.";
AnomalyEccentricToMean::usage = "AnomalyEccentricToMean[enm, e] converts eccentric anomaly 'enm' [rad] to mean anomaly for an orbit with eccentricity 'e'.";
AnomalyTrueToEccentric::usage = "AnomalyTrueToEccentric[nu, e] converts true anomaly 'nu' [rad] to eccentric anomaly for an orbit with eccentricity 'e'.";
AnomalyEccentricToTrue::usage = "AnomalyEccentricToTrue[enm, e] converts eccentric anomaly 'enm' [rad] to true anomaly for an orbit with eccentricity 'e'.";
AnomalyTrueToMean::usage = "AnomalyTrueToMean[nu, e] converts true anomaly 'nu' [rad] to mean anomaly for an orbit with eccentricity 'e'.";
AnomalyMeanToTrue::usage = "AnomalyMeanToTrue[m, e] converts mean anomaly 'm' [rad] to true anomaly for an orbit with eccentricity 'e'.";
SemimajorAxisFromPeriod::usage = "SemimajorAxisFromPeriod[period] computes the semi-major axis for a given orbital period 'period' [s] around Earth.";
SemimajorAxisFromPeriodGeneral::usage = "SemimajorAxisFromPeriodGeneral[period, gm] computes the semi-major axis for a given orbital period 'period' [s] and gravitational parameter 'gm' [m^3/s^2].";
SemimajorAxisFromMeanMotion::usage = "SemimajorAxisFromMeanMotion[n] computes the semi-major axis for a given mean motion 'n' [rad/s] around Earth.";
SemimajorAxisFromMeanMotionGeneral::usage = "SemimajorAxisFromMeanMotionGeneral[n, gm] computes the semi-major axis for a given mean motion 'n' [rad/s] and gravitational parameter 'gm' [m^3/s^2].";
GeoSemimajorAxis::usage = "GeoSemimajorAxis[] computes the semi-major axis of a geostationary orbit around Earth.";
SunSynchronousInclination::usage = "SunSynchronousInclination[a, e] computes the inclination [rad] required for a sun-synchronous orbit with semi-major axis 'a' [m] and eccentricity 'e'.";
OrbitalPeriodFromState::usage = "OrbitalPeriodFromState[state, gm] returns the orbital period for a given 6-element Cartesian state vector and gravitational parameter.";
CelesTrakQuery::usage = "CelesTrakQuery[group] downloads General Perturbations (GP) records from CelesTrak for a given group (e.g., \"stations\", \"active\", \"gnss\").";

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

  OrbitalPeriod[a_?NumericQ] := Quantity[$iBraheOrbitalPeriod[a], "Seconds"];
  OrbitalPeriod[a_Quantity] := Quantity[$iBraheOrbitalPeriod[QuantityMagnitude[UnitConvert[a, "Meters"]]], "Seconds"];

  OrbitalPeriodGeneral[a_?NumericQ, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodGeneral[a, gm], "Seconds"];
  OrbitalPeriodGeneral[a_Quantity, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], gm], "Seconds"];
  OrbitalPeriodGeneral[a_?NumericQ, gm_Quantity] := Quantity[$iBraheOrbitalPeriodGeneral[a, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];
  OrbitalPeriodGeneral[a_Quantity, gm_Quantity] := Quantity[$iBraheOrbitalPeriodGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];

  PeriapsisDistance[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePeriapsisDistance[a, e], "Meters"];
  PeriapsisDistance[a_Quantity, e_?NumericQ] := Quantity[$iBrahePeriapsisDistance[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  ApoapsisDistance[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApoapsisDistance[a, e], "Meters"];
  ApoapsisDistance[a_Quantity, e_?NumericQ] := Quantity[$iBraheApoapsisDistance[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  MeanMotion[a_?NumericQ] := Quantity[$iBraheMeanMotion[a], "Radians"/"Seconds"];
  MeanMotion[a_Quantity] := Quantity[$iBraheMeanMotion[QuantityMagnitude[UnitConvert[a, "Meters"]]], "Radians"/"Seconds"];

  MeanMotionGeneral[a_?NumericQ, gm_?NumericQ] := Quantity[$iBraheMeanMotionGeneral[a, gm], "Radians"/"Seconds"];
  MeanMotionGeneral[a_Quantity, gm_?NumericQ] := Quantity[$iBraheMeanMotionGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], gm], "Radians"/"Seconds"];
  MeanMotionGeneral[a_?NumericQ, gm_Quantity] := Quantity[$iBraheMeanMotionGeneral[a, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Radians"/"Seconds"];
  MeanMotionGeneral[a_Quantity, gm_Quantity] := Quantity[$iBraheMeanMotionGeneral[QuantityMagnitude[UnitConvert[a, "Meters"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Radians"/"Seconds"];

  PeriapsisVelocity[a_?NumericQ, e_?NumericQ, gm_?NumericQ] := Quantity[$iBrahePeriapsisVelocity[a, e, gm], "Meters"/"Seconds"];
  PeriapsisVelocity[a_Quantity, e_?NumericQ, gm_?NumericQ] := Quantity[$iBrahePeriapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, gm], "Meters"/"Seconds"];
  PeriapsisVelocity[a_?NumericQ, e_?NumericQ, gm_Quantity] := Quantity[$iBrahePeriapsisVelocity[a, e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];
  PeriapsisVelocity[a_Quantity, e_?NumericQ, gm_Quantity] := Quantity[$iBrahePeriapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];

  ApoapsisVelocity[a_?NumericQ, e_?NumericQ, gm_?NumericQ] := Quantity[$iBraheApoapsisVelocity[a, e, gm], "Meters"/"Seconds"];
  ApoapsisVelocity[a_Quantity, e_?NumericQ, gm_?NumericQ] := Quantity[$iBraheApoapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, gm], "Meters"/"Seconds"];
  ApoapsisVelocity[a_?NumericQ, e_?NumericQ, gm_Quantity] := Quantity[$iBraheApoapsisVelocity[a, e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];
  ApoapsisVelocity[a_Quantity, e_?NumericQ, gm_Quantity] := Quantity[$iBraheApoapsisVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"/"Seconds"];

  PerigeeVelocity[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePerigeeVelocity[a, e], "Meters"/"Seconds"];
  PerigeeVelocity[a_Quantity, e_?NumericQ] := Quantity[$iBrahePerigeeVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"/"Seconds"];

  ApogeeVelocity[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApogeeVelocity[a, e], "Meters"/"Seconds"];
  ApogeeVelocity[a_Quantity, e_?NumericQ] := Quantity[$iBraheApogeeVelocity[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"/"Seconds"];

  PeriapsisAltitude[a_?NumericQ, e_?NumericQ, rb_?NumericQ] := Quantity[$iBrahePeriapsisAltitude[a, e, rb], "Meters"];
  PeriapsisAltitude[a_Quantity, e_?NumericQ, rb_?NumericQ] := Quantity[$iBrahePeriapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, rb], "Meters"];
  PeriapsisAltitude[a_?NumericQ, e_?NumericQ, rb_Quantity] := Quantity[$iBrahePeriapsisAltitude[a, e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];
  PeriapsisAltitude[a_Quantity, e_?NumericQ, rb_Quantity] := Quantity[$iBrahePeriapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];

  ApoapsisAltitude[a_?NumericQ, e_?NumericQ, rb_?NumericQ] := Quantity[$iBraheApoapsisAltitude[a, e, rb], "Meters"];
  ApoapsisAltitude[a_Quantity, e_?NumericQ, rb_?NumericQ] := Quantity[$iBraheApoapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, rb], "Meters"];
  ApoapsisAltitude[a_?NumericQ, e_?NumericQ, rb_Quantity] := Quantity[$iBraheApoapsisAltitude[a, e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];
  ApoapsisAltitude[a_Quantity, e_?NumericQ, rb_Quantity] := Quantity[$iBraheApoapsisAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e, QuantityMagnitude[UnitConvert[rb, "Meters"]]], "Meters"];

  PerigeeAltitude[a_?NumericQ, e_?NumericQ] := Quantity[$iBrahePerigeeAltitude[a, e], "Meters"];
  PerigeeAltitude[a_Quantity, e_?NumericQ] := Quantity[$iBrahePerigeeAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  ApogeeAltitude[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheApogeeAltitude[a, e], "Meters"];
  ApogeeAltitude[a_Quantity, e_?NumericQ] := Quantity[$iBraheApogeeAltitude[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Meters"];

  AnomalyMeanToEccentric[m_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToEccentric[m, e], "Radians"];
  AnomalyMeanToEccentric[m_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToEccentric[QuantityMagnitude[UnitConvert[m, "Radians"]], e], "Radians"];

  AnomalyEccentricToMean[enm_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToMean[enm, e], "Radians"];
  AnomalyEccentricToMean[enm_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToMean[QuantityMagnitude[UnitConvert[enm, "Radians"]], e], "Radians"];

  AnomalyTrueToEccentric[nu_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToEccentric[nu, e], "Radians"];
  AnomalyTrueToEccentric[nu_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToEccentric[QuantityMagnitude[UnitConvert[nu, "Radians"]], e], "Radians"];

  AnomalyEccentricToTrue[enm_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToTrue[enm, e], "Radians"];
  AnomalyEccentricToTrue[enm_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyEccentricToTrue[QuantityMagnitude[UnitConvert[enm, "Radians"]], e], "Radians"];

  AnomalyTrueToMean[nu_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToMean[nu, e], "Radians"];
  AnomalyTrueToMean[nu_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyTrueToMean[QuantityMagnitude[UnitConvert[nu, "Radians"]], e], "Radians"];

  AnomalyMeanToTrue[m_?NumericQ, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToTrue[m, e], "Radians"];
  AnomalyMeanToTrue[m_Quantity, e_?NumericQ] := Quantity[$iBraheAnomalyMeanToTrue[QuantityMagnitude[UnitConvert[m, "Radians"]], e], "Radians"];

  SemimajorAxisFromPeriod[period_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriod[period], "Meters"];
  SemimajorAxisFromPeriod[period_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriod[QuantityMagnitude[UnitConvert[period, "Seconds"]]], "Meters"];

  SemimajorAxisFromPeriodGeneral[period_?NumericQ, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[period, gm], "Meters"];
  SemimajorAxisFromPeriodGeneral[period_Quantity, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[QuantityMagnitude[UnitConvert[period, "Seconds"]], gm], "Meters"];
  SemimajorAxisFromPeriodGeneral[period_?NumericQ, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[period, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];
  SemimajorAxisFromPeriodGeneral[period_Quantity, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromPeriodGeneral[QuantityMagnitude[UnitConvert[period, "Seconds"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];

  SemimajorAxisFromMeanMotion[n_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotion[n], "Meters"];
  SemimajorAxisFromMeanMotion[n_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotion[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]]], "Meters"];

  SemimajorAxisFromMeanMotionGeneral[n_?NumericQ, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[n, gm], "Meters"];
  SemimajorAxisFromMeanMotionGeneral[n_Quantity, gm_?NumericQ] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]], gm], "Meters"];
  SemimajorAxisFromMeanMotionGeneral[n_?NumericQ, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[n, QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];
  SemimajorAxisFromMeanMotionGeneral[n_Quantity, gm_Quantity] := Quantity[$iBraheSemimajorAxisFromMeanMotionGeneral[QuantityMagnitude[UnitConvert[n, "Radians"/"Seconds"]], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Meters"];

  GeoSemimajorAxis[] := Quantity[$iBraheGeoSemimajorAxis[], "Meters"];

  SunSynchronousInclination[a_?NumericQ, e_?NumericQ] := Quantity[$iBraheSunSynchronousInclination[a, e], "Radians"];
  SunSynchronousInclination[a_Quantity, e_?NumericQ] := Quantity[$iBraheSunSynchronousInclination[QuantityMagnitude[UnitConvert[a, "Meters"]], e], "Radians"];

  OrbitalPeriodFromState[state_?VectorQ, gm_?NumericQ] := Quantity[$iBraheOrbitalPeriodFromState[NumericArray[state, "Real64"], gm], "Seconds"];
  OrbitalPeriodFromState[state_?VectorQ, gm_Quantity] := Quantity[$iBraheOrbitalPeriodFromState[NumericArray[state, "Real64"], QuantityMagnitude[UnitConvert[gm, "Meters"^3/"Seconds"^2]]], "Seconds"];
  OrbitalPeriodFromState[state_ /; (VectorQ[state] && AnyTrue[state, MatchQ[#, _Quantity] &]), gm_] :=
    Module[{magState},
      magState = Join[
        QuantityMagnitude[UnitConvert[Take[state, 3], "Meters"]],
        QuantityMagnitude[UnitConvert[Drop[state, 3], "Meters"/"Seconds"]]
      ];
      OrbitalPeriodFromState[magState, gm]
    ];
,
  Print["Warning: Brahe library not found at: ", braheLibraryPath[]];
];

CelesTrakQuery[group_String] := 
  Module[{url, response},
    url = "https://celestrak.org/NORAD/elements/gp.php?GROUP=" <> ToLowerCase[group] <> "&FORMAT=json";
    response = URLRead[url, "Body"];
    If[StringQ[response],
      ImportString[response, "RawJSON"],
      $Failed
    ]
  ];

End[];
EndPackage[];
