# This one is for production!
# A) BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <--- all the stuff needed for run phase

# B) RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# No need to specify RUN or CMD, nginx will initiate run for us


