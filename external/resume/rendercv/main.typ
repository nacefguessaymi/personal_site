// Import the rendercv function and all the refactored components
#import "@preview/rendercv:0.2.0": *

// Apply the rendercv template with custom configuration
#show: rendercv.with(
  name: "Nacef Guessaymi",
  footer: context { [#emph[Nacef Guessaymi -- #str(here().page())\/#str(counter(page).final().first())]] },
  top-note: [ #emph[Last updated in July 2026] ],
  locale-catalog-language: "en",
  page-size: "us-letter",
  page-top-margin: 0.7in,
  page-bottom-margin: 0.7in,
  page-left-margin: 0.7in,
  page-right-margin: 0.7in,
  page-show-footer: false,
  page-show-top-note: true,
  colors-body: rgb(0, 0, 0),
  colors-name: rgb(0, 0, 0),
  colors-headline: rgb(0, 0, 0),
  colors-connections: rgb(0, 0, 0),
  colors-section-titles: rgb(0, 0, 0),
  colors-links: rgb(0, 0, 0),
  colors-footer: rgb(128, 128, 128),
  colors-top-note: rgb(128, 128, 128),
  typography-line-spacing: 0.6em,
  typography-alignment: "justified",
  typography-date-and-location-column-alignment: right,
  typography-font-family-body: "New Computer Modern",
  typography-font-family-name: "New Computer Modern",
  typography-font-family-headline: "New Computer Modern",
  typography-font-family-connections: "New Computer Modern",
  typography-font-family-section-titles: "New Computer Modern",
  typography-font-size-body: 10pt,
  typography-font-size-name: 25pt,
  typography-font-size-headline: 10pt,
  typography-font-size-connections: 10pt,
  typography-font-size-section-titles: 1.2em,
  typography-small-caps-name: false,
  typography-small-caps-headline: false,
  typography-small-caps-connections: false,
  typography-small-caps-section-titles: false,
  typography-bold-name: false,
  typography-bold-headline: false,
  typography-bold-connections: false,
  typography-bold-section-titles: true,
  links-underline: true,
  links-show-external-link-icon: false,
  header-alignment: center,
  header-photo-width: 3.5cm,
  header-space-below-name: 0.7cm,
  header-space-below-headline: 0.7cm,
  header-space-below-connections: 0.7cm,
  header-connections-hyperlink: true,
  header-connections-show-icons: false,
  header-connections-display-urls-instead-of-usernames: true,
  header-connections-separator: "|",
  header-connections-space-between-connections: 0.5cm,
  section-titles-type: "with_full_line",
  section-titles-line-thickness: 0.5pt,
  section-titles-space-above: 0.5cm,
  section-titles-space-below: 0.3cm,
  sections-allow-page-break: true,
  sections-space-between-text-based-entries: 0.15cm,
  sections-space-between-regular-entries: 0.42cm,
  entries-date-and-location-width: 4.15cm,
  entries-side-space: 0cm,
  entries-space-between-columns: 0.1cm,
  entries-allow-page-break: false,
  entries-short-second-row: false,
  entries-summary-space-left: 0cm,
  entries-summary-space-above: 0.08cm,
  entries-highlights-bullet:  text(13pt, [•], baseline: -0.6pt) ,
  entries-highlights-nested-bullet:  text(13pt, [•], baseline: -0.6pt) ,
  entries-highlights-space-left: 0cm,
  entries-highlights-space-above: 0.08cm,
  entries-highlights-space-between-items: 0.08cm,
  entries-highlights-space-between-bullet-and-text: 0.3em,
  date: datetime(
    year: 2026,
    month: 7,
    day: 7,
  ),
)


= Nacef Guessaymi

#connections(
  [Pittsburgh, PA],
  [#link("mailto:nag81@pitt.edu", icon: false, if-underline: true, if-color: true)[nag81\@pitt.edu]],
  [#link("https://www.linkedin.com/in/nacef-guessaymi-b4291295/", icon: false, if-underline: true, if-color: true)[linkedin]],
  [#link("https://github.com/nacefguessaymi", icon: false, if-underline: true, if-color: true)[GitHub]],
)


== Education

#education-entry(
  [
    #strong[University of Pittsburgh], PhD in Molecular Biophysics and Structural Biology -- Pittsburgh, PA
    
  ],
  [
    Sept 2018 – Present
    
  ],
  main-column-second-row: [
    - Advisor: Dr. Jacob D. Durrant
  ],
)

#education-entry(
  [
    #strong[Temple University], BS in Biophysics -- Philadelphia, PA
    
  ],
  [
    Sept 2013 – May 2017
    
  ],
  main-column-second-row: [
    - Advisor: Dr. Weidong Yang
  ],
)

== Experience

#regular-entry(
  [
    #strong[PhD Candidate], University of Pittsburgh -- Pittsburgh, PA
    
  ],
  [
    Feb 2024 – Present
    
  ],
  main-column-second-row: [
    - Developed Python-based #emph[scalable] computational pipelines for molecular docking and simulation, enabling #emph[high-throughput] screening and #emph[automated] trajectory analysis

    - Designed and implemented a #emph[modular] Python-based software package for biomolecular energy minimization using OpenMM, enabling #emph[reproducible and streamlined] simulation workflows
    
    - Performed #emph[large-scale] structure-based virtual screening using Gnina targeting a #emph[Staphylococcus aureus] functional fibril protein to identify modulators of amyloid assembly and biofilm formation
    
    - Conducted molecular dynamics simulations using AMBER Force Fields to characterize conformational transitions from α-helical monomers to β-sheet fibril states
    
    - Led a structure-based virtual screening campaign using Gnina against essential bacterial proteins in #emph[Staphylococcus aureus] for antimicrobial discovery    
  ],
)

#regular-entry(
  [
    #strong[Graduate Student Researcher], Carnegie Mellon University -- Pittsburgh, PA
    
  ],
  [
    Jan 2022 – Sep 2024
    
  ],
  main-column-second-row: [
    - Built a MATLAB-based control system for #emph[automated] optogenetic stimulation and electrophysiological recording coordinating experimental workflow in live-animal and patch-clamp setups
    
    - Developed Javascript-based #emph[automated] pipelines for tissue histology analysis, #emph[improving efficiency] and reproducibility of post-implantation assessments

    - Designed MATLAB-based #emph[automated] experimental workflows to quantify insertion forces of neural probes, enabling #emph[systematic characterization] of mechanical interactions with tissue

    - Investigated substrate-induced damage in neural probes, evaluating the impact of material properties on neural tissue integrity
    
    - Tested Parylene-C optical waveguides for use as implantable optogenetic interfaces

      - Co-authored a peer-reviewed conference proceeding in Proceedings of SPIE (Photonics West, 2023) on implantable optogenetic waveguides

    - Demonstrated the feasibility of integrated optical stimulation using flexible, biocompatible probe platforms

    - Performed device characterization and validation, including optical and structural performance assessments

  ],
)

#regular-entry(
  [
    #strong[Bioassay Development Scientist II], Eurofins PSS -- Gaithersburg, MD
    
  ],
  [
    Jan 2021 – Jan 2022
    
  ],
  main-column-second-row: [
    - Contributed to #emph[high-throughput] sample processing and data analysis, ensuring data quality and reproducibility
    
    - Performed bioassay development and validation for biologic therapeutics in a regulated laboratory environment
    
    - Conducted testing and analysis of monoclonal antibody candidates, including RSV and SARS-CoV-2 programs
    
    - Supported COVID-19 vaccine and therapeutic development efforts under accelerated timelines

      - Recognized with a Superlative Service Award for contributions to COVID-related testing efforts
    
    - Executed cell-based and biochemical assays to assess potency, activity, and stability of drug candidates
    
    
  ],
)

#regular-entry(
  [
    #strong[Graduate Student Researcher], Carnegie Mellon University -- Pittsburgh, PA
    
  ],
  [
    June 2019 – Sep 2020
    
  ],
  main-column-second-row: [
    - Designed and performed experiments to quantify cellular responses to mechanical stimuli

    - Analyzed relationships between mechanical environment and cell fate decisions

    - Investigated cellular mechanosensitivity, focusing on how mechanical forces regulate cell behavior and differentiation

      - Analyzed imaging data using an in-house computational pipeline to quantify mechanical responses

    - Transfected cells with ROCK2 deletion constructs to modulate cytoskeletal contractility and investigate effects on cellular stiffness
    
    - Studied force-dependent neural differentiation in starfish as a model system for mechanoregulation

      - Performed confocal microscopy imaging to track cellular and nuclear dynamics for force estimation
    
  ],
)

#regular-entry(
  [
    #strong[Undergraduate Researcher], Temple University -- Philadelphia, PA
    
  ],
  [
    April 2015 – Aug 2018
    
  ],
  main-column-second-row: [
    - Designed and implemented a MATLAB-based mean squared displacement (MSD) #emph[automated] analysis pipeline to quantify diffusion dynamics of FG-nups

    - Characterized FG-nup dynamics and nuclear pore gating mechanisms through #emph[integrated] imaging and computational analysis

    - Performed live-cell super-resolution microscopy to investigate the dynamics of nuclear pore complex (NPC) FG-nucleoporins
    
    - Assessed protease (3C)-mediated depletion of FG-nups to study their role in nucleocytoplasmic transport

    - Co-authored multiple conference abstracts (Biophysical Journal, Molecular Biology of the Cell) and a pre-print currently under review
    
  ],
)

== Publications

#regular-entry(
  [
    #strong[Small Molecule Drugs Targeting _S. aureus_]
    
  ],
  [
    _in preparation_
    
  ],
  main-column-second-row: [

  #strong[Guessaymi N. M.], Durrant J., et al 

  ],
)



#regular-entry(
  [
    #strong[Small Molecule Inhibitors for Functional Amyloids]
    
  ],
  [
    _in submission_
    
  ],
  main-column-second-row: [

  #strong[Guessaymi N. M.], Byeon C. H., Tunc A., Rempuszewski J. J., Hansen K. H., Maldonado A. M., Urish K., Andreasen M., Durrant J., Akbey Ü 

  ],
)


#regular-entry(
  [
    #strong[Structural and functional diversity of cerebrospinal fluid-derived α-synuclein fibrils in Parkinson’s disease and multiple system atrophy]
    
  ],
  [
    _under revision_
    
  ],
  main-column-second-row: [

  Gram H., Ollier C., Hansen K. H., Marchand T. L., Byeon C. H., Tunc A., #strong[Guessaymi N. M.], Drace, T., Boggild A., Hermansholm A. K. R., Jorgensen T. J. D., Boesen T., Pintacuda G., Jensen P. H., Akbey Ü. 

  (Nature Communications, Submitted 10th March, 2026)

  ],
)

#regular-entry(
  [
    #strong[Exploring cellular gateways: unraveling the secrets of disordered proteins within live nuclear pores]
    
  ],
  [
    Feb 2024
    
  ],
  main-column-second-row: [
    Yu W., Tingey M., Kelich J. M., Li Y., Yu J., Junod S. L., Jiang Z., Hansen I., #strong[Guessaymi N.], Yang W.
    
    #link("https://doi.org/10.21203/rs.3.rs-3504130/v1")[10.21203/rs.3.rs-3504130/v1] (Nature Portfolio 2024)
    
  ],
)

#regular-entry(
  [
    #strong[In vivo optogenetic stimulation using Parylene photonic waveguides for light delivery]
    
  ],
  [
    March 2023
    
  ],
  main-column-second-row: [
    Reddy J. W., Jain V., #strong[Guessaymi N.], Malekoshoaraie M. H., Chamanzar M.
    
    #link("https://doi.org/10.1117/12.2651613")[10.1117/12.2651613] (Proceedings of SPIE, Vol. 12366, SPIE Photonics West (2023))
    
  ],
)

== Conference Abstracts & Posters

#regular-entry(
  [
    #strong[Mapping intrinsically disordered proteins in live cells by high-speed super-resolution light microscopy]
    
  ],
  [
    Feb. 2024
    
  ],
  main-column-second-row: [
    Yu W., Tingey M., Kelich J., Li Y., Yu J., Junod S. L., Jiang Z., Hansen I., #strong[Guessaymi N.], et al.
    
    #link("https://doi.org/10.1016/j.bpj.2023.11.500")[10.1016/j.bpj.2023.11.500] (Biophysical Society)
    
  ],
)
#regular-entry(
  [
    #strong[Parylene Photonic Neural Probes for Minimally invasive High-resolution Optogenetic Stimulation]
    
  ],
  [
    June 2023
    
  ],
  main-column-second-row: [
    #strong[Guessaymi N. M.], Jain V., Malekoshoaraie M. H., Sarna K., Reddy J. W., Chamanzar M.
    
    10th Annual Brain Initiative Meeting (2023)
    
  ],

)
#regular-entry(
  [
    #strong[Complete 3D mapping of FG domains for all eleven FG-Nups in living cell NPCs using super-resolution microscopy.]
    
  ],
  [
    Jan 2017
    
  ],
  main-column-second-row: [
    Yu J., Kelich J., Li Y., Kim J., #strong[Guessaymi N.], Klein M., & Yang W. 
    
    Molecular Biology of The Cell (2017)
    
  ],
)

== TALKS & PRESENTATIONS
#regular-entry(
  [
    #strong[Computer-Aided Drug Design of S. Aureus Functional Fibril Inhibitors]
    
  ],
  [
    May 2026
    
  ],
)


#regular-entry(
  [
    #strong[In vivo optogenetic stimulation using Parylene photonic waveguides for light delivery]
    
  ],
  [
    Jan 2023
    
  ],
)

== Selected Honors

- Brain Initiative Trainee Highlight Award (2023)

- Superlative Service (2021)


== Skills

#strong[Languages:] Python, Rust, MATLAB, Javascript

#strong[Computational Chemistry & Molecular Modeling:] OpenMM, RDKit, AMBER, Gnina, Boltz, Chai

#strong[Electrophysiology & Signal Processing:] Spike sorting (custom software development), Kilosort, Plexon, Axon, Intan

#strong[Data Science & Scientific Computing:] Pandas, Polars, NumPy, SLURM

#strong[Image Analysis:] OpenCV

#strong[Infrastructure & High-Performance Computing:] SQL, Zarr

#strong[Research Expertise:] Molecular Biophysics, Structural Biology, Computer-Aided Drug Design, Computational Pipeline Development, Electrophysiology, Image Analysis, Signal Processing, High-Performance Computing

