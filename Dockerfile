ARG NODE_VERSION=18-alpine

FROM node:${NODE_VERSION} AS builder

WORKDIR /app

COPY packages/package*.json ./

RUN npm ci

COPY packages/ .

# build time args for vite
ARG VITE_BASE_URL
ARG VITE_API_KEY

ENV VITE_BASE_URL=$VITE_BASE_URL
ENV VITE_API_KEY=$VITE_API_KEY

RUN npm run build

FROM nginx:alpine

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

COPY --from=builder /app/dist /usr/share/nginx/html


COPY packages/nginx.conf /etc/nginx/conf.d/default.conf

# Change ownership of nginx directories to non-root user
RUN chown -R appuser:appgroup /usr/share/nginx/html && \
    chown -R appuser:appgroup /var/cache/nginx && \
    chown -R appuser:appgroup /var/log/nginx && \
    chown -R appuser:appgroup /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R appuser:appgroup /var/run/nginx.pid

USER appuser

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
