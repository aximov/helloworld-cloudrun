FROM node:14-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./
COPY yarn.lock ./

# Install production dependencies.
RUN yarn --production --frozen-lockfile

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD [ "yarn", "start" ]