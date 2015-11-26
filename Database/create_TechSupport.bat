@ECHO off

:: batch file for
:: Murach's ASP.NET 4.5 Web Programming with C# 2012
:: company: Mike Murach & Associates, Inc.
:: date:    July 30, 2013
:: 
:: Uses SQLCMD utility to run a SQL script that creates
:: the TechSupport database.

ECHO Attempting to create the TechSupport database . . . 
sqlcmd -S localhost\SQLExpress -E /i create_TechSupport.sql
ECHO.
ECHO If no error message is shown, then the database was created successfully.
ECHO.
PAUSE