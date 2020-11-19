FROM ruby:2.6.6-slim as ruby
WORKDIR /app
RUN gem install bundler:2.1.4


# Build
FROM ruby as build
RUN apt-get update && apt-get install -y build-essential
RUN bundle config set frozen 'true'
RUN bundle config set without 'development' 'test'
COPY Gemfile* /app/
RUN bundle install


# Test
FROM build as test
RUN rm /usr/local/bundle/config
RUN bundle config unset without
RUN bundle config set with 'development' 'test'
RUN bundle install
COPY . /app/
VOLUME /data
ENV APP_ENV=test


# Runtime
FROM ruby as runtime
RUN rm -rf /usr/local/bundle
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY . /app/
VOLUME /data
ENV DATA_PATH=/data
ENV APP_ENV=production
EXPOSE 80
CMD ["rackup", "--host", "0.0.0.0", "--port", "80"]

