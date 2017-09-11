# Nginx PHP MySQL Docker

Docker running Nginx, PHP-FPM, Composer, MySQL and PHPMyAdmin.

This project is a docker composition for creating a basic and common web server in a Linux operating system.

Maybe you have created a server or rented a VPS with Linux inside, and now you want to install web server fast and easy, then you can use this docker project.

The project uses Nginx, a lightweight web server.

## Overview

1. [Install prerequisites](#install-prerequisites)

    Before installing project make sure the following prerequisites have been met.

2. [Clone the project](#clone-the-project)

    We’ll download the code from its repository on GitHub.

3. [Configure Nginx With SSL Certificates](#configure-nginx-with-ssl-certificates)

    We'll generate and configure SSL certificate for nginx before running server.

4. [Run the application](#run-the-application)

    By this point we’ll have all the project pieces in place.

5. [Use Makefile](#use-makefile)

    When developing, you can use `Makefile` for doing recurrent operations.

6. [Use Docker Commands](#use-docker-commands)

    When running, you can use docker commands for doing recurrent operations.

___

## Install prerequisites

For now, this project has been mainly created for Unix `(Linux/MacOS)`. Perhaps it could work on Windows. Make sure to make compatible the relative paths in the `docker-compose.yml` file configuration like `c:\foo\bar`.

All requisites should be available for your distribution. The most important are :

* [Git](https://git-scm.com/downloads)
* [Docker](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install/)

Check if `docker-compose` is already installed by entering the following command : 

```sh
which docker-compose
```

The following is optional but makes life more enjoyable :

```sh
which make
```

On Ubuntu and Debian these are available in the meta-package build-essential. On other distributions, you may need to install the GNU C++ compiler separately.

```sh
sudo apt install build-essential
```

### Images to use

* [Nginx](https://hub.docker.com/_/nginx/)
* [MySQL](https://hub.docker.com/_/mysql/)
* [PHP-FPM](https://hub.docker.com/r/komputronika/php-fpm/)
* [Composer](https://hub.docker.com/_/composer/)
* [PHPMyAdmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/)
* [Generate Certificate](https://hub.docker.com/r/jacoelho/generate-certificate/)

You should be careful when installing third party web servers such as MySQL or Nginx.

This project use the following ports :

| Server     | Port |
|------------|------|
| MySQL      | 8989 |
| PHPMyAdmin | 8080 |
| Nginx      | 8000 |
| Nginx SSL  | 3000 |

---

## Clone the project

To install [Git](http://git-scm.com/book/en/v2/Getting-Started-Installing-Git), download it and install following the instructions : 

```sh
git clone https://github.com/komputronika/docker-nginx-php-mysql.git
```

Go to the project directory : 

```sh
cd docker-nginx-php-mysql
```

### Project tree

```sh
.
├── Makefile
├── README.md
├── data
│   └── db
│       ├── dumps
│       └── mysql
├── docker-compose.yml
├── etc
│   ├── nginx
│   │   └── default.conf
│   ├── php
│   │   └── php.ini
│   └── ssl
└── web
    ├── app
    │   ├── composer.json.dist
    │   ├── phpunit.xml.dist
    │   ├── src
    │   │   └── Foo.php
    │   └── test
    │       ├── FooTest.php
    │       └── bootstrap.php
    └── public
        └── index.php
```

---

## Configure Nginx With SSL Certificates

1. Generate SSL certificates

    ```sh
    sudo docker run --rm -v $(pwd)/etc/ssl:/certificates -e "SERVER=localhost" jacoelho/generate-certificate
    ```

2. Configure Nginx

    Edit nginx file `etc/nginx/default.conf` and uncomment the SSL server section :

    ```sh
    # server {
    #     server_name localhost;
    #
    #     listen 443 ssl;
    #     ...
    # }
    ```
---

## Run the application

1. Copying the composer configuration file : 

    ```sh
    cp web/app/composer.json.dist web/app/composer.json
    ```

2. Start the application :

    ```sh
    sudo docker-compose up -d
    ```

    **Please wait this might take a several minutes...**

    ```sh
    sudo docker-compose logs -f # Follow log output
    ```

3. Open your favorite browser :

    * [http://localhost:8000](http://localhost:8000/)
    * [https://localhost:3000](https://localhost:3000/) ([HTTPS](#configure-nginx-with-ssl-certificates) not configured by default)
    * [http://localhost:8080](http://localhost:8080/) PHPMyAdmin (username: dev, password: dev)

4. Stop and clear services

    ```sh
    sudo docker-compose down -v
    ```

---

## Use Makefile

When developing, you can use [Makefile](https://en.wikipedia.org/wiki/Make_(software)) for doing the following operations :

| Name          | Description                                |
|---------------|--------------------------------------------|
| apidoc        | Generate documentation of API              |
| clean         | Clean directories for reset                |
| code-sniff    | Check the API with PHP Code Sniffer (PSR2) |
| composer-up   | Update PHP dependencies with composer      |
| docker-start  | Create and start containers                |
| docker-stop   | Stop and clear all services                |
| gen-certs     | Generate SSL certificates for `nginx`      |
| logs          | Follow log output                          |
| mysql-dump    | Create backup of whole database            |
| mysql-restore | Restore backup from whole database         |
| test          | Test application with phpunit              |

### Examples

Start the application : 

```sh
sudo make docker-start
```

Show help :

```sh
make help
```

---

## Use Docker commands

### Installing package with composer

```sh
sudo docker run --rm -v $(pwd)/web/app:/app composer require symfony/yaml
```

### Updating PHP dependencies with composer

```sh
sudo docker run --rm -v $(pwd)/web/app:/app composer update
```

### Generating PHP API documentation

```sh
sudo docker-compose exec -T php ./app/vendor/bin/apigen generate app/src --destination ./app/doc
```

### Testing PHP application with PHPUnit

```sh
sudo docker-compose exec -T php ./app/vendor/bin/phpunit --colors=always --configuration ./app/
```

### Checking the standard code with [PSR2](http://www.php-fig.org/psr/psr-2/)

```sh
sudo docker-compose exec -T php ./app/vendor/bin/phpcs --standard=PSR2 ./app/src
```

### Checking installed PHP extensions

```sh
sudo docker-compose exec php php -m
```

### Handling database

#### MySQL shell access

```sh
sudo docker exec -it mysql bash
```

and

```sh
mysql -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD"
```

#### Backup of database

```sh
mkdir -p data/db/dumps
```

```sh
source .env && sudo docker exec $(shell docker-compose ps -q mysqldb) mysqldump --all-databases -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" > "data/db/dumps/db.sql"
```

or

```sh
source .env && sudo docker exec $(shell docker-compose ps -q mysqldb) mysqldump test -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" > "data/db/dumps/test.sql"
```

#### Restore Database

```sh
source .env && sudo docker exec -i $(sudo docker-compose ps -q mysqldb) mysql -u"$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" < "data/db/dumps/db.sql"
```

#### Connecting MySQL with MySQLi

```php
<?php
    mysqli_report(MYSQLI_REPORT_STRICT);
    try {
        $mysqli = new mysqli('mysql','dev','dev','test');
        echo 'Connect success.';
    } catch (mysqli_sql_exception $e) {
        echo 'ERROR:'.$e->getMessage();
    }
?>
```
___

### Additional info

* Copy all your web files to `./web/public` folder
* You can change the default ports by modifying file `docker-compose.yml`, for example: 
```sh
    ports:
        - "80:80"   
        - "443:443"
```        

___

Created by: [nanoninja](https://github.com/nanoninja) | Forked by: [komputronika](https://github.com/komputronika)