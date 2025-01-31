# Base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN npm install

# Build application (opsional, jika diperlukan)
# RUN npm run build

# Expose application port
EXPOSE 3000

# Start application
CMD ["npm", "run", "start"]
