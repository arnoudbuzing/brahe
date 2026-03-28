# BraheSemimajorAxisFromPeriodGeneral

## Description

This function computes the semi-major axis for a given orbital period around a general body with standard gravitational parameter `gm`.

## Usage

BraheSemimajorAxisFromPeriodGeneral[period, gm] computes the semi-major axis for an orbital period `period` around a body with gravitational parameter `gm`.

## Notes

The argument `period` is assumed to be in seconds.

The argument `gm` is assumed to be in $m^3/s^2$.

The arguments `period` and `gm` can be Quantity objects, in which case the units are automatically converted to the required SI units.

The function returns the semi-major axis as a Quantity object with units of "Meters".

## Examples

Compute the semi-major axis for an orbital period of 5828.51664 seconds around Earth:

```wolfram
BraheSemimajorAxisFromPeriodGeneral[5828.51664, 3.986004415*^14]
(* Quantity[7.*10^6, "Meters"] *)
```

Compute the semi-major axis for a 24-hour orbital period around Earth:

```wolfram
BraheSemimajorAxisFromPeriodGeneral[Quantity[24, "Hours"], 3.986004415*^14]
(* Quantity[4.22411*10^7, "Meters"] *)
```
