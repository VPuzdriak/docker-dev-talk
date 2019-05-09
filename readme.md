# Creating custom image

## When Dockerfile is ready follow next steps.

### Build Docker image and put tag on it using -t flag
```
> docker image build -t <docker hub username>/omnifood
```

Instead of _**\<docker hub username\>**_ paste your username, i.e. in my case the up command will look like this:

```
> docker image build -t vpuzdriak/omnifood
```

This will create a new image with _**\<docker hub username\>/omnifood**_ tag.

### Login to your Docker Hub account

```
> docker login
```

You will be prompted to enter your username and password.

### Push your image to Docker Hub

```
> docker push <docker hub username>/omnifood
```

Docker image was pushed, now your colleague can pull it and run.