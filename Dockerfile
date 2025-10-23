# Build the React.js Application
ARG NODE_VERSION=18-alpine

# Use lightweight Node.js image for building
FROM node:${NODE_VERSION} AS builder

# Set the working directory
WORKDIR /app/packages

# Copy package-related files from packages directory
COPY packages/package.json  packages/package-lock.json ./

# Install dependencies using npm ci
RUN npm install

# Copy the rest of the application source code into the container.
COPY packages/ ./

# build dependencies
RUN npm run build

# runtime stage (simple Node dev server as in your original)
FROM node:${NODE_VERSION} AS runtime
WORKDIR /app/packages
COPY --from=builder /app/packages ./

EXPOSE 8080
CMD ["npm", "run", "dev"]
