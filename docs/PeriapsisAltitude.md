# PeriapsisAltitude

## Description

This function computes the periapsis altitude for an orbit with semi-major axis `a`, eccentricity `e`, and body radius `rBody`.

## Usage

PeriapsisAltitude[a, e, rBody] computes the periapsis altitude for an orbit with semi-major axis `a`, eccentricity `e`, and body radius `rBody`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `rBody` is assumed to be the radius of the central body in meters.

The arguments `a` and `rBody` can be Quantity objects, in which case the units are automatically converted to meters.

The function returns the periapsis altitude as a Quantity object with units of "Meters".

## Examples

Compute the periapsis altitude for a semi-major axis of 7,000,000 meters, eccentricity 0.1, and Earth's radius:

```wolfram
PeriapsisAltitude[7000000.0, 0.1, 6378136.3]
(* Quantity[-78136.3, "Meters"] *)
```

Compute the periapsis altitude using Quantity objects:

```wolfram
PeriapsisAltitude[Quantity[7000, "Kilometers"], 0.1, Quantity[6378.1363, "Kilometers"]]
(* Quantity[-78136.3, "Meters"] *)
```
