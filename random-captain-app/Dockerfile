FROM node:8-alpine

EXPOSE 3000

RUN mkdir /app

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install && npm cache clean --force

COPY . .

CMD npm start