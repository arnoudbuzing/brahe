VerificationTest[
  Check[
    PacletDirectoryLoad[FileNameJoin[{DirectoryName[$InputFileName, 2], "Brahe"}]];
    Get["Brahe`"]
  ,
    Print["Failed to load Brahe`"]
  ];
  Brahe`OrbitalPeriod[7000000.0]
,
  Quantity[5828.516639879384`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "OrbitalPeriod-LEO"
]

VerificationTest[
  Brahe`OrbitalPeriodGeneral[7000000.0, 3.986004418*^14]
,
  Quantity[5828.516637686015`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "OrbitalPeriodGeneral-LEO"
]

VerificationTest[
  Brahe`OrbitalPeriod[Quantity[7000, "Kilometers"]]
,
  Quantity[5828.516639879384`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "OrbitalPeriod-Quantity"
]

VerificationTest[
  Brahe`PeriapsisDistance[Quantity[7000, "Kilometers"], 0.1]
,
  Quantity[6300000.0, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "PeriapsisDistance-Quantity"
]

VerificationTest[
  Brahe`ApoapsisDistance[7000000.0, 0.1]
,
  Quantity[7700000.0, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "ApoapsisDistance-Numeric"
]

VerificationTest[
  Brahe`MeanMotion[7000000.0]
,
  Quantity[0.0010780076124668337, ("Radians")/("Seconds")]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-10 &)
,
  TestID -> "MeanMotion-Numeric"
]

VerificationTest[
  Brahe`PerigeeVelocity[7000000.0, 0.1]
,
  Quantity[8342.475800631788, ("Meters")/("Seconds")]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-6 &)
,
  TestID -> "PerigeeVelocity-Numeric"
]

VerificationTest[
  Brahe`ApogeeAltitude[7000000.0, 0.1]
,
  Quantity[1321863.7, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-1 &)
,
  TestID -> "ApogeeAltitude-Numeric"
]

VerificationTest[
  Brahe`AnomalyMeanToEccentric[1.0, 0.1]
,
  Quantity[1.0885977523978936, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "AnomalyMeanToEccentric-Numeric"
]

VerificationTest[
  Brahe`AnomalyEccentricToMean[Brahe`AnomalyMeanToEccentric[1.0, 0.1], 0.1]
,
  Quantity[1.0, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "Anomaly-MeanEccentric-Identity"
]

VerificationTest[
  Brahe`AnomalyTrueToMean[Brahe`AnomalyMeanToTrue[1.0, 0.1], 0.1]
,
  Quantity[1.0, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "Anomaly-MeanTrue-Identity"
]

VerificationTest[
  Brahe`SemimajorAxisFromPeriod[5828.51664]
,
  Quantity[7.*^6, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-2 &)
,
  TestID -> "SemimajorAxisFromPeriod-Numeric"
]

VerificationTest[
  Brahe`SemimajorAxisFromMeanMotion[0.0010780076124668337]
,
  Quantity[7.*^6, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-2 &)
,
  TestID -> "SemimajorAxisFromMeanMotion-Numeric"
]

VerificationTest[
  Brahe`GeoSemimajorAxis[]
,
  Quantity[42164172.355, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-1 &)
,
  TestID -> "GeoSemimajorAxis-Numeric"
]

VerificationTest[
  Brahe`SunSynchronousInclination[7000000.0, 0.0]
,
  Quantity[1.7082214228, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-6 &)
,
  TestID -> "SunSynchronousInclination-Numeric"
]

VerificationTest[
  Brahe`OrbitalPeriodFromState[{7000000.0, 0, 0, 0, 7546.05328691501, 0}, 3.986004415*^14]
,
  Quantity[5828.51664, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-5 &)
,
  TestID -> "OrbitalPeriodFromState-Numeric"
]

VerificationTest[
  And[ListQ[#], AllTrue[#, AssociationQ]]& @ Brahe`CelesTrakQuery["stations"],
  True,
  TestID -> "CelesTrakQuery-Associations"
]

VerificationTest[
  Length[Brahe`CelesTrakQuery["stations"]] > 0,
  True,
  TestID -> "CelesTrakQuery-Length"
]

VerificationTest[
  Module[{sats},
    sats = Brahe`CelesTrakQuery["stations"];
    MemberQ[Lookup[sats, "NORAD_CAT_ID"], 25544 | 25544. | "25544"]
  ],
  True,
  TestID -> "CelesTrakQuery-Member"
]
