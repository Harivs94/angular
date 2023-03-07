FROM nginx:1.13.1-alpine

EXPOSE 80

COPY  dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
