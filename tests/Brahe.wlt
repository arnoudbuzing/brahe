VerificationTest[
  Check[
    PacletDirectoryLoad[FileNameJoin[{DirectoryName[$InputFileName, 2], "Brahe"}]];
    Get["Brahe`"]
  ,
    Print["Failed to load Brahe`"]
  ];
  Brahe`BraheOrbitalPeriod[7000000.0]
,
  Quantity[5828.516639879384`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheOrbitalPeriod-LEO"
]

VerificationTest[
  Brahe`BraheOrbitalPeriodGeneral[7000000.0, 3.986004418*^14]
,
  Quantity[5828.516637686015`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheOrbitalPeriodGeneral-LEO"
]

VerificationTest[
  Brahe`BraheOrbitalPeriod[Quantity[7000, "Kilometers"]]
,
  Quantity[5828.516639879384`, "Seconds"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheOrbitalPeriod-Quantity"
]

VerificationTest[
  Brahe`BrahePeriapsisDistance[Quantity[7000, "Kilometers"], 0.1]
,
  Quantity[6300000.0, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BrahePeriapsisDistance-Quantity"
]

VerificationTest[
  Brahe`BraheApoapsisDistance[7000000.0, 0.1]
,
  Quantity[7700000.0, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheApoapsisDistance-Numeric"
]

VerificationTest[
  Brahe`BraheMeanMotion[7000000.0]
,
  Quantity[0.0010780076124668337, ("Radians")/("Seconds")]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-10 &)
,
  TestID -> "BraheMeanMotion-Numeric"
]

VerificationTest[
  Brahe`BrahePerigeeVelocity[7000000.0, 0.1]
,
  Quantity[8342.475800631788, ("Meters")/("Seconds")]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-6 &)
,
  TestID -> "BrahePerigeeVelocity-Numeric"
]

VerificationTest[
  Brahe`BraheApogeeAltitude[7000000.0, 0.1]
,
  Quantity[1321863.7, "Meters"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-1 &)
,
  TestID -> "BraheApogeeAltitude-Numeric"
]

VerificationTest[
  Brahe`BraheAnomalyMeanToEccentric[1.0, 0.1]
,
  Quantity[1.0885977523978936, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheAnomalyMeanToEccentric-Numeric"
]

VerificationTest[
  Brahe`BraheAnomalyEccentricToMean[Brahe`BraheAnomalyMeanToEccentric[1.0, 0.1], 0.1]
,
  Quantity[1.0, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheAnomaly-MeanEccentric-Identity"
]

VerificationTest[
  Brahe`BraheAnomalyTrueToMean[Brahe`BraheAnomalyMeanToTrue[1.0, 0.1], 0.1]
,
  Quantity[1.0, "Radians"]
,
  {}
,
  SameTest -> (Abs[QuantityMagnitude[#1] - QuantityMagnitude[#2]] < 1*^-8 &)
,
  TestID -> "BraheAnomaly-MeanTrue-Identity"
]
