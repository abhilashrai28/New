# Use official Nginx image
FROM nginx:latest

# Install unzip utility
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the ZIP file into the container
COPY tailadmin-vuejs-1.0.0.zip /app/

# Remove default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Unzip the site into Nginx default folder
RUN unzip /app/tailadmin-vuejs-1.0.0.zip/* -d /usr/share/nginx/html/

# Expose Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

