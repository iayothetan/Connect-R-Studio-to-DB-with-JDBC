library(RJDBC)
library(rJava)
library(DBI)

# Connect to Vertica
dw <- config::get("vertica")
vertica <- dbConnect(JDBC(driverClass=dw$driverClass, classPath=dw$classPath), 
                     dw$server, dw$username, dw$password)


# Connect to Hive
dwh <- config::get("hive")

cp = c(dwh$commonDriver,
       dwh$standaloneDriver)
.jinit(classpath=cp)

hive <- dbConnect(JDBC(dwh$driverClass, 
                       dwh$classPath, 
                       identifier.quote='`'),
                  dwh$server, 
                  dwh$username, 
                  dwh$password)


# Load data
df_vertica <- dbGetQuery(vertica,
                         "select *
                          from my_db_vertica
                          limit 100")

df_hive <- dbGetQuery(hive,
                      "select *
                       from my_db_hive
                       limit 100")

