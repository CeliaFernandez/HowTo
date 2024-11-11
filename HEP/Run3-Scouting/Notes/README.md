# Notes

## SM resonances appearing as background

### $K_S$ meson

We have the decays $K_S\rightarrow\pi^+\pi^-$ in which the pions are reconstructed as muons.

We have the $K^0(d\bar(s))$ and the $\bar{K}^0(s\bar(d))$ neutral kaons, but none of them are eigenstates of CP. The eigen states of the kaons are:

$$|K_S\rangle = |K_1\rangle = \dfrac{1}{\sqrt{2}}(|K^0\rangle - |\bar{K^0}\rangle) = \dfrac{1}{\sqrt{2}}(d\bar(s) - s\bar(d))$$

$$|K_L\rangle = |K_2\rangle = \dfrac{1}{\sqrt{2}}(|K^0\rangle + |\bar{K^0}\rangle) = \dfrac{1}{\sqrt{2}}(d\bar(s) + s\bar(d))$$

$K_L$ is long-lived ($8.9\cdot10^{-11}$ s), because it only decays to $3\pi$ states without violating CP, while $K_S$ is short-lived ($5.2\cdot10^{-8}$ s). However, we do see displaced $K_S$ due to the high velocities of these kaons.

### $\eta$ meson

### $\rho/\omega$ meson

### $\phi$ meson

The $\phi$ meson is a $s\bar{s}$ state with a mass of 1.019 GeV. It's not long-lived, with a lifetime of $1.55\cdot10^{-22}$ seconds, but it can be produced from $B$ or $D$ decays.

### $J/\psi$ meson

### $\Psi (2S)$ meson

### Upsilon

## Lifetime reweighting

A weight is applied to obtain a sample of a smaller lifetime from a one with a larger lifetime. The weight takes the form:

$$w(t) = \dfrac{c\tau_0}{c\tau_1} e^{(ct/c\tau_0 - ct/c\tau_1)}$$

where $ct$ is the generator-level event lifetime i.e. the time that it takes for the particle to decay in the particle's reference system. To compute it, we take the transverse component of the momentum.

First, we obtain the distance traveled by the LLP before decaying in the direction of movement:

$$L_{lab} = \dfrac{\vec{l_{xy}}\cdot\vec{p_T}}{p_T}$$

then, the time $t_{lab}$ (in the lab frame) is obtained by dividing this distance by $v_T$, the transverse velocity in which the particle is moving. In special relativity, this velocity relates with the momentum and the mass as $p_T = \gamma mv_T$, where $\gamma$ is the Lorentz factor. Then, in the lab frame:

$$t_{lab} = \dfrac{L_{lab}}{v_T} = (\vec{l_{xy}}\cdot\vec{p_T})\dfrac{\gamma m}{p_T^2}$$

this time, in the proper system of the particle $t$, relates as $t_{lab} = \gamma t$, therefore getting:

$$ct = (\vec{l_{xy}}\cdot\vec{p_T})\dfrac{m}{p_T^2}$$
