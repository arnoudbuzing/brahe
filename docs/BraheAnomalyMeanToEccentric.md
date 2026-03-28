# BraheAnomalyMeanToEccentric

## Description

This function converts mean anomaly `m` to eccentric anomaly for an orbit with eccentricity `e`. It solves Kepler's Equation iteratively.

## Usage

BraheAnomalyMeanToEccentric[m, e] converts mean anomaly `m` to eccentric anomaly.

## Notes

The argument `m` is assumed to be in radians.

The argument `m` can be a Quantity object, in which case the units are automatically converted to radians.

The function returns the eccentric anomaly as a Quantity object with units of "Radians".

## Examples

Convert a mean anomaly of 1.0 radian to eccentric anomaly for an eccentricity of 0.1:

```wolfram
BraheAnomalyMeanToEccentric[1.0, 0.1]
(* Quantity[1.088597752, "Radians"] *)
```

Convert mean anomaly specified in degrees:

```wolfram
BraheAnomalyMeanToEccentric[Quantity[45, "Degrees"], 0.1]
(* Quantity[0.855079, "Radians"] *)
```
