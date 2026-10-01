```markdown
# State-Level Econometric Demand Elasticity & Multicollinearity Remediation

## 🎯 Problem
Estimating commodity consumer price elasticity using observational state-level data frequently leads to distorted OLS regression models. Severe multicollinearity between tax rates and gross retail prices, alongside population scale differences, inflates coefficient variance and violates fundamental regression assumptions[cite: 1].

## 💡 Solution & Technical Architecture
Executed an iterative econometric analysis in R evaluating state-level cigarette demand (`CigarettesSW` dataset)[cite: 1]. Applied targeted feature engineering to resolve multicollinearity ($VIF$), verified residual normality, and constructed log-log models to extract true price elasticity of demand[cite: 1].

* **Language & Tools:** R, RStudio[cite: 1]
* **Libraries:** `car` (VIF), `lmtest` & `sandwich` (Heteroskedasticity Testing & Robust SE), `ggplot2` (Diagnostics)[cite: 1]
* **Econometric Focus:** OLS Linear Regression, Multicollinearity Remediation, Residual Diagnostics (Shapiro-Wilk, Breusch-Pagan), Price Elasticity Estimation[cite: 1]

## 🔬 Iterative Refinement Process
* **Baseline OLS Model:** Fit initial model (`packs ~ price + income + tax`), revealing high Variance Inflation Factor ($VIF$) values due to embedded tax within retail price[cite: 1].
* **Feature Engineering:**
  * Derived `personal.income` (`income / population`) to eliminate state size distortion[cite: 1].
  * Isolated `net.price` (`price - tax`) to uncouple baseline commodity cost from state-level taxation[cite: 1].
* **Diagnostic Verification:** Evaluated residual plots, conducted Shapiro-Wilk normality checks, and tested for constant error variance[cite: 1].
* **Log-Log Elasticity Model:** Transformed features into log scale to measure percentage-based demand sensitivity directly from regression coefficients[cite: 1].

## 📁 Repository Structure
```text
├── src/
│   └── econometrics_analysis.R   # Complete R regression pipeline
├── reports/
│   └── model_comparison_table.pdf # Consolidated OLS iteration summary table
└── README.md                     # Project documentation
