# VERSION    = core or simp 
# SOLVERNAME = name of the SAT solver
# SOLVERDIR  = subdirectory of the SAT solver
# Minisat     = namespace of the SAT solver
# 
# e.g. minisat compilation with core version:
#
# VERSION    = core
# SOLVERNAME = "Minisat"
# SOLVERDIR  = minisat
# Minisat     = Minisat
#
VERSION    = core
SOLVERNAME = "Minisat2.2"
SOLVERDIR  = minisat2.2
NSPACE     = Minisat
LIB        = open-wbo
# THE REMAINING OF THE MAKEFILE SHOULD BE LEFT UNCHANGED
EXEC       = open-wbo
DEPDIR     = mtl utils core 
DEPDIR     +=  ../../encodings ../../algorithms ../../graph ../../classifier
MROOT      = $(PWD)/solvers/$(SOLVERDIR)
LFLAGS     += -lgmpxx -lgmp
CFLAGS     = -O3 -Wall -Wno-parentheses -std=c++11 -DNSPACE=$(Minisat) -DSOLVERNAME=$(SOLVERNAME) -DVERSION=$(VERSION)
ifeq ($(VERSION),simp)
DEPDIR     += simp
CFLAGS     += -DSIMP=1 
ifeq ($(SOLVERDIR),glucored)
LFLAGS     += -pthread
CFLAGS     += -DGLUCORED
DEPDIR     += reducer glucored
endif
endif
include $(MROOT)/mtl/template.mk
