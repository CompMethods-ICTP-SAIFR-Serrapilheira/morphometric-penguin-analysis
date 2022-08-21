# morphometric-penguin-analysis
Adenilson Arcanjo de Moura Junior
<br><br>
Species prediction of penguins from Palmer Station region in Antarctica using morphometric data through machine learning methods.
<br><br>
Final project of Computational Methods Course under the supervision of Sara Mortara and Andrea Sánchez Tapia
<br><br>
August, 2022

## Project structure
```
project/
     ├── data/
     │   ├── raw
     │   └── processed
     ├── docs/
     ├── R/
     ├── outputs/
     │   └── figs/
     └── README.md
```
In `docs` you will find the report in PDF format, its LaTeX source code and a .bib file containing the references of the report.

## Requirements
This project was developed in `R` and uses the following packages:
<br>
`stringr`
`visdat`
`ggplot2`
`gridExtra`
`caret`

## Dataset
The raw data was collected and made available by Dr. Kristen Gorman and the Palmer Station, Antarctica.
The data was downloaded from `palmerpenguins` package and stored in `data/raw` to avoid inconsistencies.

## Instructions
In order to reproduce the work done follow the scripts in `R` in the correct order.<br>
More detailed information can be found in `docs/project_report.pdf`.