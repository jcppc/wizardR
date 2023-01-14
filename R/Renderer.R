

#schools = data.frame(university = c("Univ. Atlântica", "ISCTE-IUL","ISTEC"),
#                     brand = c("ua.jpg", "iscte.png", "istec.png"),
#                     email = c("jcaldeira@uatlantica.pt","jcppc@iscte-iul.pt","joaocarlos.caldeira@my.istec.pt"),
#                     role = c("Invited Professor","Assistant Professor","Adjunct Professor"),
#                     class = c("**Data Mining/Discovery Techniques**","**Process Mining**","**Engenharia de Software**"),
#                     exercise = c("Knowledge Assessment","Exam","1ª Avaliação (Parcial)"),
#                     file = c(1,2,4))
#
#school <- 3
#exam.flavours <- 4

render.assessments <- function( file, university, lecturer, email, role, class, assessment.name, brand, flavours, questions.number, output.base.dir) {

output.dir <- paste0(output.base.dir,"/",schools[school,]$university,"/")

if (!dir.exists( output.dir )) {dir.create( output.dir )}

for (i in 1:flavours) {

  rmarkdown::render( input = system.file("rmd", "Assessment.Rmd", package = "wizardR"),
    params = list(brand = schools[school,]$brand,
                  university = schools[school,]$university,
                  doctitle = schools[school,]$class,
                  file = schools[school,]$file,
                  email = schools[school,]$email,
                  role = schools[school,]$role,
                  flavour = paste0("GROUP ", i),
                  subtitle = assessment.name,
                  questions = questions.number),
    intermediates_dir = "./temp",
    output_dir = output.dir,
    output_file = paste0(schools[school,]$university,"-Group-",i,"-Exam-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
    quiet=TRUE,
    clean=TRUE
  )
}


}


render.solutions <- function( ) {

rmarkdown::render( input = system.file("rmd", "Solutions.Rmd", package = "wizardR"),
    params = list(brand = schools[school,]$brand,
                  university = schools[school,]$university,
                  doctitle = schools[school,]$class,
                  file = schools[school,]$file,
                  email = schools[school,]$email,
                  role = schools[school,]$role,
                  flavour = "ALL GROUPS",
                  subtitle = assessment.name),
    intermediates_dir = "./temp",
    output_dir = schools[school,]$university,
    output_file = paste0(schools[school,]$university,"-All-Groups-Exam-Answers-", format(Sys.time(), "%Y-%m-%d-%H-%M-%S"),".pdf"),
    quiet=TRUE,
    clean=TRUE
  )

}
