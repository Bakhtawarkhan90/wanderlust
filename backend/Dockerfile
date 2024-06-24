# Stage 1
FROM node:21 AS backend

# Setup working directory
WORKDIR /app

# Copying code
COPY . .

# Installing dependancies 
RUN npm i

# Stage 2
FROM node:21-slim

# Setup working directory 
WORKDIR /app

# Copy from the above stage as compressed
COPY --from=backend /app .

# copy host ip
COPY  .env.sample .env

# Ports
EXPOSE 5000

# App 
CMD ["npm", "start"]
