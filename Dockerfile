# syntax=docker/dockerfile:1.4
# Stage 1: Build Flutter Web application
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .
RUN flutter build web --release

# Stage 2: Hardened Nginx runtime
FROM nginx:1.27-alpine AS runner

RUN apk add --no-cache curl

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://127.0.0.1:80/healthz || exit 1

CMD ["nginx", "-g", "daemon off;"]
