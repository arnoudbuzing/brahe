# AnomalyTrueToMean

## Description

This function converts true anomaly `nu` to mean anomaly for an orbit with eccentricity `e`.

## Usage

AnomalyTrueToMean[nu, e] converts true anomaly `nu` to mean anomaly.

## Notes

The argument `nu` is assumed to be in radians.

The argument `nu` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the mean anomaly as a Quantity object with units of "Radians".

## Examples

Convert a true anomaly to mean anomaly:

```wolfram
AnomalyTrueToMean[1.2, 0.1]
(* Quantity[1.01783, "Radians"] *)
```
