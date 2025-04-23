FROM n8nio/n8n:latest

USER root

# Instalar ffmpeg utilizando Alpine package manager
RUN apk add --no-cache ffmpeg

# Cambiar de vuelta al usuario node
USER node