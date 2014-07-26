# Identify functions that should not be tested, including quit(), q() and install.packages().
# Replace all occurences with commented function
clean_script <- function(file, message=FALSE){
  #   noRunFunctions <- c("quit", "q", "readClipboard", "install.packages", "update.packages")
  noRunFunctions <- c("quit", "q", "readClipboard", "RSiteSearch", "install.packages", "update.packages")
  ptn <- sprintf("^!( *#* *).*%s", paste0("(", noRunFunctions, "\\(", ")", collapse="|"))
  if(!file.exists(file)) stop("file doesn't exist")
  txt <- scan(file, what="character", sep="\n", quiet=TRUE)
  
  # Remove fancy quotes
  txt <- gsub("â€™", "'", txt, useBytes=TRUE)  ## fancy single quote
  
  # Remove hard space
  txt <- gsub("ï»¿", "", txt, useBytes=TRUE)  ## fancy single quote
  
  
  # Comment lines containing noRunFunctions
  idx <- grep(ptn, txt, perl=TRUE)
  if(length(idx) > 0) {
    txt[idx] <- paste("##", txt[idx], sep=" ")
    if(message){
      cat(txt[idx], sep="\n")
      cat(txt[idx], sep="\n")
    }
  }
  
  Encoding(txt) <- "ascii"
  
  txt
}

# clean_script("rfordummies/inst/scripts/1-orig/ch19.r")[1:3]


# Run clean_script for all scripts in inst/scripts, putting cleaned version in inst/cleanscripts
clean_all_scripts <- function(scriptPath, outPath, comment=TRUE, message=TRUE){
  if(!file.exists(scriptPath)) stop("script path doesn't exist")
  scripts <- normalizePath(list.files(scriptPath, pattern=".r$", full.names = TRUE))
  clean <- lapply(scripts, clean_script, message=message)
  ret <- sapply(seq_along(scripts), function(i){
    newFile <- file.path(outPath, basename(scripts[i]))
    if(message) message(newFile)
    txt <- paste(clean[[i]], collapse="\n")
    writeLines(txt, con=newFile)
    newFile
  })
  invisible(ret)
}

clean_all_scripts(scriptPath = "rfordummies/inst/scripts/1-orig", outPath = "rfordummies/inst/scripts/2-clean")



stitch_dummies <- function(scriptPath, htmlPath){
  require(knitr)
  if(!file.exists(scriptPath)) stop("script path doesn't exist")
  if(!file.exists(htmlPath)) stop("html path doesn't exist")
  scripts <- normalizePath(list.files(scriptPath, pattern=".r$", full.names = TRUE))
  wd <- getwd()
  on.exit(setwd(wd))
  setwd(htmlPath)
  for (scr in scripts){
    message(scr)
    stitch_rhtml(scr)
  }
}

stitch_dummies(scriptPath = "rfordummies/inst/scripts/2-clean", htmlPath="rfordummies/inst/scripts/3-html")
