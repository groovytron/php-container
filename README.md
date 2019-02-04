# Docker container for PHP project

[![Build Status](https://travis-ci.org/groovytron/php-container.svg?branch=master)](https://travis-ci.org/groovytron/php-container)

Docker container allowing you to build and test your PHP project.

## Softwares embedded in the container

The following tools are embedded in the container:

- PHP: *7.2.10*
- Composer: *1.6.3*

## Use the container

We recommend you use the `dev` user instead of `root` when running that container.

The container's working directory is `/var/www/app` so we advise you to mount your project directory onto this place.

### Building the project interactively in the container

To run the container and open a bash in your php project run the following command:

`docker run -it --entrypoint /bin/bash --user=dev --volume=<path-to-your-php-project-directory>:/var/www/app groovytron/php:latest`

## Improvements

- [ ] Use an alpine php docker image to make the container image lighter
