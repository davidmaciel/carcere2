conectar <- function(){
  DBI::dbConnect(odbc::odbc(),
                        Driver   = "PostgreSQL ODBC Driver(UNICODE)",
                        Server   = "localhost",
                        Database = "carcere",
                        UID      = Sys.getenv("userid"),
                        PWD      = Sys.getenv("password"),
                        Port     = 5432,
                        Encoding = "UTF-8")
}
