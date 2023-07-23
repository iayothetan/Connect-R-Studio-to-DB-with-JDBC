# Connect R Studio to DB with JDBC
In this example we will connect R Studio with Vertica and Hive, but you can do it with any kind of database you use.

1. First, you need to download jdbc drivers for database you want. Just google it like "jdbc driver for vertica download". Or download my examples (hive, vertica), but check versions.
2. Then install it and create config file, like in my example. Write your credentials and save config to your working directory.
3. <a href="https://www.java.com/download/ie_manual.jsp">Download</a> and install Java.
4. Install R packages for jdbc ("RJDBC", "rJava", "DBI")
5. In cases of locale errors (it happens very often) run Reboot_for_jdbc.R script. It might help.

For load your data use: <code>dbGetQuery(db_name_from_config, "your_sql_query")</code>
