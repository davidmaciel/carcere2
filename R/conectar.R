conectar <- function(){
  DBI::dbConnect(odbc::odbc(),
                        Driver   = "PostgreSQL ODBC Driver(UNICODE)",
                        Server   = "localhost",
                        Database = "carcere",
                        UID      = rstudioapi::askForPassword("Database user"),
                        PWD      = rstudioapi::askForPassword("Database password"),
                        Port     = 5432,
                        Encoding = "UTF-8")
}
