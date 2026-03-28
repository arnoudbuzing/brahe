# BrahePerigeeAltitude

## Description

This function computes the perigee altitude for an orbit with semi-major axis `a` and eccentricity `e` around the Earth.

## Usage

BrahePerigeeAltitude[a, e] computes the perigee altitude for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the perigee altitude as a Quantity object with units of "Meters".

## Examples

Compute the perigee altitude for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
BrahePerigeeAltitude[7000000.0, 0.1]
(* Quantity[-78136.3, "Meters"] *)
```

Compute the perigee altitude using a Quantity object:

```wolfram
BrahePerigeeAltitude[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[-78136.3, "Meters"] *)
```
