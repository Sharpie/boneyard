#!/usr/bin/env Rscript --vanilla

args <- commandArgs( T )

libDir <- args[1]
archDirs <- args[-1] 

cat("\nModifying libraries in:\n\t", 
  libDir, '\n')

cat("\nCombining with libraries in:\n\t",
  paste( archDirs, collapse = '\n\t' ),
  '\n')

# Scan libDir for libraries.
libFiles <- list.files(libDir, full = T, 
  pattern = '(\\.a)$|(\\.dylib)$')

# Remove symlinks
libFiles <- libFiles[ !nzchar(Sys.readlink(libFiles)) ]

cat('\nThe following libraries have been targetted for modification:\n\t',
  paste( libFiles, collapse = '\n\t' ),
  '\n')
