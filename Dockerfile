FROM alpine

RUN 	wget http://www.harding.motd.ca/autossh/autossh-1.4e.tgz \
	&& gunzip -c autossh-1.4e.tgz | tar xvf - \
	&& cd autossh-1.4e \
	&& ./configure \
	&& make \
	&& make install

ENV \
	AUTOSSH_LOGFILE=/dev/stdout \
	AUTOSSH_GATETIME=30         \
	AUTOSSH_POLL=10             \
	AUTOSSH_FIRST_POLL=30       \
	AUTOSSH_PORT=13000           
	# AUTOSSH_DEBUG=1             \
	# AUTOSSH_LOGLEVEL=1          \

ADD docker-entrypoint.sh /usr/local/bin
	

ENTRYPOINT [ "docker-entrypoint.sh" ]
