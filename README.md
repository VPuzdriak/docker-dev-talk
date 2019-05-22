# Creating custom image (NodeJS app)

## When Dockerfile is ready follow next steps.

### Build Docker image and put tag on it using -t flag
```
> docker image build -t <docker hub username>/random-captain .
```

Instead of _**\<docker hub username\>**_ paste your username, i.e. in my case the up command will look like this:

```
> docker image build -t vpuzdriak/random-captain .
```

This will create a new image with _**\<docker hub username\>/random-captain**_ tag.

### Login to your Docker Hub account

```
> docker login
```

You will be prompted to enter your username and password.

### Push your image to Docker Hub

```
> docker push <docker hub username>/random-captain
```

Docker image was pushed, now your colleague can pull it and run.

## What!??? Almost 1GB disk space!

### Check your images.

```
> docker image ls
```

You will find out that your image consumes almost 1GB of disk space.
This app cannot take so much space, which means that __**node:8**__ consumes a lot as we are using it in **FROM** command.

And that is right. In the list of your images you can find also __**node:8**__ image, which consumes almost 900MB.


### Replacing heavy NodeJS

Change node:8 to node:8-alpine in the Dockerfile and build new image with _**\<docker hub username\>/random-captain:apline**_.
You know already how to do that, right? You can use different tag, but __**alpine**__ shows exactly that alpine distributive was used.
