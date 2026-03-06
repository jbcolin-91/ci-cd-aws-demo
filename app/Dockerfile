FROM node:18 AS deps
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci

FROM deps AS test
COPY . .
RUN npm test

FROM node:18-alpine AS deps-runtime
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --omit=dev

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=deps-runtime /usr/src/app/node_modules ./node_modules
COPY ./server.js .
EXPOSE 8080
CMD ["node", "server.js"]
