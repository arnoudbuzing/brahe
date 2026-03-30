# GeoSemimajorAxis

## Description

This function computes the theoretical semi-major axis for a geostationary orbit around the Earth.

## Usage

GeoSemimajorAxis[] returns the semi-major axis of a geostationary orbit.

## Notes

The function returns the semi-major axis as a Quantity object with units of "Meters".

The calculation is based on the Earth's rotation rate and gravitational parameter.

## Examples

Get the geostationary semi-major axis:

```wolfram
GeoSemimajorAxis[]
(* Quantity[4.21642*10^7, "Meters"] *)
```
