# BraheOrbitalPeriodFromState

## Description

This function computes the orbital period for a given Cartesian state vector (position and velocity) and gravitational parameter `gm`.

## Usage

BraheOrbitalPeriodFromState[state, gm] computes the orbital period [s] for a 6-element state vector `{x, y, z, vx, vy, vz}`.

## Notes

The argument `state` is a list of 6 numbers. The first three are position in meters, and the last three are velocity in meters per second.

The argument `gm` is the standard gravitational parameter in $m^3/s^2$.

Both `state` and `gm` can contain Quantity objects, in which case they are automatically converted to the required SI units.

The function returns the orbital period as a Quantity object with units of "Seconds".

## Examples

Compute the orbital period for a circular LEO orbit with 7000 km radius:

```wolfram
state = {7000000.0, 0, 0, 0, 7546.05, 0};
gm = 3.986004415*^14;
BraheOrbitalPeriodFromState[state, gm]
(* Quantity[5828.52, "Seconds"] *)
```

Using Quantity objects:

```wolfram
state = {
  Quantity[7000, "Kilometers"], Quantity[0, "Meters"], Quantity[0, "Meters"],
  Quantity[0, "Meters"/"Seconds"], Quantity[7.54605, "Kilometers"/"Seconds"], Quantity[0, "Meters"/"Seconds"]
};
BraheOrbitalPeriodFromState[state, Quantity[3.986*^14, "Meters"^3/"Seconds"^2]]
(* Quantity[5828.56, "Seconds"] *)
```
