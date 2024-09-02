##########################################################
#
# Makefile for the Dual Fermion Perturbation Theory Code
#
##########################################################

DFPT_DIR = $(shell pwd)

# Fortran-Compilers, sequential and MPI
FC_SEQ = 
FC_MPI = 

ifndef FC_SEQ
  $(error "FC_SEQ" is not defined in the Makefile.)
endif

ifndef FC_MPI
  $(error "FC_MPI" is not defined in the Makefile.)
endif

# Compiler Flags
ifeq ($(FC_SEQ), gfortran)
  FC_FLAGS  = -m64 -Wall -O3 -funroll-loops -fallow-argument-mismatch
endif

ifeq ($(FC_SEQ), ifort)
  FC_FLAGS  = -m64 -warn all -O3 -unroll
endif

# Top directory of QUEST and the library
QUEST_DIR = 
DQMCLIB   = 

# BLAS/LAPACK (OpenBLAS or MKL) 
libOpenBLAS = 
LAPACKLIB = $(libOpenBLAS)

# Standard C++ library
CXXLIB = -lstdc++

# FFTW
FFTW_DIR = 
FFTW_INC = 
FFTW_LIB = 

ifndef QUEST_DIR
  $(error QUEST_DIR is not defined in the Makefile.)
endif

ifndef DQMCLIB
  $(error DQMCLIB is not defined in the Makefile.)
endif

ifndef LAPACKLIB
  $(error LAPACKLIB is not defined in the Makefile.)
endif

ifndef CXXLIB
  $(error CXXLIB is not defined in the Makefile.)
endif

ifndef FFTW_INC
  $(error FFTW_INC is not defined in the Makefile.)
endif

ifndef FFTW_LIB
  $(error FFTW_LIB is not defined in the Makefile.)
endif

# Summary of necessary libraries
LIB = $(CXXLIB) $(LAPACKLIB) $(FFTW_LIB)


# ------------------------------------------
export

all: 
	(mkdir bin)
	(cd SRC; $(MAKE))

.PHONY: clean

clean:
	(cd SRC; $(MAKE) clean)
	(cd bin; rm -f build_ref dfpt_mpi)
	(cd -rf bin)
