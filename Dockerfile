# Usa una imagen base de OpenJDK
FROM openjdk:17-jdk-slim

# Establecer variables de entorno para el servidor de Minecraft
ENV MINECRAFT_VERSION=1.18.2
ENV FORGE_VERSION=40.1.0

# Crear el directorio del servidor
WORKDIR /minecraft

# Copiar los archivos del servidor al contenedor
COPY . .

# Aceptar el EULA de Minecraft automáticamente
RUN echo "eula=true" > eula.txt

# Exponer el puerto del servidor de Minecraft
EXPOSE 25565

# Ejecutar el servidor
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "forge-1.18.2-40.2.0.jar", "nogui"]

