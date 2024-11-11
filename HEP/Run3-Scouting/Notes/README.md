# Notes

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
