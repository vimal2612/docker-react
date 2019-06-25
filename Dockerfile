FROM node:alpine as builder  

WORKDIR /usr/vimalapp

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

CMD ["npm", "run", "build"] 

FROM nginx
EXPOSE 80
COPY --from=builder /usr/vimalapp/build /usr/share/nginx/html

