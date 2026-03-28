# BraheApogeeAltitude

## Description

This function computes the apogee altitude for an orbit with semi-major axis `a` and eccentricity `e` around the Earth.

## Usage

BraheApogeeAltitude[a, e] computes the apogee altitude for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the apogee altitude as a Quantity object with units of "Meters".

## Examples

Compute the apogee altitude for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
BraheApogeeAltitude[7000000.0, 0.1]
(* Quantity[1321863.7, "Meters"] *)
```

Compute the apogee altitude using a Quantity object:

```wolfram
BraheApogeeAltitude[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[1321863.7, "Meters"] *)
```
