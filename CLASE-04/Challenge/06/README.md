 Documentación: Implementación de la  contenerización de aplicacion PokeAPI con Flask


Implementación de PokeAPI con Flask
==========================================================


1\. Crear el archivo Dockerfile:
--------------------------------

    # Usa una imagen base de Python
    FROM python:3.9
    
    # Establece el directorio de trabajo en /app
    WORKDIR /app
    
    # Copia los archivos app.py y pokeapi.py al contenedor en el directorio /app
    COPY app.py pokeapi.py pokeapi.db ./
    COPY templates/* ./templates/
    
    # Instala las dependencias del proyecto
    RUN pip install flask requests
    
    # Expone el puerto 5000 para la aplicación Flask
    EXPOSE 5000
    
    # Ejecuta la aplicación Flask cuando el contenedor se inicie
    CMD ["python", "app.py"]
        

4\. Crear el archivo requirements.txt:
--------------------------------------

    Flask==2.0.3
    requests==2.22.0
    Jinja2==3.1.1 

5\. Crear imagen:
--------------------------------------
*   Abrir una terminal y navegar hasta el directorio raíz del proyecto.
*   Ejecutar el siguiente comando para iniciar los servicios:


    docker build -t camesa/pokeapi:1.0 .

6\. Iniciar los servicios:
--------------------------------------
*   Abrir una terminal y navegar hasta el directorio raíz del proyecto.
*   Ejecutar el siguiente comando para iniciar los servicios:

    
    docker run -p 5000:5000 --name 'pokeapi' camesa/pokeapi:1.0

Con estos pasos, se contenerizara la aplicación Flask y el Consumer usando Docker Compose.
