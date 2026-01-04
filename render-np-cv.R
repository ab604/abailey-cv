# Script for individual pdfs

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv-np-2025-01-04.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown - EMBL CV ordering
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = glue::glue('abailey-cv-2025-01-04.pdf'))
