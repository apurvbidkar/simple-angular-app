FROM node:16.17.0 AS build 
RUN apt update -y 
COPY ./  angular
WORKDIR angular
RUN npm install
RUN npm i
RUN npm run build
FROM nginx
RUN apt update -y
WORKDIR angular
COPY --from=build  /angular/dist/* /usr/share/nginx/html/

