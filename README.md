# Docker networking

## How can nginx and NodeJS app talk to each other

Let's assume that we have a NodeJS application. We would like to use nginx as a reversed proxy server.
So the request comes to nginx and nginx redirects it to our NodeJS application, which is build using Express framework.

So first of all let's create images:
* nginx with all required configuration
* random-captain application

## Build an image for random captain

We did that before right? Let's revise it one more time.

First of all - navigate to __**random-captain-app**__ folder and build an image using next command

```
> docker image build -t random-captain-app:alpine .
```

Please use, exact this name of the container, not your custom. Otherwise it will not work.
The reason of that is described further.

We are using __**alpine**__ version of NodeJS image here in order to save disk memory.

Image is ready - let's run a container

```
> docker container run -d --name random-captain-app random-captain-app:alpine
```
You can check various options in web browser, such as __**localhost**__, __**localhost:3000**__ - it will not work.

Pay attention that we do not use __**\-p**__ flag here. We do not want our application be accessible from the outside. 
We want that only nginx can talk to our app. That's why in the browser we see an error.

## Build an image for nginx

From __**random-captain-app**__ folder navigate to __**nginx**__ folder, which is one level up.

```
> cd ../nginx
```

In that folder you can find __**nginx.conf**__ file, which is a configuration of our nginx server.

In this config file you can see that nginx server is intended to work with port 80 and redirect incoming requests to http://random-captain-app:3000.
This is the address where our random-captain app can be used. Let's build an image.

```
> docker image build -t random-captain-server:alpine .
```

Image is ready - let's run a container.

```
> docker container run -d --name webhost -p 80:80 random-captain-server:alpine
```

Nothing unusual here. We just ran a container and specified a port mapping, so our server can be access from the outside using __**http://localhost**__.

## Let's create a virtual network

By default each container is closed and cannot talk to each other.

In order to solve this - we can create our own virtual network using Docker.

```
> docker network create <network name>
```

In our case let's use:

```
> docker network create random-captain-network
```

Let's add our containers to this network

```
> docker network connect <network name> <container id|container name>
```

In our case 

```
> docker network connect random-captain-network webhost
> docker network connect random-captain-network random-captain-app
```

Now both  containers are placed to __**random-captain-network**__ network.

If you navigate to __**http://localhost**__ in your web browser - you will see random-captain app is working.
In order to prove that nginx is hosting our application, open developer tools in your browser and checkout response headers for localhost request.

If browser shows an error - just stop __**webhost**__ container and start it again

```
> docker container stop webhost
> docker container start webhost
```

Using this approach you isolated our random-captain app from the outside and used nginx for proxying.

## Have a list of your networks

To see the list of created networks you can use next command

```
> docker network ls
```

## Other network commands

### Disconnect from network

```
> docker network disconnect <network name> <container id|container name>
```


### Remove a network

```
> docker network rm <network name>
```

Containers, which can use this network should be stopped and removed.

### Remove all custom networks
```
> docker network prune
```

## DNS resolution

In the nginx/nginx.conf file you can find a section for redirecting incoming requests to our app, which can be accessible via http://random-captain-app:3000 URL.
Why this URL is that specific? Actually the URL - is the name of the container of our app.

Docker has built-in DNS server, which can resolve IP address of our containers in order to simplify communication between them.
By default the name of the container will become a DNS name, however you can specify it differently using __**\--alias**__ flag in the container run command.
