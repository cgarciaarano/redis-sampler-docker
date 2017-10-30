FROM ruby:alpine

LABEL authors="cgarciaarano@gmail.com"

RUN apk update &&\
	apk add curl &&\
	mkdir -p /opt/redis-sampler &&\
 	curl -qs https://raw.githubusercontent.com/antirez/redis-sampler/master/redis-sampler.rb -o /opt/redis-sampler/redis-sampler.rb &&\
	chmod +x /opt/redis-sampler/redis-sampler.rb &&\
	gem install redis &&\
	apk del curl &&\
	rm -rf /var/cache/apk/*

RUN ln -s /usr/local/bin/ruby /usr/bin/ruby

WORKDIR /opt/redis-sampler

ENTRYPOINT ["./redis-sampler.rb"]
