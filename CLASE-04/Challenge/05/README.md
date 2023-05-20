 Documentación: Implementación de la  contenerización de una aplicación Flask y Consumer


Implementación de Flask y el Consumer con Docker Compose
==========================================================


1\. Crear el archivo Dockerfile:
--------------------------------

    # Imagen base
    FROM python:3.8
    
    # Establecer el directorio de trabajo dentro del contenedor
    WORKDIR /app
    
    # Copiar los archivos de dependencias e instalarlas
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt
    
    # Copiar los archivos de la aplicación y el consumidor al contenedor
    COPY app app
    COPY consumer consumer
    
    # Establecer las variables de entorno
    ENV LOCAL=true
    ENV PYTHONUNBUFFERED="1"
    ENV FLASK_APP=app.main
    
    # Exponer el puerto en el que se ejecuta la aplicación Flask
    EXPOSE 8000
    
    # Comando para ejecutar la aplicación Flask
    CMD ["flask", "run", "--host=0.0.0.0"]
        

4\. Crear el archivo requirements.txt:
--------------------------------------

    Flask
    requests    

5\. Crear el archivo docker-compose.yml:
----------------------------------------

    version: "3.8"
    version: "3.8"
    services:
      service-flask-app:
        build:
          context: .
          dockerfile: Dockerfile
        ports:
          - "8000:8000"
        environment:
          - FLASK_APP=app/app.py
          - FLASK_ENV=development
        command: flask run --host=0.0.0.0 --port=8000
        container_name: lab05-flask
    
      consumer:
        build:
          context: .
          dockerfile: Dockerfile
        environment:
          - LOCAL=true
          - PYTHONUNBUFFERED=1
        command: python consumer/consumer.py
        container_name: lab05-consumer
        

6\. Iniciar los servicios:
--------------------------

*   Abrir una terminal y navegar hasta el directorio raíz "/src" del proyecto.
*   Ejecuta el siguiente comando para iniciar los servicios:

    docker-compose up
        

Con estos pasos, se contenerizara la aplicación Flask y el Consumer usando Docker Compose.
