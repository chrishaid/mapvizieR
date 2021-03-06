#' @title prep_roster
#'
#' @description
#' \code{prep_roster} a wrapper around several roster prep functions
#'
#' @param students_by_school one, or multiple (combined) NWEA MAP 
#' studentsbyschool.csv file(s).
#' @param kinder_codes alternative grade codes for kindergarten (e.g., "k",
#' "kinder", "Kinder") that need to be translated to grade 0.  Note that code "K" 
#' and 13 are already checked by \code{\link{standardize_kinder}}.   
#'
#' @return a prepped roster file
#' 
#' @export

prep_roster <- function(students_by_school, 
                        kinder_codes=NULL) {
  
  #df names
  roster <- roster_prep_names(students_by_school)
  #year prep stuff
  roster <- extract_academic_year(roster)
  # translate kindergarten ("K", 13, etc) to grade 0
  roster$grade <- standardize_kinder(roster$grade, other_codes = kinder_codes)
  #check that roster conforms to our expectations
  assert_that(check_roster(roster)$boolean)
  
  return(roster)
}



#' @title roster_prep_names
#'
#' @description
#' \code{roster_prep_names} turns the CamelCase names of a StudentsBySchool to lowercase.
#'
#' @inheritParams prep_roster
#' 
#' @return a roster with lowercase data frame names

roster_prep_names <- function(students_by_school) {
  return(lower_df_names(students_by_school))
}


