# Stage 1: Build the application
FROM node:20 AS builder

# Set build-time arguments
ARG APP_VERSION
ARG BUILD_ENV

# Log build-time arguments
RUN echo "Building with APP_VERSION=${APP_VERSION} and BUILD_ENV=${BUILD_ENV}"

# Set environment variables
ENV APP_VERSION=${APP_VERSION}
ENV BUILD_ENV=${BUILD_ENV}

# Create and change to the app directory
WORKDIR /app

# Copy the application code to the container
COPY package*.json ./
COPY . .

# Install dependencies
RUN npm install

# Stage 2: Run the application
FROM node:20

# Set environment variables
ENV NODE_ENV=production
ENV PORT=3000
ENV APP_VERSION=${APP_VERSION}
ENV BUILD_ENV=${BUILD_ENV}

# Create and change to the app directory
WORKDIR /app

# Copy the build artifacts from the builder stage
COPY --from=builder /app ./

# Log environment variables
RUN echo "Running with APP_VERSION=${APP_VERSION}, BUILD_ENV=${BUILD_ENV}, NODE_ENV=${NODE_ENV}, and PORT=${PORT}"

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]