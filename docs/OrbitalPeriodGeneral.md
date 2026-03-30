# OrbitalPeriodGeneral

## Description

This function computes the orbital period of a body in a circular orbit with semi-major axis `a` around a central body with standard gravitational parameter `gm`.

## Usage

OrbitalPeriodGeneral[a, gm] computes the orbital period of a body with semi-major axis `a` and gravitational parameter `gm`.

## Notes

The argument `a` is assumed to be in meters.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `a` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the orbital period as a Quantity object with units of "Seconds".

## Examples

Compute the orbital period for a semi-major axis of 7,000,000 meters and Earth's standard gravitational parameter:

```wolfram
OrbitalPeriodGeneral[7000000.0, 3.986004418*^14]
(* Quantity[5828.516637686015, "Seconds"] *)
```

Compute the orbital period using Quantity objects for both the semi-major axis and the gravitational parameter:

```wolfram
OrbitalPeriodGeneral[Quantity[7000, "Kilometers"], Quantity[3.986004418*^14, "Meters"^3/"Seconds"^2]]
(* Quantity[5828.516637686015, "Seconds"] *)
```
