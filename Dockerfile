FROM node:16-alpine AS development

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . . 

# RUN node minify.js

RUN npm run build

CMD ["node", "dist/main"]

EXPOSE 3000
EXPOSE 8080