# Specify the base image
FROM node:16-alpine

# Arguments
ARG PORT
ARG MONGO_URI
ARG ORIGIN
ARG ACCESS_TOKEN_SECRET
ARG TOKEN_EXPIRE_TIME
ARG DEMO_PASSWORD

# Set environment variables
ENV PORT=${PORT}
ENV MONGO_URI=${MONGO_URI}}
ENV ORIGIN=${ORIGIN}
ENV ACCESS_TOKEN_SECRET=${ACCESS_TOKEN_SECRET}
ENV TOKEN_EXPIRE_TIME=${TOKEN_EXPIRE_TIME}
ENV DEMO_PASSWORD=${DEMO_PASSWORD}}

# Create a working directory
WORKDIR /usr/src/app

# Copy package and lock files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the TypeScript code
RUN yarn build

# Expose the port
EXPOSE ${PORT}

# Start the server
CMD ["yarn", "start"]
