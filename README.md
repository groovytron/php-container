# PHP container (Docker container for PHP projects)

[![Build Status](https://travis-ci.org/groovytron/php-container.svg?branch=master)](https://travis-ci.org/groovytron/php-container)

Docker container allowing you to build and test your PHP projects.

## Supported tags and respective `Dockerfile` links

- `7.3` ([7.3/Dockerfile](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/7.3/Dockerfile))
- `7.2` ([7.2/Dockerfile](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/7.2/Dockerfile))
- `7.1` ([7.1/Dockerfile](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/7.1/Dockerfile))

[`composer`](https://getcomposer.org) is installed in every image to make PHP dependencies installation easier.
[`prestissimo`](https://github.com/hirak/prestissimo) is also installed to parallelize and speed up dependencies installation with `composer`.

## Use the container

We recommend you use the `dev` user instead of `root` when running that container.

The container's working directory is `/var/www/app` so we advise you to mount your project directory onto this place.

### Building the project interactively in the container

To run the container and open a bash in your php project run the following command:

`docker run -it --entrypoint /bin/bash --user=dev --volume=<path-to-your-php-project-directory>:/var/www/app groovytron/php:latest`

## Contributing

Pull requests, bug reports, and feature requests are welcome.

### Develop locally

If you want to improve one of these images, your will need the following software installed on your system:

- `docker`
- `docker-compose` (if you want to build images using the file [build.yml](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/build.yml))
- `make` (if you want to build images using the file [build.yml](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/build.yml) and abstract from it with the [Makefile](https://github.com/groovytron/php-container/blob/d419b246aab2150a9f34af5a03fc7ddd1adea5d7/Makefile))

Once you have the above softwares installed, run `make php7.3` to build the `php7.3` image.
To build all the images, run `make all`.
If you want to clean your builds, simply run `make clean`.

## License

MIT License. See the LICENSE file.
