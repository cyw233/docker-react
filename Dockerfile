# Build the application
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# Output the build folder in the container: /app/build
RUN npm run build

# Copy the build folder the host it on nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html