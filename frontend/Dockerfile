# Stage 1
FROM node:21 AS frontend 

WORKDIR /app
 
COPY . .
 
RUN npm i

# Stage 2
FROM node:21-slim

WORKDIR /app

COPY --from=frontend /app . 

COPY .env.sample .env.local 

EXPOSE 5173 
 
CMD ["npm","run","dev","--","--host"] 
