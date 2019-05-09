# Container management


## Start 3 instances of nginx


### Rules:
* Containers should have unique name (i.e webhost1, webhost2, webhost3)
* If _**-p**_ flag is present - container should use free host ports only. For instance, if port 80 is serving other application or container - you cannot use it

```
> docker container run -d --name webhost1 -p 80:80 nginx
> docker container run -d --name webhost2 -p 8080:80 nginx
> docker container run -d --name webhost3 -p 8090:80 nginx
```

### Used flags:
* _**--name**_ - gives a name to the container. Is not required, but makes management easier
* _**-p**_ - enables traffic forwarding from host to the container. Flag syntax:
```
-p <port on host>:<port on container>
```

## Show list of images

```
docker image ls
```

## Show list of running containers

### ATTENTION

Only running containes will be shown
```
> docker container ls
```

## Stop running containers

```
> docker container stop webhost1 webhost2 webhost3
```

## Show list of all containers, even stopped

```
> docker container ls -a
```

## Start stopped containers

```
> docker container start webhost1 webhost2 webhost3
```

## Remove containers

### ATTENTION
Only stopped containers can be removed

```
> docker container rm webhost1 webhost2 webhost3
```

## Remove images

### ATTENTION
Image can be removed only if:
* There are no running or stopped containers of that image
* There are no running or stopped containers of any image, which is dependent on current image

To remove image type next command

```
> docker image rm <image tag>
```

For example, next command will remove an image with tag nginx:latest

```
> docker image rm nginx
```