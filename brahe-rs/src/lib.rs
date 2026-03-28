use wolfram_library_link as wll;
use brahe::orbits::keplerian::*;
use brahe::constants::AngleFormat;

#[wll::export]
fn BraheOrbitalPeriod(a: f64) -> f64 {
    orbital_period(a)
}

#[wll::export]
fn BraheOrbitalPeriodGeneral(a: f64, gm: f64) -> f64 {
    orbital_period_general(a, gm)
}

#[wll::export]
fn BrahePeriapsisDistance(a: f64, e: f64) -> f64 {
    periapsis_distance(a, e)
}

#[wll::export]
fn BraheApoapsisDistance(a: f64, e: f64) -> f64 {
    apoapsis_distance(a, e)
}

#[wll::export]
fn BraheMeanMotion(a: f64) -> f64 {
    mean_motion(a, AngleFormat::Radians)
}

#[wll::export]
fn BraheMeanMotionGeneral(a: f64, gm: f64) -> f64 {
    mean_motion_general(a, gm, AngleFormat::Radians)
}

#[wll::export]
fn BrahePeriapsisVelocity(a: f64, e: f64, gm: f64) -> f64 {
    periapsis_velocity(a, e, gm)
}

#[wll::export]
fn BraheApoapsisVelocity(a: f64, e: f64, gm: f64) -> f64 {
    apoapsis_velocity(a, e, gm)
}

#[wll::export]
fn BrahePerigeeVelocity(a: f64, e: f64) -> f64 {
    perigee_velocity(a, e)
}

#[wll::export]
fn BraheApogeeVelocity(a: f64, e: f64) -> f64 {
    apogee_velocity(a, e)
}

#[wll::export]
fn BrahePeriapsisAltitude(a: f64, e: f64, r_body: f64) -> f64 {
    periapsis_altitude(a, e, r_body)
}

#[wll::export]
fn BraheApoapsisAltitude(a: f64, e: f64, r_body: f64) -> f64 {
    apoapsis_altitude(a, e, r_body)
}

#[wll::export]
fn BrahePerigeeAltitude(a: f64, e: f64) -> f64 {
    perigee_altitude(a, e)
}

#[wll::export]
fn BraheApogeeAltitude(a: f64, e: f64) -> f64 {
    apogee_altitude(a, e)
}
