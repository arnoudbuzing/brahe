# BraheSunSynchronousInclination

## Description

This function computes the required inclination for a sun-synchronous orbit with semi-major axis `a` and eccentricity `e`.

## Usage

BraheSunSynchronousInclination[a, e] computes the inclination [rad] for a sun-synchronous orbit.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the inclination as a Quantity object with units of "Radians".

## Examples

Compute the inclination for a sun-synchronous orbit at 7,000,000 meters altitude and zero eccentricity:

```wolfram
BraheSunSynchronousInclination[7000000.0, 0.0]
(* Quantity[1.708221, "Radians"] *)
```

Convert the result to degrees for easier interpretation:

```wolfram
UnitConvert[BraheSunSynchronousInclination[7000000.0, 0.0], "Degrees"]
(* Quantity[97.874, "Degrees"] *)
```
