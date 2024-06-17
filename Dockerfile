FROM node:16 as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:16
WORKDIR /app
COPY --from=builder /app/build /app
EXPOSE 3000
CMD ["npm", "start"]
