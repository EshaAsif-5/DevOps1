# Use the official Nginx image as the base
FROM nginx:alpine

# Copy all files from your project folder to the Nginx HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 for web access
EXPOSE 80

# Start Nginx (this is the default command in the base image)
CMD ["nginx", "-g", "daemon off;"]
