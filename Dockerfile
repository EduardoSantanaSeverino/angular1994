# stage 1
FROM node:14 as node
WORKDIR /app
COPY . .
RUN yarn install && yarn run build
# stage 2
FROM nginx
COPY --from=node /app/dist/angular1994 /usr/share/nginx/html
COPY fast-nginx-default.conf /etc/nginx/conf.d/default.conf
