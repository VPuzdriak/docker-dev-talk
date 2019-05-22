# Persistent data/volume (MS SQL Server)

## Pull MS SQL Server image from Docker Hub

```
> docker image pull mcr.microsoft.com/mssql/server
```

This command will pull only an image from MS SQL Server, but will not run a container.

## Let's run a container

```
> docker container run -d --name mssql -e 'ACCEPT_EULA=yes' -e 'SA_PASSWORD'=<password> -p 1433:1433 mcr.microsoft.com/mssql/server
```

where __**\<password\>**__ is your strong password. 
For instance:
```
> docker container run -d --name mssql -e 'ACCEPT_EULA=yes' -e 'SA_PASSWORD'=myStrongPassword@ -p 1433:1433 mcr.microsoft.com/mssql/server
```

For more information visit: [Official Microsoft SQL Server image page](https://hub.docker.com/_/microsoft-mssql-server) on Docker Hub.

## Let's connect to MS SQL Server

In order to connect and create database with tables we can use two options:

* Use terminal to run T-SQL queries
* Install MS SQL Server client - [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017) for Windows or [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-2017) for other platforms.

When choose one - connect to SQL Server.
* Server name: localhost
* User Id: sa
* Password: __**password, mentioned in environment variable SA_PASSWORD**__

In case if you chose to use terminal - you can enable interactive mode and run commands needed:
```
> docker exec -it <container_id|container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P <your_password>
```

## Apply migration from Initial migration.sql

__**Initial migration.sql**__ contains script to create sample database.

Apply this script using chosen SQL client.

## Let's kill the container and start it once again

```
> docker container stop mssql
> docker container rm mssql
> docker container run -d --name mssql -e 'ACCEPT_EULA=yes' -e 'SA_PASSWORD'=<password> -p 1433:1433 mcr.microsoft.com/mssql/server
```

Connect to SQL Server using chosen client.

## How can we keep databases after killing container

To keep the data alive after killing container we need to use volumes.

In this particular case volume should use folder __**/var/opt/mssql**__ in our container.

Volume is determined by the name, so we should provide it.

Kill the running container and create a new one with next command.

```
docker container run -d --name mssql -e 'ACCEPT_EULA=yes' -e 'SA_PASSWORD'=<password> -p 1433:1433 -v mssql:/var/opt/mssql mcr.microsoft.com/mssql/server
```

Flag __**-v**__ was added, which means __**volume**__.

The part before colon is the name of the volume. In our case it is __**mssql**__. The part after is the folder in our container.

## Let's test it

Connect to SQL Server using chosen client. Apply migration script. 

Kill the container and start it again using the upper command.

Our database should be there.

## How can I manage the volumes

### To see a list of volumes:

```
> docker volume ls
```

### To remove a volume

```
> docker volume rm <volume name>
```

Where __**\<volume name\>**__ in our case is __**mssql**__.

### To remove all volumes

```
> docker volume prune
```
