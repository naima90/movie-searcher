ARG NODE_VERSION=18-alpine

# Build the app
FROM node:${NODE_VERSION} AS builder

WORKDIR /app

COPY packages/package*.json ./

RUN npm ci

COPY packages/ .

# build time args for vite
ARG VITE_BASE_URL
ARG VITE_API_KEY
# Vite reads import.meta.env.VITE_* from process env at build time
ENV VITE_BASE_URL=$VITE_BASE_URL
ENV VITE_API_KEY=$VITE_API_KEY

RUN npm run build

# Serve with nginx 
FROM nginx:alpine

# Create a non-root user and group
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx config to listen on port 8080
COPY packages/nginx.conf /etc/nginx/conf.d/default.conf

# Change ownership of nginx directories to non-root user
RUN chown -R appuser:appgroup /usr/share/nginx/html && \
    chown -R appuser:appgroup /var/cache/nginx && \
    chown -R appuser:appgroup /var/log/nginx && \
    chown -R appuser:appgroup /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/run/nginx.pid

# Switch to non-root user
USER appuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
