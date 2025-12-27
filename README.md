# Richkware-Manager-Server (RMS)

[![Build Status](https://travis-ci.org/richkmeli/Richkware-Manager-Server.svg?branch=master)](https://travis-ci.org/richkmeli/Richkware-Manager-Server)
[![](https://jitpack.io/v/richkmeli/Richkware-Manager-Server.svg)](https://jitpack.io/#richkmeli/Richkware-Manager-Server)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e246694691aa4a44b2aa5008b74e61ef)](https://app.codacy.com/app/richkmeli/Richkware-Manager-Server?utm_source=github.com&utm_medium=referral&utm_content=richkmeli/Richkware-Manager-Server&utm_campaign=Badge_Grade_Dashboard)

**Richkware-Manager-Server (RMS)** is a management service for hosts infected with malware built using the **Richkware** framework. It acts as a Command and Control (C2) server.

![](https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/GUI/RMS/RMS.png)

## Implementation

RMS follows REST principles. The table below outlines the HTTP methods implemented for each resource:

| Component       | GET | POST | PUT | DELETE |
|-----------------|:---:|:----:|:---:|:------:|
| `device`        |  x  |      |  x  |   x    |
| `user`          |  x  |      |     |   x    |
| `devices`       |  x  |      |     |   x    |
| `users`         |  x  |      |     |        |
| `encryptionKey` |  x  |      |     |        |

## Related Projects

- **[Richkware](https://github.com/richkmeli/Richkware)**: The C++ framework for building the malware agents.
- **[Richkware-Manager-Client](https://github.com/richkmeli/Richkware-Manager-Client)**: A client application that connects to RMS to view infected hosts and send commands.

![Diagram](https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/Diagram/RichkwareDiagram1.2.png)

## Requirements

- **Java 11** or higher
- **Maven**
- **Docker** (Recommended) or Tomcat 9+ and MySQL

## Getting Started

### Using Docker (Recommended)

The easiest way to build and deploy RMS is using Docker:

1. **Build the project**:
   ```bash
   mvn package
   ```

2. **Run with Docker**:
   ```bash
   # Build the image
   docker build -t richkware-manager-server .
   
   # Run the container
   docker run -d -p 8080:8080 --name rms richkware-manager-server
   ```

3. **Access RMS**:
   Open [http://localhost:8080/Richkware-Manager-Server/](http://localhost:8080/Richkware-Manager-Server/) in your browser.

### Manual Deployment

1. **Configure the Application**:
   Edit `/src/main/resources/configuration.properties`:
   
   - `database.url`: JDBC URL of the database (default: `jdbc:mysql://db:3306/`)
   - `database.username`: Database username (default: `root`)
   - `database.password`: Database password (default: `richk`)
   - `encryptionkey`: Key used to encrypt messages exchanged with Richkware and RMC (default: `richktest`). **Important**: If you change this, you must update the configuration in the malware and client as well.

2. **Build the WAR file**:
   ```bash
   mvn package
   ```

3. **Deploy**:
   Copy the generated WAR file (e.g., `target/Richkware-Manager-Server.war`) to the `webapps` directory of your Tomcat server.

## IDE Support

This project is developed using **IntelliJ IDEA**.

[![JetBrains Logo](https://raw.githubusercontent.com/richkmeli/richkmeli.github.io/master/Richkware/Jetbrains/jetbrains.svg)](https://www.jetbrains.com/opensource/)

*Open Source License provided by JetBrains.*
