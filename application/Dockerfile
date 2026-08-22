FROM node:20-alpine

WORKDIR /app

RUN apk upgrade --no-cache

COPY package*.json ./

RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

CMD ["npm", "start"]