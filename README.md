This repo contains a series of scripts written in support of my 15 minute Lightning talk on Grape:

# [Slides here](https://docs.google.com/a/rabidtech.co.nz/presentation/d/1aWj5tKVzxqXuX1SC7tKtFx--FeLe4gx483ygns5c9ys/edit?usp=sharing)

These scripts should not be considered best-practice, in fact they are little more than a scratch-pad used to try out different ideas.

They are partitioned into 3 versions:

1. Simple API, no special features run with `docker-compose run --service-ports app rackup 1_config.ru`
2. Uses ActiveModel::Serializers to format output as JSON:API - `docker-compose run --service-ports app rackup 2_config.ru`
2. Generates Swagger documentation - `docker-compose run --service-ports app rackup 3_config.ru`
