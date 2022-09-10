FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y yarn nodejs postgresql-client

WORKDIR /usr/src
COPY Gemfile /usr/src/Gemfile
COPY Gemfile.lock /usr/src/Gemfile.lock
RUN gem install bundler:2.2.31 && bundle install

EXPOSE 3000

COPY package.json /usr/src
COPY yarn.lock /usr/src

RUN rails webpacker:compile

CMD rails server -b 0.0.0.0