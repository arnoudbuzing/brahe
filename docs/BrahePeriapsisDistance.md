# BrahePeriapsisDistance

## Description

This function computes the periapsis distance for an orbit with semi-major axis `a` and eccentricity `e`.

## Usage

BrahePeriapsisDistance[a, e] computes the periapsis distance for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The function returns the periapsis distance as a Quantity object with units of "Meters".

## Examples

Compute the periapsis distance for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
BrahePeriapsisDistance[7000000.0, 0.1]
(* Quantity[6300000.0, "Meters"] *)
```

Compute the periapsis distance using a Quantity object for the semi-major axis:

```wolfram
BrahePeriapsisDistance[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[6300000.0, "Meters"] *)
```
