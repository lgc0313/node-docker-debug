FROM node:8

WORKDIR /app
RUN npm install -g nodemon
COPY package.json /app/package.json
RUN npm install && npm ls
CMD ["nodemon", "bin/run"]