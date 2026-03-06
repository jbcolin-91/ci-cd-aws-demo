FROM node:18 AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --production

FROM node:18-alpine AS deploy
WORKDIR /app
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY ./server.js .

EXPOSE 8080
CMD ["node", "server.js"]
