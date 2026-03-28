# BraheAnomalyTrueToEccentric

## Description

This function converts true anomaly `nu` to eccentric anomaly for an orbit with eccentricity `e`.

## Usage

BraheAnomalyTrueToEccentric[nu, e] converts true anomaly `nu` to eccentric anomaly.

## Notes

The argument `nu` is assumed to be in radians.

The argument `nu` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the eccentric anomaly as a Quantity object with units of "Radians".

## Examples

Convert a true anomaly to eccentric anomaly:

```wolfram
BraheAnomalyTrueToEccentric[1.2, 0.1]
(* Quantity[1.10729, "Radians"] *)
```
