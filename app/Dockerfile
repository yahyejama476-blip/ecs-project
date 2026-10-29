# build stage
FROM node:18.18.2-alpine AS build-stage
# Set environment variables for non-interactive npm installs
ENV NPM_CONFIG_LOGLEVEL=warn
ENV CI=true
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm@9 && pnpm i --frozen-lockfile
COPY . .
RUN NODE_OPTIONS=--max-old-space-size=3072 pnpm exec vite build

# production stage
FROM nginx/nginx-unprivileged:stable-alpine AS production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]