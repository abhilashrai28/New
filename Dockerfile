# Use official Nginx image
FROM nginx:latest
# Set a working directory
WORKDIR /app
# Copy local website files to WORKDIR
COPY . /app
# Copy files from WORKDIR to Nginx dafault serve directory
RUN cp -r /app/* /usr/share/nginx/html/
# Expose default nginx port
EXPOSE 80
# Start nginx
CMD ["nginx", "-g", "daemon off;"]
