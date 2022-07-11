FROM node:alpine as build

WORKDIR /usr/app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.15
COPY --from=build /usr/app/build/ /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
