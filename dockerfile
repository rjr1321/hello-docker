# Imagen base pequeña
FROM node:20-alpine

# Variables de entorno
ENV NODE_ENV=production
ENV PORT=3000

# Crea directorio de trabajo
WORKDIR /app

# Copia solo lo necesario
COPY package.json ./
COPY server.js ./
COPY .dockerignore ./

# No hay dependencias, pero si tuvieras, correrías:
# RUN npm ci --only=production

# Expone el puerto
EXPOSE 3000

# Usuario no root por buenas prácticas
RUN addgroup -S nodegroup && adduser -S nodeuser -G nodegroup
USER nodeuser

# Comando por defecto
CMD ["npm", "start"]
