FROM nginx:alpine

# Salin file build ke direktori default NGINX
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80

