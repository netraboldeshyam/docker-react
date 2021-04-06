FROM node:alpine
WORKDIR /APP
COPY package.json .
RUN npm install
ADD . .
RUN npm run build


FROM nginx
COPY --from=0 /APP/build /usr/share/nginx/html

