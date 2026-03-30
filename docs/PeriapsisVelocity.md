# PeriapsisVelocity

## Description

This function computes the periapsis velocity for an orbit with semi-major axis `a`, eccentricity `e`, and standard gravitational parameter `gm`.

## Usage

PeriapsisVelocity[a, e, gm] computes the periapsis velocity for an orbit with semi-major axis `a`, eccentricity `e`, and gravitational parameter `gm`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `a` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the periapsis velocity as a Quantity object with units of "Meters"/"Seconds".

## Examples

Compute the periapsis velocity for a semi-major axis of 7,000,000 meters, eccentricity 0.1, and Earth's standard gravitational parameter:

```wolfram
PeriapsisVelocity[7000000.0, 0.1, 3.986004415*^14]
(* Quantity[8342.475801, ("Meters")/("Seconds")] *)
```

Compute the periapsis velocity using Quantity objects:

```wolfram
PeriapsisVelocity[Quantity[7000, "Kilometers"], 0.1, Quantity[3.986004415*^14, "Meters"^3/"Seconds"^2]]
(* Quantity[8342.475801, ("Meters")/("Seconds")] *)
```
