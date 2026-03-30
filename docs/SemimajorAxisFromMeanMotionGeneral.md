# SemimajorAxisFromMeanMotionGeneral

## Description

This function computes the semi-major axis for an orbit around a general body with standard gravitational parameter `gm` given its mean motion.

## Usage

SemimajorAxisFromMeanMotionGeneral[n, gm] computes the semi-major axis for an orbit with mean motion `n` around a body with gravitational parameter `gm`.

## Notes

The argument `n` is assumed to be in radians per second.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `n` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the semi-major axis as a Quantity object with units of "Meters".

## Examples

Compute the semi-major axis for a mean motion of 0.00107800761 rad/s around Earth:

```wolfram
SemimajorAxisFromMeanMotionGeneral[0.00107800761, 3.986004415*^14]
(* Quantity[7.*10^6, "Meters"] *)
```

Compute the semi-major axis for a mean motion of 1.0 degree per minute around Earth:

```wolfram
SemimajorAxisFromMeanMotionGeneral[Quantity[1.0, "Degrees"/"Minutes"], 3.986004415*^14]
(* Quantity[5.07147*10^7, "Meters"] *)
```
