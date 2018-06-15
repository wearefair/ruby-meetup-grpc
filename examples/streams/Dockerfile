FROM ruby:2.4.4
RUN mkdir /app
WORKDIR /app
ADD Gemfile .
RUN bundle install
ADD *.rb ./
CMD exec bundle exec ruby -I ./ server.rb
