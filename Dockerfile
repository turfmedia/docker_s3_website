FROM ruby:2.3.1-alpine


ENV LANG C.UTF-8
ENV BUILD_PACKAGES \
	bash curl-dev ruby-dev build-base nodejs libffi-dev libxml2 libxslt \
	libxslt-dev libxml2-dev zlib-dev zlib git
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-rdoc ruby-irb


RUN apk update && \
		apk upgrade && \
		apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
		gem install bundler


RUN apk --update add openjdk7-jre


VOLUME ["/website", "/config"]

ADD . /website

WORKDIR /website

RUN bundle install

ENTRYPOINT ["s3_website"]

CMD ["--help"]
