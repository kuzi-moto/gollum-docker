FROM ruby:alpine3.12
RUN apk add --no-cache \
  cmake \
  build-base
RUN gem install github-linguist
RUN gem install gollum
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "80"]
EXPOSE 80