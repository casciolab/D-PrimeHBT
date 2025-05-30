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
├── zscore_pooled.m # Custom z-score function with pooled stats
├── README.md
└── LICENSE
```
---
## 🧪 Input Format

### Example: Struct Array Format

```
data(1).id = 'sub01';
data(1).heartbeats = [0.8, 1.6, 2.4, 3.2, 4.0];
data(1).responses  = [0.85, 1.7, 3.25];

data(2).id = 'sub02';
data(2).heartbeats = [...];
data(2).responses  = [...];
```

---
## 🚀 Getting Started
```
### 1. Load Data
% Example dataset for 2 subjects
data(1).id = 'subj01';
data(1).heartbeats = [0 1 2 3 4 5 6 7 8 9];   % Heartbeats every 1 second
data(1).responses = [0.8 2.1 3.1 5.2 5.8 7.9]; % Responses some inside heartbeat intervals

data(2).id = 'subj02';
data(2).heartbeats = [0 1.2 2.3 3.5 4.8 6 7.5 9]; 
data(2).responses = [0.5 1.3 2.6 3.7 5.1 6.8 7.7 8.8 9.5];

results = compute_dprime_heartbeat(data);
disp(results)

results =

  2×7 table
    id      heartbeats    hits   misses     false_alarms    correct_rejections    d_prime
  ________ ____________  _____   ______    _____________   ____________________   _______
  'sub01'       10         5        4            1                 4              -1.9507
  'sub02'        8         7        0            1                 6               0.87848
```
---
## 📐 How It Works
```
The custom zscore_empirical.m computes z-values as:

    z = (x - pooled_mean) / pooled_std;

Where:
✅ p is each subject’s hit or FA rate,
✅ pooled_mean and pooled_std are derived from the distribution across all subjects,
allowing d′ to reflect relative sensitivity.
```
---
## 📖 Citation
If this toolbox is useful in your research, please cite it:

@software{Dtectingthebeat,
  author = {Matias Fraile},
  title = {Advanced d-prime Calculator for Heartbeat Detection in MATLAB},
  year = {2025},
  url = {https://github.com/your-username/matlab-dprime-heartbeat},
}

🛡 License
Distributed under the MIT License. See LICENSE for more info.
