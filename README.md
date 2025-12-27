# Richkware-Manager-Server

[![Build Status](https://travis-ci.org/richkmeli/Richkware-Manager-Server.svg?branch=master)](https://travis-ci.org/richkmeli/Richkware-Manager-Server)
[![](https://jitpack.io/v/richkmeli/Richkware-Manager-Server.svg)](https://jitpack.io/#richkmeli/Richkware-Manager-Server)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e246694691aa4a44b2aa5008b74e61ef)](https://app.codacy.com/app/richkmeli/Richkware-Manager-Server?utm_source=github.com&utm_medium=referral&utm_content=richkmeli/Richkware-Manager-Server&utm_campaign=Badge_Grade_Dashboard)


Service for the management of hosts in which is present an instance of malware developed using **Richkware** framework.

![](https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/GUI/RMS/RMS.png)

## Implementation

RMS has been developed following the REST principles; the following table shows which HTTP methods have been used for each servlet.

|  HTTP methods  | GET | POST | PUT | DELETE |
|--------------|:----:|:---:|:---:|:------:|
| device | x | | x | x |
| user | x | | | x |
| devices | x | | | x |
| users | x | | | |
| encryptionKey | x | | | |


## Related Projects

[Richkware](https://github.com/richkmeli/Richkware): Framework for building Windows malware.

[Richkware-Manager-Client](https://github.com/richkmeli/Richkware-Manager-Client): Client of **Richkware-Manager-Server**, that it obtains the list of all hosts from the server and it's able to send any kind of commands to them.

![](https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/Diagram/RichkwareDiagram1.2.png)

## Requirements
These are the base requirements to build and use Richkware:
 
 -   **Java 11** or higher
 -   MySQL (only if running without Docker)
 
 ## Get Started
 
 ### Using Docker (Recommended)
 
 You can build and deploy RMS easily using Docker:
 
 1.  Build the project:
     ```bash
     mvn package
     ```
 
 2.  Run with Docker:
     ```bash
     docker build -t richkware-manager-server .
     docker run -d -p 8080:8080 --name rms richkware-manager-server
     ```
 
 3.  Access RMS at [http://localhost:8080/Richkware-Manager-Server/](http://localhost:8080/Richkware-Manager-Server/)
 
 
 ### Manual Deployment
 
 Open the configuration file (`/src/main/resources/configuration.properties`) and set the parameters inside it.
 
 - __database.url__: address of the database (default: jdbc:mysql://db:3306/)
 - __database.username__: username used to access to the database (default: root)
 - __database.password__: password used to access to the database (default: richk)
 - __encryptionkey__: encryption key used to exchange message to Richkware and RMC. if you change this parameter, remember to change also the configurations in Richkware and RMC (default: richktest)
 
 Then build the "war" file:
     
     mvn package
 
 And deploy it to a Tomcat server (Tomcat 9+ recommended).
 
 ## IDE

This project is developed with Intellij IDEA.
[Open Sources Licences](https://www.jetbrains.com/opensource/) provided by JetBrains.

<img src="https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/Jetbrains/jetbrains.svg" width="100" alt="Jetbrains Logo"/>
