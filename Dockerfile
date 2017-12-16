# Define from what image we want to build from 
FROM node:7
# Setting enviroment variable PORT that specify the port number to use
ENV PORT=3000
# Setting enviroment variable DB_URL that specify the mongo database url to use
ENV DB_URL='mongodb://john:doe@localhost:27017/databaseName'
# Setting enviroment variable NODE_ENV that specify the the production enviroment
ENV NODE_ENV production
# Create app directory
RUN mkdir -p /usr/src/app
# sets this newly created directory as the working directory for subsequent actions 
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
# Building the code for production
RUN npm install --only=production
# Bundle app source
COPY . .
# Exposes a port which the container will listen on.
EXPOSE 3000
# Sets the default command to execute our container.
CMD [ "npm", "start" ]
