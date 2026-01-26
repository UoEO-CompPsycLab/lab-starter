# UrbanRiskSquirrels — model spec (Baseline vs Model 1 vs Model 3)

## Aim (mechanistic question)
We test whether squirrels’ **risk sensitivity** changes with road proximity and acoustic disturbance.

Outcome is the within-pair contrast:

**ΔGUD = SafeGUD − RiskyGUD** (column: `GUDDiff`)

Higher ΔGUD means a larger safe–risky difference in giving-up density.

## Data
Source: `data/raw/squirrels/GUDdiffOutliersremoved.csv`

Grouping factor: `Site` (random intercept).

Predictors (z-scored before modelling):
- `Road` (distance to road) → `Road_z`
- `MeanDB` (mean noise) → `MeanDB_z`
- `VarDB` (noise variance) → `VarDB_z`

## Preprocessing
- Remove rows with missing values in outcome/predictors.
- Standardise continuous predictors (mean 0, SD 1).
- Create interaction terms:
  - `Road_z × MeanDB_z`
  - `Road_z × VarDB_z`

## Candidate models (mixed effects; random intercept by Site)

### Baseline (plain additive)
ΔGUD ~ Road_z + MeanDB_z + VarDB_z + (1 | Site)

Purpose: descriptive competitor with no mechanistic moderation.

### Model 3 (precision-weighted cue integration)
ΔGUD ~ Road_z + MeanDB_z + VarDB_z + Road_z:VarDB_z + (1 | Site)

Interpretation: noise variability changes how strongly road proximity is used as a cue affecting perceived risk.

### Model 1 (quitting threshold / cost decomposition)
ΔGUD ~ Road_z + MeanDB_z + VarDB_z + Road_z:VarDB_z + Road_z:MeanDB_z + (1 | Site)

Interpretation: perceived total cost is modulated by road proximity interacting with both mean noise and noise variability.

## Model evaluation
Primary: **grouped cross-validation by Site** (e.g., GroupKFold), reporting RMSE and MAE.

Secondary: in-sample fit statistics (log-likelihood, AIC, BIC).

Preference rule:
- choose the model with lower CV error;
- if Model 1 and Model 3 are similar, prefer Model 3 (simpler mechanism).

## Outputs (what the notebooks must save)
- `data/processed/squirrels/guddiff_processed.csv`
- `results/tables/squirrels_model_comparison.csv`
- `results/tables/squirrels_cv_scores.csv`
- `results/figures/squirrels_predicted_vs_observed.png`
- `results/figures/squirrels_interaction_plot.png`

