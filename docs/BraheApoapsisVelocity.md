# BraheApoapsisVelocity

## Description

This function computes the apoapsis velocity for an orbit with semi-major axis `a`, eccentricity `e`, and standard gravitational parameter `gm`.

## Usage

BraheApoapsisVelocity[a, e, gm] computes the apoapsis velocity for an orbit with semi-major axis `a`, eccentricity `e`, and gravitational parameter `gm`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `a` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the apoapsis velocity as a Quantity object with units of "Meters"/"Seconds".

## Examples

Compute the apoapsis velocity for a semi-major axis of 7,000,000 meters, eccentricity 0.1, and Earth's standard gravitational parameter:

```wolfram
BraheApoapsisVelocity[7000000.0, 0.1, 3.986004415*^14]
(* Quantity[6825.662019, ("Meters")/("Seconds")] *)
```

Compute the apoapsis velocity using Quantity objects:

```wolfram
BraheApoapsisVelocity[Quantity[7000, "Kilometers"], 0.1, Quantity[3.986004415*^14, "Meters"^3/"Seconds"^2]]
(* Quantity[6825.662019, ("Meters")/("Seconds")] *)
```
