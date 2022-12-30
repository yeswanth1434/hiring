FROM node:16
LABEl AUTHOR="yeswanth.in"
LABEl IMAGE="nodejs"

# Create app directory
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]
