FROM 404973048572.dkr.ecr.us-east-1.amazonaws.com/node:latest AS build 
RUN apt update -y 
COPY ./  angular
WORKDIR angular
RUN npm install
RUN npm i
RUN npm run build
FROM 404973048572.dkr.ecr.us-east-1.amazonaws.com/nginx:latest
WORKDIR angular
COPY --from=build  /angular/dist/* /usr/share/nginx/html/

