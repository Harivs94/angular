FROM node:14-alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.19-alpine

COPY --from=build /app/dist/keysell /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
