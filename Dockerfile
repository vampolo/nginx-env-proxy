FROM nginx:1.13-alpine
LABEL maintainer="vincenzo.ampolo@gmail.com"

# Configure Nginx and apply fix for very long server names
RUN echo "daemon off;" >> /etc/nginx/nginx.conf \
 && sed -i 's/worker_processes  1/worker_processes  auto/' /etc/nginx/nginx.conf

COPY . /app/
WORKDIR /app

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["nginx"]
