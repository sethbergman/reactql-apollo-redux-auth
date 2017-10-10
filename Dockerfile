# Dockerfile
FROM node:8.5.0

ENV IN_DOCKER true

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install --no-progress

# Bundle app source
COPY . /usr/src/app

ENV HOST 0.0.0.0
ENV PORT 4000

EXPOSE 80

RUN [ "npm" "run" "build" ]

ENTRYPOINT [ "package.json" ]
CMD [ "npm" "run" "server" ]