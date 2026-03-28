$projectDir = ExpandFileName[DirectoryName[$InputFileName, 2]];
$pacletDir = FileNameJoin[{$projectDir, "Brahe"}];
PacletDirectoryLoad[$pacletDir];

Print["Loading Brahe..."];
$lib = FileNameJoin[{$pacletDir, "LibraryResources", $SystemID, "libbrahe_rs.dylib"}];
Print["Library path: ", $lib];
If[!FileExistsQ[$lib], Print["Library missing!"]; Exit[1]];

Print["Loading BraheOrbitalPeriod..."];
$f1 = LibraryFunctionLoad[$lib, "BraheOrbitalPeriod", {Real}, Real];
Print["Loaded."];

Print["Calling BraheOrbitalPeriod[7000000]..."];
res = $f1[7000000.0];
Print["Result: ", res];

Print["Loading BrahePeriapsisDistance..."];
$f2 = LibraryFunctionLoad[$lib, "BrahePeriapsisDistance", {Real, Real}, Real];
Print["Loaded."];

Print["Calling BrahePeriapsisDistance[7000000, 0.1]..."];
res = $f2[7000000.0, 0.1];
Print["Result: ", res];

Print["Success."];
