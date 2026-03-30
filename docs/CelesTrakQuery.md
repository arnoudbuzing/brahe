# CelesTrakQuery

`CelesTrakQuery[group]` downloads General Perturbations (GP) records from CelesTrak for a given group.

## Arguments

*   `group`: A string specifying the satellite group to download. Common groups include:
    *   `"stations"`: International Space Station and others.
    *   `"active"`: All active satellites.
    *   `"gnss"`: GPS, GLONASS, Galileo, Beidou, etc.
    *   `"weather"`: Weather satellites.
    *   `"visual"`: Brightest satellites.

## Returns

A list of associations, where each association represents a satellite record (OMM/GP format). Common keys include:
*   `"OBJECT_NAME"`: Name of the satellite.
*   `"NORAD_CAT_ID"`: NORAD Catalog Number.
*   `"EPOCH"`: Time of the orbital elements.
*   `"MEAN_MOTION"`: Mean motion in revolutions per day.
*   `"ECCENTRICITY"`: Orbital eccentricity.
*   `"INCLINATION"`: Orbital inclination in degrees.

## Examples

### Download Station Data
```wolfram
records = CelesTrakQuery["stations"];
First[records]
(* <| "OBJECT_NAME" -> "ISS (ZARYA)", "NORAD_CAT_ID" -> 25544, ... |> *)
```

### Find GPS Satellites
```wolfram
gps = CelesTrakQuery["gps"];
Select[gps, StringContainsQ[#["OBJECT_NAME"], "GPS"] &]
```

## Details

*   This function requires an active internet connection.
*   CelesTrak uses a 6-hour local cache to minimize server load. Subsequent calls for the same group within 6 hours will returned cached data.
