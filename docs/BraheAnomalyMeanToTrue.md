# BraheAnomalyMeanToTrue

## Description

This function converts mean anomaly `m` to true anomaly for an orbit with eccentricity `e`.

## Usage

BraheAnomalyMeanToTrue[m, e] converts mean anomaly `m` to true anomaly.

## Notes

The argument `m` is assumed to be in radians.

The argument `m` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the true anomaly as a Quantity object with units of "Radians".

## Examples

Convert a mean anomaly to true anomaly:

```wolfram
BraheAnomalyMeanToTrue[1.0, 0.1]
(* Quantity[1.18247, "Radians"] *)
```
