FROM node:8

EXPOSE 3000

RUN mkdir /app

WORKDIR /app

COPY . .

RUN npm install && npm cache clean --force

CMD npm start