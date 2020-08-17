FROM ruby:alpine

RUN apk add --no-cache --virtual deps build-base ruby-dev libc-dev linux-headers
RUN apk add --no-cache git libcurl

RUN gem install github-pages html-proofer

RUN apk del deps && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

ADD entrypoint.sh .
ADD Gemfile .

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
