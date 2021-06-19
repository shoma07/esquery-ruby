FROM ruby:3.0.1-alpine3.13

WORKDIR /usr/src/gem

RUN apk add --no-cache build-base git

COPY . .

RUN bundle install -j4
