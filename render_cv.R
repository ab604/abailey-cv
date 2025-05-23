# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

library(lubridate)

# Knit the HTML version
rmarkdown::render("cv-2024-08-11.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = glue::glue('cv.html'))# Knit the HTML version

# Knit the HTML version - General CV order
# rmarkdown::render("cv.rmd",
#                   params = list(pdf_mode = FALSE),
#                   output_file = glue::glue('alistair-bailey-cv-{today()}.html'))


# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv-2024-08-11.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown - EMBL CV ordering
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = glue::glue('bailey_cv.pdf'))

# fs::file_copy(glue::glue('alistair-bailey-cv-{today()}.pdf'),
#               '../academic-website-2021/content/cv/bailey_cv.pdf',
#               overwrite = TRUE)

# fs::file_copy(glue::glue('alistair-bailey-cv-{today()}.html'),
#               '../academic-website-2021/content/cv/cv.html',
#               overwrite = TRUE)

# Knit the PDF version to temporary html location - General CV order
#tmp_html_cv_loc <- fs::file_temp(ext = ".html")
#rmarkdown::render("cv.rmd",
#                  params = list(pdf_mode = TRUE),
#                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
#pagedown::chrome_print(input = tmp_html_cv_loc,
#                       output = 'bailey_cv.pdf')
#
