# State-Level Econometric Demand Elasticity & Multicollinearity Remediation

## 🎯 Problem
Estimating consumer commodity demand using observational state-level data frequently leads to distorted Ordinary Least Squares (OLS) regression models. High correlation between tax rates and retail prices, combined with aggregate population scale differences, introduces severe multicollinearity ($VIF$) and violates key classical linear regression model (CLRM) assumptions.

## 💡 Solution & Technical Architecture
Executed an iterative econometric analysis in R evaluating state-level tobacco demand (`CigarettesSW` dataset). Applied targeted feature engineering to uncouple embedded price variables and normalize scale differences, conducted rigorous diagnostic testing, and fitted log-log regression specifications to extract true constant price elasticity of demand[cite: 1].

* **Language & Environment:** R, RStudio[cite: 1]
* **Libraries:** `car` (VIF Diagnostics), `lmtest` & `sandwich` (Heteroskedasticity & Robust Standard Errors), `ggplot2` / `GGally` (Data Visualization)[cite: 1]
* **Core Methodology:** OLS Linear Regression, Feature Engineering, Multicollinearity Remediation ($VIF$), Residual Diagnostics (Shapiro-Wilk, Breusch-Pagan), Log-Log Price Elasticity Modeling[cite: 1]

## 🛠️ Key Econometric Features & Modeling Methodology
* **Scale Normalization & Feature Engineering:** Derived `personal.income` (`income / population`) to eliminate state population bias and uncoupled tax levies from gross price to isolate `net.price` (`price - tax`)[cite: 1].
* **Multicollinearity Remediation ($VIF$ Optimization):** Reduced Variance Inflation Factor ($VIF$) scores from severe collinearity levels down to baseline statistical thresholds using the `car` package[cite: 1].
* **Residual Diagnostics & Assumption Audits:** Conducted Shapiro-Wilk normality testing (`shapiro.test`) and visual residual analysis (Residuals vs. Fitted, Q-Q plots) to verify classical OLS assumptions[cite: 1].
* **Robust Statistical Inference:** Applied Breusch-Pagan heteroskedasticity tests and calculated White's Heteroskedasticity-Consistent (HC1) covariance matrices (`sandwich` / `coeftest`) to ensure unbiased standard errors[cite: 1].
* **Log-Log Elasticity Estimation:** Transformed continuous variables into log specifications (`log(packs) ~ log(net.price) + ...`) to extract constant price elasticity of demand directly from regression slope coefficients[cite: 1].

## 📁 Repository Structure
```text
├── src/
│   └── econometrics_analysis.R   # Iterative OLS models, transformations, and diagnostic tests
├── reports/
│   ├── model_comparison_table.pdf # Side-by-side regression summary table across model iterations
│   └── residual_diagnostics.png   # Exported diagnostic plots (Normality, Homoskedasticity)
└── README.md                      # Case study documentation
