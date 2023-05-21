 Documentación: Implementación de la contenerización de Pokemon DevOps


Implementación de "Pokemon DevOps" con Docker Compose
==========================================================


1\. Crear el archivo Dockerfile del backend:
--------------------------------

    # Usa una imagen base de Python
    FROM python:3.8
    
    # Establece el directorio de trabajo en /app
    WORKDIR /app
    
    # Copia los archivos app.py y pokeapi.py al contenedor en el directorio /app
    COPY main.py test_main.py requirements.txt /app
    
    # Instala las dependencias del proyecto
    RUN pip install --no-cache-dir -r requirements.txt
    
    # Expone el puerto 5000 para la aplicación Flask
    EXPOSE 8000
    
    # Ejecuta la aplicación Flask cuando el contenedor se inicie
    CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
        
2\. Crear el archivo requirements.txt:
--------------------------------------

    fastapi
    uvicorn
    requests
    pytest
    
3\. Crear el archivo Dockerfile del frontend:
--------------------------------

    # Utiliza la imagen base de Node.js
    FROM node:14
    
    # Establece el directorio de trabajo dentro del contenedor
    WORKDIR /app
    
    # Copia los archivos de la aplicación al contenedor
    COPY . ./
    
    # Instala las dependencias del frontend
    RUN npm install
    
    # Construye la aplicación
    RUN npm run build
    
    # Expone el puerto 3000 para acceder al sitio web
    EXPOSE 3000
    
    # Inicia el servidor de desarrollo
    CMD ["npm", "start"]
    
4\. Crear el archivo docker-compose.yml
--------------------------------

    version: "3"
    services:
      backend-fastapi:
        build:
          context: ./backend-pokemon-app
          dockerfile: Dockerfile
        image: backend_pokemon:1.0.0
        ports:
          - "8000:8000"
    
      frontend-pokemon:
        build:
          context: ./frontend-pokemon-app
          dockerfile: Dockerfile
        image: frontend_pokemon:1.0.0
        ports:
          - "3000:3000"
        environment:
          - REACT_APP_URL_DEVELOPMENT=http://localhost:8000
          - REACT_APP_URL_PRODUCTION=http://localhost:8000

    
5\. Crear imagen y levantar contenedores utilizando docker-compose:
--------------------------------------
*   Abrir una terminal y navegar hasta el directorio raíz del proyecto.
*   Ejecutar el siguiente comando para iniciar los servicios:


    docker-compose up


Con estos pasos, se contenerizara la aplicacion de Pokemon DevOps
