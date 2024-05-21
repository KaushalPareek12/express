# Use official Node.js image as base
FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy application source code
COPY . .

# Install dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]

