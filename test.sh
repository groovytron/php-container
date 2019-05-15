#!/bin/bash

php --version
composer --version
composer global show hirak/prestissimo

composer create-project laravel/laravel laravel-project --no-progress --profile --prefer-dist || exit 1
composer clear-cache
composer create-project symfony/website-skeleton symfony-project --no-progress --profile --prefer-dist || exit 1
