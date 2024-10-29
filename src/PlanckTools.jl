planck() = print("Build some Planck tools...")

const c = 2.9979e8;  # speed of light
const h = 6.626e-34; # Planck constant
const k = 1.38e-23;  # Boltzmann const

const c1 = 2 * h * c^2 * 1e11;
const c2 = (h * c / k) * 100;

bt_single(nu, rad) = c2 * nu / log(1 + (c1 * nu^3 / rad));
