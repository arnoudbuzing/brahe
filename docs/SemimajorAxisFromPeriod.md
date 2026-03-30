# SemimajorAxisFromPeriod

## Description

This function computes the semi-major axis of an orbit around the Earth given its orbital period.

## Usage

SemimajorAxisFromPeriod[period] computes the semi-major axis for a mission with orbital period `period`.

## Notes

The argument `period` is assumed to be in seconds.

The argument `period` can be a Quantity object, in which case the units are automatically converted to seconds.

The function returns the semi-major axis as a Quantity object with units of "Meters".

## Examples

Compute the semi-major axis for an orbital period of 5828.51664 seconds:

```wolfram
SemimajorAxisFromPeriod[5828.51664]
(* Quantity[7.*10^6, "Meters"] *)
```

Compute the semi-major axis for a 90-minute orbital period:

```wolfram
SemimajorAxisFromPeriod[Quantity[90, "Minutes"]]
(* Quantity[6.65243*10^6, "Meters"] *)
```
