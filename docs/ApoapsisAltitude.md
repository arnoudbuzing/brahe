# ApoapsisAltitude

## Description

This function computes the apoapsis altitude for an orbit with semi-major axis `a`, eccentricity `e`, and body radius `rBody`.

## Usage

ApoapsisAltitude[a, e, rBody] computes the apoapsis altitude for an orbit with semi-major axis `a`, eccentricity `e`, and body radius `rBody`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `rBody` is assumed to be the radius of the central body in meters.

The arguments `a` and `rBody` can be Quantity objects, in which case the units are automatically converted to meters.

The function returns the apoapsis altitude as a Quantity object with units of "Meters".

## Examples

Compute the apoapsis altitude for a semi-major axis of 7,000,000 meters, eccentricity 0.1, and Earth's radius:

```wolfram
ApoapsisAltitude[7000000.0, 0.1, 6378136.3]
(* Quantity[1321863.7, "Meters"] *)
```

Compute the apoapsis altitude using Quantity objects:

```wolfram
ApoapsisAltitude[Quantity[7000, "Kilometers"], 0.1, Quantity[6378.1363, "Kilometers"]]
(* Quantity[1321863.7, "Meters"] *)
```
