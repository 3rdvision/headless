FROM hivesolutions/ubuntu_dev:latest
MAINTAINER Hive Solutions

EXPOSE 8080

ENV HOST 0.0.0.0
ENV PORT 8080
ENV NODE_ENV production

ADD app.js /headless/
ADD package.json /headless/
ADD lib /headless/

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y bzip2 fontconfig nodejs
RUN npm install

CMD ["/usr/bin/node", "/headless/app.js"]
