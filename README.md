# Django template

## Overview

A template project for running a Django project on ECS. 

**Features:**

* All infrastructure is mastered in CloudFormation
* Working Dockerfile for production and development
* Continuous delivery with Code Pipelines
* Authentication with JWT

## Deploying to ECS

Coming soon.

## Running locally

### Running with Docker

#### Build the Docker image

Before the Docker container can be run, the Docker image must be built. From the root of the repo, execute the following command:

```
./docker/build.sh
```

For a production build, set the `STAGE` environment variable to `production`:

```
STAGE=production ./docker/build.sh
```

#### Launch the Docker container

Once the image has been built, a Docker container can be launched with the following:

```
./docker/run.sh
```

For a production run, once again, set the `STAGE` environment variable to `production`:

```
STAGE=production ./docker/run.sh
```

### Running without Docker

To run without Docker, change into the `app/` directory and run the following:

```
cd app
pip3 install requirements.txt
./run.sh
```

To run with gunicorn, set the `STAGE` environment variable to `production`:

```
STAGE=production ./run.sh
```
