# Usa una imagen base de OpenJDK
FROM openjdk:17-jdk-slim

# Establecer variables de entorno para el servidor de Minecraft
ENV MINECRAFT_VERSION=1.18.2
ENV FORGE_VERSION=40.2.0

# Crear el directorio del servidor
WORKDIR /minecraft

# Copiar todos los archivos del directorio actual al contenedor
COPY . /minecraft/

# Listar los archivos para verificar que todo está copiado correctamente
RUN ls -la

# Instalar Forge sin GUI (modo headless)
RUN java -jar forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer

# Aceptar el EULA de Minecraft automáticamente
RUN echo "eula=true" > eula.txt

# Exponer el puerto del servidor de Minecraft
EXPOSE 25565

# Ejecutar el servidor de Minecraft
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "forge-1.18.2-40.2.0.jar", "nogui"]
