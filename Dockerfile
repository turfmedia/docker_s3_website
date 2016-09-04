FROM alpine


ENV LANG C.UTF-8
ENV BUILD_PACKAGES \
	bash curl-dev ruby-dev build-base nodejs libffi-dev libxml2 libxslt \
	libxslt-dev libxml2-dev zlib-dev zlib git
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-rdoc ruby-irb


RUN apk update && \
		apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
		apk add openjdk7-jre && \
		rm -rf /var/cache/apk/* && \
		gem install bundler

# VOLUME ["/website", "/config"]

ADD . /website

WORKDIR /website

RUN bundle install

CMD ["s3_website --help"]
