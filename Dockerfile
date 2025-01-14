# Step 1: Build the Angular application
FROM node:18 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Step 2: Serve the application with nginx
FROM nginx:alpine

# Copy the built Angular application from the previous stage
COPY --from=builder /app/dist/angular-frontend-insomea-internship-2024 /usr/share/nginx/html

# Copy custom Nginx configuration file
COPY ./nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to access the application
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
