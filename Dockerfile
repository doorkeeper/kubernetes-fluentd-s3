FROM fluent/fluentd:latest-onbuild

RUN apk --no-cache --update add build-base ruby-dev && \
    gem install fluent-plugin-s3 && \
    rm -rf /root/.gem/ruby/2.3.0/cache/*.gem && gem sources -c && \
    apk del build-base ruby-dev && rm -rf /var/cache/apk/*

COPY entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh
