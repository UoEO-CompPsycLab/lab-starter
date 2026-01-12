# UoEO Computational Psychology Lab — lab-starter

This is the **canonical starter/template repo** for the **University of Essex Online (UoEO) Computational Psychology Lab**.

It supports a simple but “proper lab” workflow:

**simulate → fit → compare**  
…wrapped in the **GAME protocol** (**G**oals, **A**lgorithms, **M**easurements, **E**volution).

**What this repo is for**
- **Students:** fork this repo and complete a **replication exercise** (not your final dissertation project yet).
- **Supervisors:** use this repo as the stable, student-facing template that “just runs” in Colab.

> Supervisors: see the private org repo **`supervisor-resources`** for run-of-show, troubleshooting, and marking materials.

---

## Workshops (how this repo maps to the slide decks)

- **Workshop 1 — Paradigm + GAME + replication task**
- **Workshop 2 — Setup + Simulation** (Notebook 01)
- **Workshop 3 — Fitting + Model comparison** (Notebook 02)

Slides are in `/slides/`.

---
## What you do in each notebook (and what counts as “testing”)

### Notebook 01 — Simulate a learning agent (creates the data)
**File:** `notebooks/01_simulate_prediction_error.ipynb`

In this notebook you will:
- run a simple **prediction-error learning** model (delta-rule + softmax)
- set a few input values (e.g., reward probabilities for A/B, number of trials, **α** and **β**, random seed)
- generate a small dataset that looks like real behavioural data

**Outputs you should get**
- 1–2 plots showing learning (e.g., value estimates, choice probability, cumulative reward)
- a CSV dataset saved to: `data/dummy_bandit.csv`  
  (minimum columns: `trial`, `choice`, `reward`)

**What “testing” means here**
- sanity checks: do the plots change in sensible ways when you change **α** and **β**?

---

### Notebook 02 — Fit parameters + compare models (tests the model against data)
**File:** `notebooks/02_fit_and_compare.ipynb`

In this notebook you will:
- load `data/dummy_bandit.csv` (generated in Notebook 01)
- **fit α and β** by maximising log-likelihood (transparent grid search)
- compare the learning model against a **baseline** (e.g., random choice or biased coin)
- report the winner using **AIC** (lower is better)

**Outputs you should get**
- best-fit `α` and `β` values
- a results table saved to: `results/tables/model_comparison.csv`
- a simple check plot saved to: `results/figures/predicted_vs_observed.png`

**What “testing” means here**
- does the learning model explain choices better than a simpler baseline (fair comparison)?

---

### Using real data later (for dissertations)
For the replication task we use dummy data. For dissertation projects, you swap in a real dataset that can be converted into the same basic format:
- `trial`, `choice`, `reward` (plus optional `subject_id`, `block`, `condition`)

The same fit/compare workflow applies.

## Quickstart (students): fork → run → save → submit

## Student repo settings (quick guidance)

When you fork this repo, these are the defaults we recommend:

- **Visibility:** **Public** (recommended for the replication task)
  - This makes it easy for supervisors/markers to open your repo and run the notebooks in Colab.
  - If you keep it **Private**, you must **add your supervisor/marker as a collaborator** so they can access it.

- **.gitignore:** **Python**
  - A `.gitignore` tells Git what *not* to upload (temporary files like `__pycache__/` and `.ipynb_checkpoints/` that Colab/Jupyter creates).

- **README:** **On**
  - Keep a short README with your Colab links and what outputs you generated.

- **Licence:** optional for student repos
  - You can leave this as **No licence** for assessed work unless your supervisor asks you to add one.
---

### 1) Fork this repo
Click **Fork** (top right) to create your own copy under your GitHub account.

Recommended name: `comp-psych-replication-<your-initials>`.

### 2) Run Notebook 01 (simulate + generate dummy data)

**Notebook 01: `notebooks/01_simulate_prediction_error.ipynb`**

Open in Colab:
- https://colab.research.google.com/github/UoEO-CompPsycLab/lab-starter/blob/main/notebooks/01_simulate_prediction_error.ipynb

Run: **Runtime → Run all**

You should see learning plots and it should create:
- `data/dummy_bandit.csv`
- `results/figures/` (at least 1–2 `.png` plots)

### 3) Run Notebook 02 (fit + compare models)

**Notebook 02: `notebooks/02_fit_and_compare.ipynb`**

Open in Colab:
- https://colab.research.google.com/github/UoEO-CompPsycLab/lab-starter/blob/main/notebooks/02_fit_and_compare.ipynb

Run: **Runtime → Run all**

It should create:
- `results/tables/model_comparison.csv`
- `results/figures/predicted_vs_observed.png`

### 4) Save your work back to GitHub (important)
Colab runs in the cloud. Your outputs won’t automatically appear in your GitHub repo.

**Simple method (recommended): download + upload**
1. In Colab: **File → Download → .ipynb** (for each notebook)
2. In GitHub (your fork): go to `/notebooks/` → **Add file → Upload files** → upload the notebooks → **Commit changes**
3. Upload outputs too:
   - `data/dummy_bandit.csv`
   - `results/figures/*.png`
   - `results/tables/model_comparison.csv`

### 5) What to submit (Workshop 1 replication pack)
Submit **one link**: your forked repo URL **plus the commit hash** of your final commit.

Your repo must contain:
- A short reproducibility log: `reports/reproducibility_log.md`
- Your completed GAME worksheet (uploaded to `/reports/` or linked)
- Both notebooks updated in `/notebooks/` (run-all)
- `data/dummy_bandit.csv`
- 1–2 plots in `results/figures/`
- `results/tables/model_comparison.csv`

**Pass condition:** a supervisor can open your repo, click the Colab links, run **Runtime → Run all**, and reproduce your outputs.

---

## Open in Colab (badges)

Notebook 01 (simulate):
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/UoEO-CompPsycLab/lab-starter/blob/main/notebooks/01_simulate_prediction_error.ipynb)

Notebook 02 (fit + compare):
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/UoEO-CompPsycLab/lab-starter/blob/main/notebooks/02_fit_and_compare.ipynb)

---

## Repo layout (what lives where)

- `docs/` — GAME protocol + worksheet + quickstart guides + reading handouts  
- `notebooks/` — the two runnable Colab demos  
- `data/` — generated dummy dataset (and optional tiny fallback example)  
- `results/figures/` — saved plots  
- `results/tables/` — saved CSV tables (e.g., model comparison)  
- `reports/` — model spec + reproducibility log (+ optional checklist)  
- `slides/` — Workshop 1–3 decks  
- `src/` — optional: shared functions (fine to keep code in notebooks initially)

---

## What you’ll learn (in one sentence)
How to run a minimal computational modelling pipeline—**simulate behaviour**, **fit parameters**, and **compare models**—using the **GAME protocol** as the organising scaffold.

---

## Reproducibility note (why we’re strict about “Run all”)
This lab prioritises **rebuildable, checkable workflows** (not just “it runs on my machine”). Keep your repo simple, runnable, and explicit about assumptions.

Recommended best-practice reading:
Miłkowski, Hensel, & Hohol (2018). https://doi.org/10.1007/s10827-018-0702-z

---

## Troubleshooting (common fast fixes)

- **Imports failing in Colab:** re-run the first setup cell(s), then **Runtime → Run all** again.
- **No outputs saved:** check that the notebook creates folders and writes to `results/` and `data/`.
- **Baseline wins / AIC table looks odd:** that can be a valid outcome. Report what happened and why in `reproducibility_log.md`.
- **Grid search too slow:** use the default coarse grid settings provided.

---

## Licence
See `LICENSE`.

