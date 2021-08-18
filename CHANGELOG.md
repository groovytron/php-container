# Changelog

## 1.3.0

- change: bump composer to version 2.1.5
- change: continuous integration toolchain has been migrated to GitHub Actions
- remove: prestissimo has been removed as it is not needed anymore with composer 2

## 1.2.1

- feature: add `php-pear` package to make PECL packages installation possible in the image
- remove: remove the installation of the generic `php` which installs `apache` that is not needed in the usage of this image

## 1.2.0

- feature: add [`xdebug`](https://xdebug.org/) to all images to make code coverage possible in tests
- change: bump composer to version 1.10.10
- change: bump prestissimo to version 0.3.10

## 1.1.0

- feature: add Makefile target for container images publishing
- feature: add brand new PHP 7.4 image
- change: bump composer to version 1.9.1

## 1.0.2

- change: bump composer to version 1.9.0
- feature: add bash and git completion for better development experience
- fix: issue due to bad composer cache configuration has been documented in the README

## 1.0.1

- feature: add `test.sh` script to make simple smoke testing easier (init a [Laravel](https://laravel.com) project and a [Symfony](https://symfony.com) project)

## 1.0.0

- feature: add OCI annotations
- feature: use composer 1.8.5
- feature: use prestissimo 0.3.9
- feature: build container using `docker-compose` and a `build.yml` file
- feature: PHP 7.3 container image
- feature: PHP 7.2 container image
- feature: PHP 7.1 container image

## 0.0.1

- feature: first PHP 7.2 version working with Symfony projects
