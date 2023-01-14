\name{render.assessments}
\alias{render.assessments}
\title{Generate assessment documents based on a list of questions}
\usage{
assessment( input,
                   case_id = "case",
                   activity_id = "event",
                   timestamp = "completeTime",
                   output = ".",
                   graph_direction = "TB",
                   graph_palette = "Greens" )
}
\description{
Generate assessment documents based on a list of questions (using an Excel spreadsheet)
}

\examples{
library(fuzzymineR)

# Load the sample dataset
data("artificial_loan_process")
log <- as.data.frame( artificial_loan_process )
spot_fingerprints( log,
                   variant_id = "variant",
                   case_id = "case",
                   activity_id = "event",
                   timestamp = "completeTime",
                   output = ".",
                   export_variants = TRUE,
                   export_metrics = TRUE,
                   graph_direction = "TB",
                   graph_palette = "Greens" )
}
