# MeanMotionGeneral

## Description

This function computes the mean motion for an orbit with semi-major axis `a` around a central body with standard gravitational parameter `gm`.

## Usage

MeanMotionGeneral[a, gm] computes the mean motion for an orbit with semi-major axis `a` and gravitational parameter `gm`.

## Notes

The argument `a` is assumed to be in meters.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `a` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the mean motion as a Quantity object with units of "Radians"/"Seconds".

## Examples

Compute the mean motion for a semi-major axis of 7,000,000 meters and Earth's standard gravitational parameter:

```wolfram
MeanMotionGeneral[7000000.0, 3.986004415*^14]
(* Quantity[0.001078007612, ("Radians")/("Seconds")] *)
```

Compute the mean motion using Quantity objects for both the semi-major axis and the gravitational parameter:

```wolfram
MeanMotionGeneral[Quantity[7000, "Kilometers"], Quantity[3.986004415*^14, "Meters"^3/"Seconds"^2]]
(* Quantity[0.001078007612, ("Radians")/("Seconds")] *)
```
