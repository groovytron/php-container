# Changelog

## 1.2.1

- feat: add `php-pear` package to make PECL packages installation possible in the image
- remove: remove the installation of the generic `php` which installs `apache` that is not needed in the usage of this image

## 1.2.0

- feat: add [`xdebug`](https://xdebug.org/) to all images to make code coverage possible in tests
- change: bump composer to version 1.10.10
- change: bump prestissimo to version 0.3.10

## 1.1.0

- feat: add Makefile target for container images publishing
- feat: add brand new PHP 7.4 image
- change: bump composer to version 1.9.1

## 1.0.2

- change: bump composer to version 1.9.0
- feat: add bash and git completion for better development experience
- fix: issue due to bad composer cache configuration has been documented in the README

## 1.0.1

- feat: add `test.sh` script to make simple smoke testing easier (init a [Laravel](https://laravel.com) project and a [Symfony](https://symfony.com) project)

## 1.0.0

- feat: add OCI annotations
- feat: use composer 1.8.5
- feat: use prestissimo 0.3.9
- feat: build container using `docker-compose` and a `build.yml` file
- feat: PHP 7.3 container image
- feat: PHP 7.2 container image
- feat: PHP 7.1 container image

## 0.0.1

- feat: first PHP 7.2 version working with Symfony projects
