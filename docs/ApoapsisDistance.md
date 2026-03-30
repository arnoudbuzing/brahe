# ApoapsisDistance

## Description

This function computes the apoapsis distance for an orbit with semi-major axis `a` and eccentricity `e`.

## Usage

ApoapsisDistance[a, e] computes the apoapsis distance for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The function returns the apoapsis distance as a Quantity object with units of "Meters".

## Examples

Compute the apoapsis distance for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
ApoapsisDistance[7000000.0, 0.1]
(* Quantity[7700000.0, "Meters"] *)
```

Compute the apoapsis distance using a Quantity object for the semi-major axis:

```wolfram
ApoapsisDistance[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[7700000.0, "Meters"] *)
```
