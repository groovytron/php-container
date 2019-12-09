# PHP container (Docker container for PHP projects)

[![Build Status](https://travis-ci.org/groovytron/php-container.svg?branch=master)](https://travis-ci.org/groovytron/php-container)

Docker container allowing you to build and test your PHP projects.

## Supported tags and respective `Dockerfile` links

- `7.4`, `latest` ([7.4/Dockerfile](https://github.com/groovytron/php-container/blob/master/7.4/Dockerfile))
- `7.3` ([7.3/Dockerfile](https://github.com/groovytron/php-container/blob/master/7.3/Dockerfile))
- `7.2` ([7.2/Dockerfile](https://github.com/groovytron/php-container/blob/master/7.2/Dockerfile))
- `7.1` ([7.1/Dockerfile](https://github.com/groovytron/php-container/blob/master/7.1/Dockerfile))

[`composer`](https://getcomposer.org) is installed in every image to make PHP dependencies installation easier.
[`prestissimo`](https://github.com/hirak/prestissimo) is also installed to parallelize and speed up dependencies installation with `composer`.

## Use the container

We recommend you use the `dev` user instead of `root` when running that container.

The container's working directory is `/var/www/app` so we advise you to mount your project directory onto this place.

### Building the project interactively in the container

To run the container and open a bash in your php project run the following command:

`docker run -it --entrypoint /bin/bash --user=dev --volume=<path-to-your-php-project-directory>:/var/www/app groovytron/php:latest`

### Troubleshooting

#### Impossible to run `composer install` or `composer update` when prestissimo is installed

```console
Downloading https://repo.packagist.org/packages.json


  [ErrorException]
  mkdir(): Not a directory


Exception trace:
 () at /home/dev/.composer/vendor/hirak/prestissimo/src/CopyRequest.php:103
 Composer\Util\ErrorHandler::handle() at n/a:n/a
 mkdir() at /home/dev/.composer/vendor/hirak/prestissimo/src/CopyRequest.php:103
 Hirak\Prestissimo\CopyRequest->createDir() at /home/dev/.composer/vendor/hirak/prestissimo/src/CopyRequest.php:89
 Hirak\Prestissimo\CopyRequest->setDestination() at /home/dev/.composer/vendor/hirak/prestissimo/src/CopyRequest.php:39
 Hirak\Prestissimo\CopyRequest->__construct() at /home/dev/.composer/vendor/hirak/prestissimo/src/ParallelizedComposerRepository.php:26
 Hirak\Prestissimo\ParallelizedComposerRepository->preloadProviderListings() at /home/dev/.composer/vendor/hirak/prestissimo/src/ParallelizedComposerRepository.php:39
 Hirak\Prestissimo\ParallelizedComposerRepository->prefetch() at /home/dev/.composer/vendor/hirak/prestissimo/src/Plugin.php:150
 Hirak\Prestissimo\Plugin->prefetchComposerRepositories() at /home/dev/.composer/vendor/hirak/prestissimo/src/Plugin.php:82
 Hirak\Prestissimo\Plugin->activate() at phar:///usr/local/bin/composer/src/Composer/Plugin/PluginManager.php:236
 Composer\Plugin\PluginManager->addPlugin() at phar:///usr/local/bin/composer/src/Composer/Plugin/PluginManager.php:205
 Composer\Plugin\PluginManager->registerPackage() at phar:///usr/local/bin/composer/src/Composer/Plugin/PluginManager.php:261
 Composer\Plugin\PluginManager->loadRepository() at phar:///usr/local/bin/composer/src/Composer/Plugin/PluginManager.php:79
 Composer\Plugin\PluginManager->loadInstalledPlugins() at phar:///usr/local/bin/composer/src/Composer/Factory.php:384
 Composer\Factory->createComposer() at phar:///usr/local/bin/composer/src/Composer/Factory.php:576
 Composer\Factory::create() at phar:///usr/local/bin/composer/src/Composer/Console/Application.php:345
 Composer\Console\Application->getComposer() at phar:///usr/local/bin/composer/src/Composer/Console/Application.php:458
 Composer\Console\Application->getPluginCommands() at phar:///usr/local/bin/composer/src/Composer/Console/Application.php:156
 Composer\Console\Application->doRun() at phar:///usr/local/bin/composer/vendor/symfony/console/Application.php:117
 Symfony\Component\Console\Application->run() at phar:///usr/local/bin/composer/src/Composer/Console/Application.php:104
 Composer\Console\Application->run() at phar:///usr/local/bin/composer/bin/composer:61
 require() at /usr/local/bin/composer:24
```

If you get the above error when running `composer install` or `composer update` and you have set the environment variable `COMPOSER_CACHE_DIR` to `/dev/null`, setting this variable to another location where the current user can read and write should fix the problem.

If this doesn't fix the issue, please comment [the issue #4](https://github.com/groovytron/php-container/issues/4) or reopen a new one.

## Contributing

Pull requests, bug reports, and feature requests are welcome.

### Develop locally

If you want to improve one of these images, your will need the following software installed on your system:

- `docker`
- `docker-compose` (if you want to build images using the file [build.yml](https://github.com/groovytron/php-container/blob/master/build.yml))
- `make` (if you want to build images using the file [build.yml](https://github.com/groovytron/php-container/blob/master/build.yml) and abstract from it with the [Makefile](https://github.com/groovytron/php-container/blob/master/Makefile))

Once you have the above softwares installed, run `make php7.3` to build the `php7.3` image.
To build all the images, run `make all`.
If you want to clean your builds, simply run `make clean`.

## License

MIT License. See the LICENSE file.
