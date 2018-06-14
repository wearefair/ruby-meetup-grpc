FROM ruby:2.4.4
RUN mkdir /app
WORKDIR /app
ADD Gemfile .
ADD example.rb .
ADD person_pb.rb .
RUN bundle install
CMD bundle exec ruby -I ./ example.rb
