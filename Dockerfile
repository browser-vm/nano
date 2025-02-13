# Use the official Node.js 20 image from the Docker Hub
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package and lock files to the working directory
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN npm install -g pnpm && pnpm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application
RUN pnpm run build

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["pnpm", "run", "start"]