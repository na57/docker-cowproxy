FROM debian:jessie
MAINTAINER fzerorubigd <fzero@rubi.gd> @fzerorubigd

RUN apt-get update && apt-get install -y --no-install-recommends \
		ssh \
        wget \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -L git.io/cow | bash

ADD docker-initscript.sh /sbin/docker-initscript.sh
RUN chmod 755 /sbin/docker-initscript.sh
EXPOSE 7777/tcp
RUN mkdir /data
VOLUME /data
ENTRYPOINT ["/sbin/docker-initscript.sh"]
CMD ["cow"]
