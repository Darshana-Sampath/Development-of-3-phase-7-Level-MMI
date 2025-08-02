 Scope of the Project/Aim
 The primary aim of this project is to design, model, and simulate a 7-level, 3-phase MMI that
 operates in grid-forming mode, acting as a stable voltage and frequency source within a
 microgrid environment. This project explores how a VVPWM strategy can be developed not
 only to generate high-quality sinusoidal AC output with low harmonic distortion, but also to
 integrate real-time capacitor voltage balancing within the modulation process. By achieving
 this, the project demonstrates how MMCs can be adapted to serve as local grid-forming units
 in decentralized power systems with a high share of renewables. The entire system is
 implemented and tested in MATLAB/Simulink, providing an accurate digital twin for
 verifying how the inverter responds to dynamic load conditions and varying power flows.
 
 Objectives
 The primary objective of this project was to design and develop a three-phase, 7-level
 Modular Multilevel Inverter (MMI) capable of supporting both grid-forming and grid following modes for a microgrid environment. To fulfil this aim, the following specific
 objectives were defined:
  To review and analyze existing multilevel inverter topologies and identify the most
 suitable structure for modular, scalable operation.
  To implement a VVPWM control strategy that enables precise output voltage
 synthesis with reduced THD.
  To develop a corner vector selection and dwell time calculation algorithm for
 optimal switching state generation.
  To apply a robust capacitor voltage balancing technique to maintain equal voltage
 sharing among submodules during continuous operation.
  To simulate the proposed inverter and control algorithms under varying load and
 grid conditions, verify output voltage stability, frequency accuracy, and dynamic
 performance.
  To design and construct a scaled-down hardware prototype incorporating key
 control, sensing, and isolation elements.
  To prepare the control algorithm for real-time implementation using a Texas
 Instruments: C2000 microcontroller platform.
  To lay the groundwork for future experimental validation and full-scale deployment
 in islanded or hybrid microgrid applications.
