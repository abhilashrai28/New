# Use official Nginx image
FROM nginx:latest

# Install unzip utility
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the ZIP file into the container
COPY Electro-Bootstrap-1.0.0.zip /app/

# Remove default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Unzip into a temporary folder
RUN unzip /app/Electro-Bootstrap-1.0.0.zip -d /app/unzipped

# Copy the **contents** of the unzipped folder into Nginx folder
RUN cp -r /app/unzipped/Electro-Bootstrap-1.0.0/. /usr/share/nginx/html/

# Optional cleanup
RUN rm -rf /app/unzipped /app/Electro-Bootstrap-1.0.0.zip

# Expose Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]


