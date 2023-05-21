 Documentación: Implementación de la contenerización la aplicacion Python con Redis


Implementación de aplicacion Python con Redis
==========================================================


1\. Crear el archivo Dockerfile:
--------------------------------

     # Define la imagen base
    FROM python:3.8
    
    # Establece el directorio de trabajo en el contenedor
    WORKDIR /app
    
    # Copia los archivos de la aplicación en el contenedor
    COPY requirements.txt .
    COPY app.py .
    
    # Instala las dependencias de la aplicación
    RUN pip install --no-cache-dir -r requirements.txt
    
    # Expone el puerto 80 para la aplicación Flask
    EXPOSE 80
    
    # Ejecuta la aplicación cuando se inicie el contenedor
    CMD ["python", "app.py"]

        
2\. Crear el archivo requirements.txt:
--------------------------------------

    flask
    redis

    
3\. Crear el archivo docker-compose.yml
--------------------------------

     version: '3'
    services:
      web:
        build:
          context: .
          dockerfile: Dockerfile
        ports:
          - 80:80
        depends_on:
          - redis
        restart: always
      redis:
        image: redis
        ports:
          - 6379:6379
        restart: always


    
4\. Crear imagen y levantar contenedores utilizando docker-compose:
--------------------------------------
*   Abrir una terminal y navegar hasta el directorio raíz del proyecto.
*   Ejecutar el siguiente comando para iniciar los servicios:


    docker-compose up


Con estos pasos, se contenerizara la aplicacion de Pokemon DevOps
