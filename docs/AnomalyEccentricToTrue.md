# AnomalyEccentricToTrue

## Description

This function converts eccentric anomaly `enm` to true anomaly for an orbit with eccentricity `e`.

## Usage

AnomalyEccentricToTrue[enm, e] converts eccentric anomaly `enm` to true anomaly.

## Notes

The argument `enm` is assumed to be in radians.

The argument `enm` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the true anomaly as a Quantity object with units of "Radians".

## Examples

Convert an eccentric anomaly to true anomaly:

```wolfram
AnomalyEccentricToTrue[1.10729, 0.1]
(* Quantity[1.2, "Radians"] *)
```
