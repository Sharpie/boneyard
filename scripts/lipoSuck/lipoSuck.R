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

for( lib in libFiles ){

  libsToAdd <- character(length( archDirs ))

  for( i in 1:length(libsToAdd) ){

    libsToAdd[i] <- list.files( archDirs[i], full = T )[
      list.files( archDirs[i] ) %in% basename( lib )
    ]

  }

  cat("Combining library:\n\t",
    lib,
    "\nWith:\n\t",
    paste( libsToAdd, collapse = "\n\t" ),
    "\n"
  )

  system(paste('lipo', lib, paste(libsToAdd, collapse=' '),
    '-create -output', lib))

}
