# SemimajorAxisFromMeanMotion

## Description

This function computes the semi-major axis for an orbit around the Earth given its mean motion.

## Usage

SemimajorAxisFromMeanMotion[n] computes the semi-major axis for an orbit with mean motion `n`.

## Notes

The argument `n` is assumed to be in radians per second.

The argument `n` can be a Quantity object (e.g., "Radians"/"Seconds" or "Degrees"/"Minutes"), in which case the units are automatically converted to radians per second.

The function returns the semi-major axis as a Quantity object with units of "Meters".

## Examples

Compute the semi-major axis for a mean motion of 0.00107800761 rad/s:

```wolfram
SemimajorAxisFromMeanMotion[0.00107800761]
(* Quantity[7.*10^6, "Meters"] *)
```

Compute the semi-major axis for a mean motion of 1.0 degree per minute:

```wolfram
SemimajorAxisFromMeanMotion[Quantity[1.0, "Degrees"/"Minutes"]]
(* Quantity[5.07147*10^7, "Meters"] *)
```
