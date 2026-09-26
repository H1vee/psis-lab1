FROM nginx:1.27-alpine

LABEL org.opencontainers.image.title="lab1-psis" \
      org.opencontainers.image.description="Static site about digital signatures, served by nginx"

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY site/ /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --spider -q http://127.0.0.1/ || exit 1
