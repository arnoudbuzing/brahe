# OrbitalPeriod

## Description

This function computes the orbital period of a body in a circular orbit with semi-major axis a around a central body with the Earth's standard gravitational parameter.

## Usage

OrbitalPeriod[a] computes the orbital period of a body in a circular orbit with semi-major axis `a`.

## Notes

The argument `a` is assumed to be in meters.

The argument `a` can be a Quantity object, in which case the units are automatically converted to meters.

The function returns the orbital period as a Quantity object with units of "Seconds".

## Examples

Compute the orbital period for a semi-major axis of 7,000,000 meters:

```wolfram
OrbitalPeriod[7000000.0]
(* Quantity[5828.516639879384, "Seconds"] *)
```

Compute the orbital period using a Quantity object for the semi-major axis:

```wolfram
OrbitalPeriod[Quantity[7000, "Kilometers"]]
(* Quantity[5828.516639879384, "Seconds"] *)
```


