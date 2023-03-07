FROM nginx:1.13.1-alpine

EXPOSE 80

RUN ng build

COPY /dist/keysell/ /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
