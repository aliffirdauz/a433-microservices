# use base image Node.js versi 14.
FROM node:14

# working directory for container is /app.
WORKDIR /app

# copy all the source code to working directory in container.
COPY . .

# make the app running in production mode and using container item-db as database.
ENV NODE_ENV=production 
ENV DB_HOST=item-db

# install all the dependencies.
RUN npm install --production --unsafe-perm && npm run build

# expose port 8080.
EXPOSE 8080

# run the app.
CMD ["npm", "start"]