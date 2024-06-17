FROM node:16 as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm build

FROM scratch
WORKDIR /app
COPY --from=builder /app/src/build .

EXPOSE 3000
CMD [ "npm", "start" ]
