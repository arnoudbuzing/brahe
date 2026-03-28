#!/usr/bin/env wolframscript

$projectDir = ExpandFileName[DirectoryName[$InputFileName, 2]];
$pacletDir = FileNameJoin[{$projectDir, "Brahe"}];
PacletDirectoryAdd[$pacletDir];

$testFile = FileNameJoin[{DirectoryName[$InputFileName], "Brahe.wlt"}];
Print["Running tests: ", $testFile];
tr = TestReport[$testFile];

Print["Tests passed: ", tr["TestsSucceededCount"]];
Print["Tests failed: ", tr["TestsFailedCount"]];

If[tr["TestsFailedCount"] > 0,
  Print["Failure details:"];
  Scan[Print, tr["TestResults"] // Select[#["Outcome"] === "Failure" &]];
  Exit[1]
];
