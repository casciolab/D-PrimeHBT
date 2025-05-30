# D-PrimeHBT
# 💓 Advanced d-prime (d′) Calculator for Heartbeat Detection Tasks in MATLAB

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![MATLAB](https://img.shields.io/badge/MATLAB-R2021+-blue.svg)](https://www.mathworks.com/)
[![Empirical Z-Scores](https://img.shields.io/badge/Z--Scores-Empirical-orange.svg)]()

A MATLAB toolbox for computing a **customized version of signal detection theory's d-prime (d′)**, specially designed for **heartbeat detection paradigms**.
This version utilizes **empirically-derived z-scores** based on the **pooled mean and standard deviation** from the entire dataset—avoiding the assumption of normality.

---

## ✨ Key Features

✅ Per-subject d′ computation
✅ Empirical z-score computation using pooled statistics  
✅ Flexible input structure for heartbeat and response times  
✅ Clean and modular MATLAB implementation

---

## 🧠 Motivation

Traditional d′ calculations rely on assumptions that may not hold in interoception research. Our approach better reflects task structure by:

### 🔍 Redefining Events Between Heartbeats

| Event Type               | Definition |
|--------------------------|------------|
| **Hit** 🟢               | A response **within** one heartbeat interval (first response only) |
| **Miss** 🔴              | No response in an interval |
| **False Alarm** ⚠️       | Additional responses beyond the first in an interval |
| **Correct Rejection** ✅ | Only one correct response in an interval |

We compute **d′ empirically** by standardizing hit and false alarm rates against the pooled mean and standard deviation from the full dataset—enhancing interpretability and robustness.

---

## 📦 Repository Structure
```text
├── compute_dprime_heartbeat.m # Main script for d' computation
├── zscore_empirical.m # Custom z-score function with pooled stats
├── example_data.mat # Sample data (heartbeat + response timings)
├── README.md
└── LICENSE
```
---
## 🧪 Input Format

### Example: Struct Array Format

```matlab
data(1).id = 'sub01';
data(1).heartbeats = [0.8, 1.6, 2.4, 3.2, 4.0];
data(1).responses  = [0.85, 1.7, 3.25];

data(2).id = 'sub02';
data(2).heartbeats = [...];
data(2).responses  = [...];

---
## 🚀 Getting Started
```matlab
### 1. Load Example Data
```matlab
load('example_data.mat'); % Contains heartbeat_times, response_times

results = compute_dprime_heartbeat(heartbeat_times, response_times);

Output Example:
 id       hits    misses    false_alarms    correct_rejections    d_prime
  ________   _____   ______    _____________   ____________________   _______
  'sub01'    3        1         2               2                     1.42
  'sub02'    4        0         1               3                     2.01

---
📐 How It Works
```matlab
🧮 Z-Score Function
The custom zscore_empirical.m computes z-values as:

    z = (x - pooled_mean) / pooled_std;

Where:
✅ p is each subject’s hit or FA rate,
✅ pooled_mean and pooled_std are derived from the distribution across all subjects, allowing d′ to reflect relative sensitivity.



---
📖 Citation
If this toolbox is useful in your research, please cite it:

@software{Dtectingthebeat,
  author = {Matias Fraile},
  title = {Advanced d-prime Calculator for Heartbeat Detection in MATLAB},
  year = {2025},
  url = {https://github.com/your-username/matlab-dprime-heartbeat},
}

🛡 License
Distributed under the MIT License. See LICENSE for more info.
