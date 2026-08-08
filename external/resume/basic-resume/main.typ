#import "resume.typ": *

// Put your personal information here, replacing mine
#let name = "Nacef Guessaymi"
#let location = "Pittsburgh, PA"
#let email = "nacefguess@hotmail.com"
#let github = "github.com/nacefguessaymi"
#let linkedin = "linkedin.com/in/nacef-guessaymi-b4291295"
#let orcid = "orcid.org/0000-0001-8459-6320"
//#let phone = "+1 (xxx) xxx-xxxx"
#let personal-site = "nacefguessaymi.com"
#let scholar = "scholar.google.com/citations?user=6fcKKiUAAAAJ&hl=en"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  //location: location,
  email: email,
  github: github,
  linkedin: linkedin,
  orcid: orcid,
  scholar: scholar,
  //phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
  font: "New Computer Modern",
  paper: "us-letter",
  author-position: left,
  personal-info-position: left,
)

/*
* Lines that start with == are formatted into section headings
* You can use the specific formatting functions if needed
* The following formatting functions are listed below
* #edu(dates: "", degree: "", gpa: "", institution: "", location: "", consistent: false)
* #work(company: "", dates: "", location: "", title: "")
* #project(dates: "", name: "", role: "", url: "")
* certificates(name: "", issuer: "", url: "", date: "")
* #extracurriculars(activity: "", dates: "")
* There are also the following generic functions that don't apply any formatting
* #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
* #generic-one-by-two(left: "", right: "")
*/
== Education

#edu(
  institution: "University of Pittsburgh and Carnegie Mellon University",
  location: "Pittsburgh, PA",
  dates: dates-helper(start-date: "Aug 2018", end-date: "Current"),
  degree: "PhD, Molecular Biophysics and Structural Biology",

  // Uncomment the line below if you want edu formatting to be consistent with everything else
  consistent: true
)
- Relevant Coursework: Molecular Biophysics, Neural Signal Processing, Computational Chemistry

#edu(
  institution: "Temple University",
  location: "Philadelphia, PA",
  dates: dates-helper(start-date: "Aug 2013", end-date:"May 2017"),
  degree: "Bachelor of Science, Biophysics",
)
- Relevant Coursework: Thermodynamics and Statistical Mechanics, Mathematical Physics

== Skills
- *Languages:* Python, MATLAB, Rust, SQL, Bash
- *Scientific Computing:* NumPy, SciPy, Pandas, Polars, OpenMM, RDKit
- *Machine Learning:* scikit-learn, XGBoost, model inference, descriptor-based prediction
- *Infrastructure:* Linux, SLURM, Docker/Singularity, Pixi, Conda, Git
- *Quantitative Methods:* Signal Processing, Statistical Modeling, Stochastic Simulation, Data Structures & Algorithms

== Work Experience

#work(
  title: "PhD Candidate",
  location: "Pittsburgh, PA",
  company: "University of Pittsburgh",
  dates: dates-helper(start-date: "August 2024", end-date: "Expected Dec 2026"),
)
- Developed Python-based scalable computational pipelines for molecular docking, simulation, and trajectory analysis
- Designed and implemented a modular OpenMM-based software package for reproducible biomolecular energy minimization
- Performed large-scale stochastic simulations using high-performance computing environments
#work(
  title: "Graduate Researcher",
  location: "Pittsburgh, PA",
  company: "Carnegie Mellon University",
  dates: dates-helper(start-date: "Jan 2022", end-date: "Aug 2024"),
)
- Built MATLAB control systems for synchronized optogenetic stimulation and electrophysiology acquisition
- Developed automated signal-processing and image-analysis pipelines for neural probe characterization
- Designed quantitative workflows for analyzing insertion-force mechanics in neural interfaces 

#work(
  title: "Scientist II",
  location: "Gaithersburg, MD",
  company: "Astrazeneca (Eurofins PSS)",
  dates: dates-helper(start-date: "Jan 2021", end-date: "Jan 2022"),
)
- Performed high-throughput quantitative analysis and validation of biologic therapeutic assays under GMP standards
- Processed and analyzed large experimental datasets for accelerated COVID-19 therapeutic programs
#work(
  title: "Graduate Researcher",
  location: "Pittsburgh, PA",
  company: "Carnegie Mellon University",
  dates: dates-helper(start-date: "Jun 2019", end-date: "Jan 2021"),
)
- Extracted motion features from live-cell microscopy using MATLAB image tracking
- Extracted and analyzed cellular motion features to characterize force-dependent responses under cytoskeletal perturbations

#work(
  title: "Undergraduate Researcher",
  location: "Philadelphia, PA",
  company: "Temple University",
  dates: dates-helper(start-date: "Apr 2015", end-date: "Aug 2018"),
)
- Quantified single-molecule motion from live-cell imaging using MATLAB diffusion and MSD analysis
- Reconstructed 3D spatial maps from PSF localization data using Amira

== Projects

#project(
  name: "Amyloid Fibril Inhibitor Virtual Screening",
  dates: "2024 – Present",
)
- Screened a compound library against a protein target, ranking candidates by neural-network scores
- Applied clustering and dimensionality reduction (HDBSCAN, UMAP) to assess library diversity and screening convergence
#strong[Stack:] Python, RDKit, Gnina, Polars, scikit-learn

#project(
  name: "Amyloid Molecular Dynamics Simulation",
  dates: "2024 – Present",
)
- Large-scale stochastic simulation; optimized simulation parameters, random initial conditions, and automated topology generation
- Built checkpoint/restart tooling to resume long-running trajectories
#strong[Stack:] Python, AMBER (pmemd), AmberTools, MDAnalysis, Ray, SciPy

#project(
  role: "Contributor",
  name: "AqSolPred-web",
  url: "github.com/nacefguessaymi/AqSolPred-web",
)
- Refactored an aqueous-solubility prediction model into a deployable web application for batch inference
#strong[Stack:] Python, scikit-learn, XGBoost
