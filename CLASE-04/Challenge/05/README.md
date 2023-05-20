Implementación de Flask y el Consumidor con Docker Compose

1. Crear la aplicación Flask:

Crea un nuevo directorio para tu aplicación Flask.
Dentro del directorio, crea un archivo llamado app.py e implementa tu código de aplicación Flask.
Asegúrate de que el objeto de aplicación Flask se llame app.
2. Crear el consumidor:

Crea un directorio para tu código de consumidor.
Dentro del directorio del consumidor, crea un archivo llamado consumer.py e implementa tu código de consumidor.
3. Crear el archivo Dockerfile:

# Use una imagen base de Python
FROM python:3.8

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo de requisitos
COPY requirements.txt .

# Instala las dependencias
RUN pip install -r requirements.txt

# Copia el código de la aplicación Flask y del consumidor
COPY app.py .
COPY consumer consumer

# Establece las variables de entorno
ENV FLASK_APP=app.py
ENV FLASK_ENV=development
ENV LOCAL=true
ENV PYTHONUNBUFFERED=1

# Expone el puerto
EXPOSE 8000

# Ejecuta la aplicación Flask
CMD flask run --host=0.0.0.0 --port=8000
    
4. Crear el archivo requirements.txt:

Flask==2.0.1
    
5. Crear el archivo docker-compose.yml:

version: "3.8"
services:
  flask-app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8000:8000"
    container_name: lab05

  consumer:
    build:
      context: .
      dockerfile: Dockerfile
    command: python consumer/consumer.py
    
6. Iniciar los servicios:

Abre una terminal y navega hasta el directorio raíz de tu proyecto.
Ejecuta el siguiente comando para iniciar los servicios:
docker-compose up
    
Con estos pasos, puedes contenerizar tu aplicación Flask y el consumidor usando Docker Compose, lo que te permitirá ejecutar y gestionar ambos 
servicios fácilmente.
