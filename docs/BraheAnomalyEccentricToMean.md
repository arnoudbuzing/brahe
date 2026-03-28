# BraheAnomalyEccentricToMean

## Description

This function converts eccentric anomaly `enm` to mean anomaly for an orbit with eccentricity `e`.

## Usage

BraheAnomalyEccentricToMean[enm, e] converts eccentric anomaly `enm` to mean anomaly.

## Notes

The argument `enm` is assumed to be in radians.

The argument `enm` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the mean anomaly as a Quantity object with units of "Radians".

## Examples

Convert an eccentric anomaly to mean anomaly:

```wolfram
BraheAnomalyEccentricToMean[1.088597752, 0.1]
(* Quantity[1.0, "Radians"] *)
```
