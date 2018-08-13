FROM ruby:2.5.1-slim-stretch
RUN mkdir /var/app

RUN apt-get update -yqq

RUN apt-get install -yqq wget ca-certificates gnupg2

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' >> /etc/apt/sources.list

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update -yqq

RUN apt-get install -yqq build-essential libpq-dev nodejs postgresql-client-9.6

WORKDIR /var/app

COPY vendor .
COPY Gemfile .
COPY entrypoint.sh .

RUN bundle install --jobs 4
RUN bundle pack

