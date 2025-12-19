# Thermal-System-Identification-RealData

**Project Overview: Identification of a Heating System using Real-World Data**
Mathematical modeling is the foundation of control design. This project focuses on **Black-Box Modeling** of a thermal heating system using experimental input-output data. The objective is to derive a mathematical relationship that accurately predicts the system's temperature response to power inputs.

**Methodology:**

* **Data Acquisition:** Experimental data sampled at a rate of 2 seconds.
* **Preprocessing:** Data cleaning and detrending to remove biases and improve model fit.
* **Modeling Techniques:**
1. **Subspace Identification (4SID):** A state-space approach reaching a 91.56% fitness level.
2. **ARMAX Modeling:** An Auto-Regressive Moving Average with Exogenous Input model, achieving an 89.43% fitness level.


* **Validation:** Models were validated using pole-zero maps to ensure stability and residual analysis (correlation tests) to ensure the model captured all system dynamics.

