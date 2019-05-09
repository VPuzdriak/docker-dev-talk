# Container management


## Start 3 instances of nginx


### Requirements:
* Containers should have unique name (i.e webhost1, webhost2, webhost3)
* Containers should use different host ports (i.e. 80, 8080, 8090)

```
docker container run -d --name webhost1 -p 80:80 nginx
docker container run -d --name webhost2 -p 8080:80 nginx
docker container run -d --name webhost3 -p 8090:80 nginx
```

## Show list of running containers

### ATTENTITION

Only running containes will be shown
```
docker container ls
````

## Stop running containers

```
docker container stop webhost1 webhost2 webhost3
```

## Show list of all containers, even stopped

```
docker container ls -a
```

## Start stopped containers

```
docker container start webhost1 webhost2 webhost3
```


## Remove containers

### ATTENTITION
Only stopped containers can be removed

```
docker container rm webhost1 webhost2 webhost3
```