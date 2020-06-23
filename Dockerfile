FROM ruby:alpine3.12 as Builder
RUN apk --update add --virtual \
  build_deps \
  build-base \
  cmake \
  libc-dev \
  openssl-dev \
  ruby-dev
RUN gem install gollum

FROM ruby:alpine3.12

RUN apk add --no-cache git
COPY --from=Builder /usr/local/bundle /usr/local/bundle

WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "80"]
EXPOSE 80