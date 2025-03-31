# Dermofarm - Automatización con n8n

Este repositorio contiene la configuración de n8n para Dermofarm, una plataforma de automatización de flujos de trabajo que permite integrar y automatizar diferentes servicios y aplicaciones.

## 🏢 Sobre Dermofarm

Dermofarm es una empresa líder en el sector farmacéutico que utiliza n8n para automatizar sus procesos internos y mejorar la eficiencia operativa.

## 🚀 Características

- Instalación de n8n con autenticación básica
- Base de datos PostgreSQL para almacenamiento persistente
- Nginx Proxy Manager para gestión de dominios y SSL
- Adminer para gestión de base de datos
- Configuración segura mediante variables de entorno

## 📋 Prerrequisitos

- Docker
- Docker Compose
- Dominio configurado (apps.agentes.dermofarm.com)

## 🛠️ Instalación

1. Clona este repositorio:

```bash
git clone [URL_DEL_REPOSITORIO]
cd n8n
```

2. Crea el archivo `.env` basado en `.env.example`:

```bash
cp .env.example .env
```

3. Edita el archivo `.env` con tus credenciales:

```env
# N8N Credentials
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=tu_contraseña_segura

# Database Credentials
POSTGRES_USER=n8n_user
POSTGRES_PASSWORD=tu_contraseña_db_segura
POSTGRES_DB=n8n_db

# Domain Configuration
N8N_HOST=apps.agentes.dermofarm.com
N8N_PROTOCOL=https
N8N_PORT=443
WEBHOOK_TUNNEL_URL=https://apps.agentes.dermofarm.com
N8N_EDITOR_BASE_URL=https://apps.agentes.dermofarm.com
N8N_WEBHOOK_URL=https://apps.agentes.dermofarm.com
```

4. Dale permisos de ejecución al script de inicio:

```bash
chmod +x start.sh
```

5. Inicia los servicios:

```bash
./start.sh
```

## 🌐 Acceso a los Servicios

Una vez iniciados los servicios, podrás acceder a:

- **n8n**: https://apps.agentes.dermofarm.com
- **Adminer**: http://localhost:8080
- **Nginx Proxy Manager**: http://localhost:81

## 🔒 Seguridad

- Todas las credenciales sensibles están almacenadas en el archivo `.env`
- Se utiliza HTTPS para todas las conexiones externas
- Autenticación básica activada para n8n
- Permisos de archivo reforzados para n8n

## 📦 Estructura del Proyecto

```
n8n/
├── .env                    # Variables de entorno (crear basado en .env.example)
├── .env.example           # Ejemplo de variables de entorno
├── docker-compose.yml     # Configuración de Docker Compose
├── start.sh              # Script de inicio
├── .n8n/                 # Datos persistentes de n8n
├── .db/                  # Datos persistentes de PostgreSQL
├── .npm_data/           # Datos persistentes de Nginx Proxy Manager
└── .npm_letsencrypt/    # Certificados SSL
```

## 🔄 Mantenimiento

### Actualización de Contenedores

Para actualizar los contenedores a sus últimas versiones:

```bash
docker-compose pull
docker-compose up -d
```

### Respaldo de Datos

Los datos importantes se encuentran en los siguientes directorios:

- `.n8n/`: Flujos de trabajo y configuraciones de n8n
- `.db/`: Base de datos PostgreSQL
- `.npm_data/`: Configuraciones de Nginx Proxy Manager

## 🆘 Soporte

Para reportar problemas o solicitar soporte:

1. Contacta al equipo de soporte técnico de Dermofarm
2. Proporciona los logs relevantes del contenedor afectado
3. Describe el problema en detalle

## 📝 Notas Adicionales

- Asegúrate de mantener actualizado el archivo `.env` con las credenciales correctas
- Realiza copias de seguridad periódicas de los directorios de datos
- Monitorea el uso de recursos de los contenedores

## ⚖️ Licencia

Este proyecto es propiedad de Dermofarm y está protegido por derechos de autor.
