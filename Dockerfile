# specifiy a base image

# FROM alpine
FROM node:alpine

WORKDIR /usr/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /usr/app/build /usr/share/nginx/html


# CMD ["npm", "run", "build"]

# COPY . .

# default command 

#CMD ["npm", "run", "start"]

