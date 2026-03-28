# BraheMeanMotion

## Description

This function computes the mean motion for an orbit with semi-major axis `a` around a central body with Earth's standard gravitational parameter.

## Usage

BraheMeanMotion[a] computes the mean motion for an orbit with semi-major axis `a`.

## Notes

The argument `a` is assumed to be in meters.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the mean motion as a Quantity object with units of "Radians"/"Seconds".

## Examples

Compute the mean motion for a semi-major axis of 7,000,000 meters:

```wolfram
BraheMeanMotion[7000000.0]
(* Quantity[0.001078007612, ("Radians")/("Seconds")] *)
```

Compute the mean motion using a Quantity object for the semi-major axis:

```wolfram
BraheMeanMotion[Quantity[7000, "Kilometers"]]
(* Quantity[0.001078007612, ("Radians")/("Seconds")] *)
```
