# Custom MariaDB + Apache Docker Image

This project provides a pre-configured **Docker image** with **MariaDB** and **Apache**. It automatically executes an SQL script (`init.sql`) every time the container starts. This setup is ideal for development, testing, or local environments where you need both a database and a web server in a single container.

## Features

- **MariaDB** and **Apache** managed by **supervisord**.
- Automatically runs `init.sql` on container startup to set up the database, tables, and sample data.
- No sensitive data (like passwords) stored in environment variables.
- Debug output to confirm SQL actions taken during initialization.

## Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Compose** (optional for multi-container setups): [Install Docker Compose](https://docs.docker.com/compose/install/)

### Clone the Repository

To get started, clone the repository:

```bash
git clone https://github.com/madhav-acharya/mysql-docker.git
cd mysql-docker
docker build -t mysql-docker

```
or simply pull the image using

```bash
docker pull madhav351/mysql-docker
```
and run it using the command
```bash
docker run -d --name my-app -p 8080:80 -p 3306:3306 madhav351/mysql-docker
```
