This repository in its current state constitutes the Dual-Fermion Perturbation Theory 
code that is referred to in my PhD-Thesis. Developed by:

Edin Kapetanović (me) (ekapetan@physnet.uni-hamburg.de)

Alexander Lichtenstein (alichten@physnet.uni-hamburg.de)



A few notes for the compilation:

 - Compilers (both sequential and MPI) have to be specified at the top of the Makefile
 - Further below, the QUEST, LAPACK, standard C++ and the FFTW-libraries need to be specified
 
Afterwards, running "make" compiles the programs. The "test"-folder contains example input
files. Further details on how to use it are documented in my thesis.
