# Microridge Curviness Analysis

This program takes pixel coordinate data from images of microridges and analyzes microridge 
curviness. Microridges are small ridges formed by actin protrusions on the surface of skin cells 
which are thought to function in mucus retention. These microridges are imaged on the surface 
of zebrafish skin cells by using LifeAct-GFP transgenic lines, making microridges 
fluorescent. Another member of the lab took these images and has a program that deconvolutes 
this data and turns it into a series of coordinates for each ridge. This program uses that 
existing data and returns an excel file containing a measure of curviness for each microridge.

### Introduction
Microridges are actin protrusions on the surface of skin cells. Our lab is interested in the development and function of these ridges in larval zebrafish. Images of ridges can be taken by labeling actin within the ridges with LifeAct-GFP, and imaging skin cells uing confocal microscopy. Some manipulations during development seem to increase the curviness of these ridges, so there was a need for an objective way to measure the "curviness" of the ridges of a cell. Therefore, I wrote the included scripts which output a meaure of curvature of each ridge, both as a simple function of the total ridge length divided by the distance between the start and end points of each ridge, and as the sum of the mathematical curvature at each point divided by the total length of the ridge.

Additional information and images can be found at the [lab website](https://www.mcdb.ucla.edu/Research/Sagasti/Sagasti_lab_home.html), under Projects/Skin cell morphogenesis.

###  Program Workflow

There are 3 main scripts included in this repository, along with a master script which can run the program in Hoffman2.

#### Concatenate.sh
This is a bash script which concatenates the input files. It also adds a new column at the beginning of the 

#### dk

#### dke
 
2. The other issue, once a more representative dataset is determined, is how to calculate curvature
from these pixels or lines.
* If all else fails, I could simply calculate the first and second derivative between points (instantaneous derivatives).
The second derivative itself should be a crude measure of curvature, but I can also use a formula
such as this (from [this website](http://tutorial.math.lamar.edu/Classes/CalcIII/Curvature.aspx)). This value for each point of the ridge would most likely be added and divided by ridge length:

<img src="https://github.com/hamarkovic/Microridge_Curviness_Analysis/blob/master/W6_curvature_fomula.png" width="50%">

### Program Usage

#### Requirements
You need to install these packages .  

I wrote the program using the 3.3.2 version of R.  

The data needs to be in the form of x and y coordinates of the pixels of the skeletonized ridge.

Additionally:
 * The data must be inputted in csv format.
 * There cannot be data files with identical names.
#### Usage Instructions
This is how to name the input files and how to run the program.  
#### Outputs
These are the outputs that the program will give.
#### Vignette
You should be able to run this on Hoffman; however, you would need to install many libraries, and it'll take too much time to do during discussion.
1. To run this test file, you first need to follow the directions for how to run the program, and install the required packages.
2. Change the input in the file Point_Simplifier.rmd (read.csv command) to be the file "Ridge5_test.csv" in the appropriate location on your computer.
3. Change the ouput of the file (write.csv command) to be in the apporpiate location on your computer.
4. Run the file Point_Simplifier in R.
5. The ouput will be the file "Points5.csv".
6. If you graph the points of the input and ouput, the input should look identical to the orange points in the file "Voronoi after Viz green.gif", and the output should look identical to the green points.

### Author
* Hannah Markovic
    * incoming Biology PhD student at the University of Oregon
    * B.S. in Molecular, Cell and Developmental Biology with minor in Biomedical Research, 
        expected June 2019, UCLA
    * contact: hmarkovi@uoregon.edu
* This program was created as the final project for the class EEB 177, Spring 2019, UCLA

### Acknowledgements
* Aaron van Loon - miroridge deconvolution program
* Aaron van Loon and Kaiser Atai - data
* Dr. Emily Curd and Daniel Chavez - guidance

### References
* https://stackoverflow.com/questions/9595117/identify-a-linear-feature-on-a-raster-map-and-return-a-linear-shape-object-using
* https://cran.r-project.org/web/packages/deldir/
* https://cran.r-project.org/web/packages/rgeos/
* https://cran.r-project.org/web/packages/sp/
* https://cran.r-project.org/web/packages/PairViz/
* https://cran.r-project.org/web/packages/TSP/
* https://rstudio-pubs-static.s3.amazonaws.com/202536_7a122ff56e9f4062b6b012d9921afd80.html
* http://tutorial.math.lamar.edu/Classes/CalcIII/Curvature.aspx
