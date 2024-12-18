# CS157A-team8

## Author names: Alex Luong, Guadalupe Ramirez Lara, Annie Luu, Harold Chu

## Purpose of the Project
Our project was modeled on the idea of an animal adoption center as a database application. This application works as a centralized database that unifies and stores pet information in one place, so that pets everywhere have a chance at being adopted. The main goal of this project was to create an application that allows admin users to manage animals in the database, and for potential adopters to adopt available pets.

## Project Implementation Section: Procedures to Set Up and Run the System
This project uses a 3-tier architecture to run; you will need to set up the code on your IDE, download Tomcat to run on your local server, and have MySQLWorkbench to successfully run the project on your system.

Step 1: To set this project up in your system, first unzip the "Team8_Project.zip" where the source code will be found. Alternatively, pull the source code directly from the "CS157A-team8" Github repository. The folder titled "Source Code" will be the main project folder. Import that to the IDE you are using to view the project; this project was implemented using Eclipse.

Step 2: After the project is imported, it is important to follow these steps to set up your MySQLWorkbench from https://www.mysql.com/products/workbench/ and also install the MySQL server from https://dev.mysql.com/downloads/mysql/. Also install the MySQL connector 9.0 as a jar file from https://dev.mysql.com/downloads/connector/j/?os=26.

Step 3: After the project is imported, the next step is to set up Tomcat to run on your local server. You can do this by downloading Tomcat on your local machine, or directly through Eclipse. We will discuss both ways:

To set up Tomcat on your local machine, follow the steps below:
For MacOS: Go to https://tomcat.apache.org/ and select Tomcat 9, then download the Core zip file under Binary Distributions. After selecting a directory and unzipping, open a terminal window and cd into the bin folder of the tomcat folder. Inside the bin directory, give executable permission to the .sh files with the command "chmod +x *.sh" To startup your Tomcat server, use the command "./startup.sh" and open a browser window and search "localhost:8080". To stop your Tomcat server, use the command "./shutdown.sh" and the browser window will show an error message.
To set up Tomcat on your IDE, follow the steps below: For Eclipse: In your project build path, navigate to Targeted Runtimes. Ensure Apache Tomcat v9.0 is checked, if it is not, click on "New" and follow the prompts to download Apache Tomcat v9.0 to your Server Runtime Environment. Also, while in the BuildPath configurations, please ensure to add the mysql-connector-j-9.0.0 jar (downloaded from step 2) into the Libraries, as you might have issues running the project without it.

Step 4: After this, open up your MySQLWorkbench and follow the prompt to make a local instance connector. After opening this connector, click on the button to make a new schema that will hold the dump for this project, title it "petquery". Import the petquery_dump.sql file found in the repository (also found in the zip file) to the database. Here, you can see the updates made to the database by making queries.

Step 5: Finally, the last step is to edit the code to correctly connect to your database. Back in Eclipse (or your preferred IDE), open the src/main directory and open the resources folder. In the "db.properties" file, update all of the necessary information to match your connector from the MySQLWorkbench database to match your database.

## After these steps, the project should be set up and run properly on your system.
