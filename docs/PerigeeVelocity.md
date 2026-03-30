# PerigeeVelocity

## Description

This function computes the perigee velocity for an orbit with semi-major axis `a` and eccentricity `e` around the Earth.

## Usage

PerigeeVelocity[a, e] computes the perigee velocity for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the perigee velocity as a Quantity object with units of "Meters"/"Seconds".

## Examples

Compute the perigee velocity for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
PerigeeVelocity[7000000.0, 0.1]
(* Quantity[8342.475801, ("Meters")/("Seconds")] *)
```

Compute the perigee velocity using a Quantity object:

```wolfram
PerigeeVelocity[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[8342.475801, ("Meters")/("Seconds")] *)
```
