# ApogeeVelocity

## Description

This function computes the apogee velocity for an orbit with semi-major axis `a` and eccentricity `e` around the Earth.

## Usage

ApogeeVelocity[a, e] computes the apogee velocity for an orbit with semi-major axis `a` and eccentricity `e`.

## Notes

The argument `a` is assumed to be in meters.

The argument `e` is assumed to be the orbital eccentricity, dimensionless.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the apogee velocity as a Quantity object with units of "Meters"/"Seconds".

## Examples

Compute the apogee velocity for a semi-major axis of 7,000,000 meters and eccentricity 0.1:

```wolfram
ApogeeVelocity[7000000.0, 0.1]
(* Quantity[6825.662019, ("Meters")/("Seconds")] *)
```

Compute the apogee velocity using a Quantity object:

```wolfram
ApogeeVelocity[Quantity[7000, "Kilometers"], 0.1]
(* Quantity[6825.662019, ("Meters")/("Seconds")] *)
```
