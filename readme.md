# Persistent data/bind mount (nginx)

## Pull nginx image from Docker Hub

```
> docker image pull nginx
```

This command will only pull an image for nginx, but will not run a container.

## Let's run a container

```
docker container run -d --name omnifood -p 80:80 -v $PWD:/usr/share/nginx/html nginx
```

Flag __**\-v**__ was added, which means **volume**.

Usually we use bind mount for development purposes.

In this particular case we say that when container tries to work with files from __**/usr/share/nginx/html**__, files from current directory should be
provided instead. So our working files are stored in our host file system and do not exist in container physically.

## Let's analyze our volumes

### To see a list of volumes:

```
> docker volume ls
```

In the provided list you will not find a volume for this website, because we use bind mount here, not a classical volume.
