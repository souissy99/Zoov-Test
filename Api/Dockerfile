FROM node:11-alpine

RUN mkdir -p /usr/src/api

WORKDIR /usr/src/api

COPY . .

RUN npm install

EXPOSE 8081

CMD ["npm", "run", "start"]