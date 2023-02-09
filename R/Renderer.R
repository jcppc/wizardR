#' Title
#'
#' @param assessment
#' @param number.of.questions
#' @param output.base.dir
#'
#' @return
#' @export
#'
#' @examples
render.assessments <- function( assessment, number.of.questions, output.base.dir) {

  entity <- assessment
  output.dir <- paste0(output.base.dir,"/",entity$university,"/")

  if (!dir.exists( output.dir )) {dir.create( output.dir )}

  #header <- system.file("rmd/frontpage.tex", package = "wizardR")
  #args <- pandoc_variable_arg("cover", system.file("rmd/cover.png", package = "wizardR"))

  for (i in 1:assessment$flavours) {

    rmarkdown::render( input = system.file("rmd", "Assessment.Rmd", package = "wizardR"),
                       params = list(brand = entity$brand,
                                     university = entity$university,
                                     doctitle = entity$class,
                                     file = entity$file,
                                     lecturer = entity$lecturer,
                                     linkedin = entity$linkedin,
                                     email = entity$email,
                                     role = entity$role,
                                     flavour = paste0("GROUP ", i),
                                     timestamp = entity$timestamp,
                                     subtitle = entity$assessment.name,
                                     questions = number.of.questions),
                       intermediates_dir = "./temp",
                       output_dir = output.dir,
                       output_file = paste0(entity$university,"-Group-",i,"-Exam-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
                       #includes = rmarkdown::includes(in_header = header),
                       #pandoc_args = args,
                       #run_pandoc = TRUE,
                       quiet=TRUE,
                       clean=TRUE
    )
  }


}

#' Title
#'
#' @param file
#' @param university
#' @param lecturer
#' @param linkedin
#' @param email
#' @param role
#' @param class
#' @param assessment.name
#' @param brand
#' @param flavours
#' @param questions.number
#' @param output.base.dir
#'
#' @return
#' @export
#'
#' @examples
render.assessments2 <- function( file, university, lecturer, linkedin, email, role, class, assessment.name, brand, flavours, timestamp, questions.number, output.base.dir) {

output.dir <- paste0(output.base.dir,"/",university,"/")

if (!dir.exists( output.dir )) { dir.create( output.dir ) }

#header <- system.file("rmd/frontpage.tex", package = "wizardR")
#args <- pandoc_variable_arg("cover", system.file("rmd/cover.png", package = "wizardR"))

for (i in 1:flavours) {

  rmarkdown::render( input = system.file("rmd", "Assessment.Rmd", package = "wizardR"),
    params = list(brand = brand,
                  university = university,
                  doctitle = class,
                  file = file,
                  lecturer = lecturer,
                  linkedin = linkedin,
                  timestamp = timestamp,
                  email = email,
                  role = role,
                  flavour = paste0("GROUP ", i),
                  subtitle = assessment.name,
                  questions = questions.number),
    intermediates_dir = "./temp",
    output_dir = output.dir,
    output_file = paste0(university,"-Group-",i,"-Exam-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
    #includes = rmarkdown::includes(in_header = header),
    #pandoc_args = args,
    #run_pandoc = TRUE,
    quiet=TRUE,
    clean=TRUE
  )
}


}


#' Title
#'
#' @param assessment
#' @param output.base.dir
#'
#' @return
#' @export
#'
#' @examples
render.solutions <- function( assessment, output.base.dir) {

  entity <- assessment
  output.dir <- paste0(output.base.dir,"/",entity$university,"/")

  if (!dir.exists( output.dir )) {dir.create( output.dir )}

  rmarkdown::render( input = system.file("rmd", "Solutions.Rmd", package = "wizardR"),
                     params = list(brand = entity$brand,
                                   university = entity$university,
                                   doctitle = entity$class,
                                   file = entity$file,
                                   lecturer = entity$lecturer,
                                   linkedin = entity$linkedin,
                                   email = entity$email,
                                   role = entity$role,
                                   flavour = "ALL GROUPS",
                                   subtitle = entity$assessment.name),
                     intermediates_dir = "./temp",
                     output_dir = output.dir,
                     output_file = paste0(entity$university,"-All-Groups-Exam-Answers-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
                     quiet=TRUE,
                     clean=TRUE
  )

}



#' Title
#'
#' @param file
#' @param university
#' @param lecturer
#' @param linkedin
#' @param email
#' @param role
#' @param class
#' @param assessment.name
#' @param brand
#' @param output.base.dir
#'
#' @return
#' @export
#'
#' @examples
render.solutions2 <- function( file, university, lecturer, linkedin, email, role, class, assessment.name, brand, output.base.dir ) {

  output.dir <- paste0(output.base.dir,"/",university,"/")

  if (!dir.exists( output.dir )) {dir.create( output.dir )}

rmarkdown::render( input = system.file("rmd", "Solutions.Rmd", package = "wizardR"),
    params = list(brand = brand,
                  university = university,
                  doctitle = class,
                  file = file,
                  lecturer = lecturer,
                  linkedin = linkedin,
                  email = email,
                  role = role,
                  flavour = "ALL GROUPS",
                  subtitle = assessment.name),
    intermediates_dir = "./temp",
    output_dir = output.dir,
    output_file = paste0(university,"-All-Groups-Exam-Answers-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
    quiet=TRUE,
    clean=TRUE
  )

}
