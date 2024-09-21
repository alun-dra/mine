# Usa una imagen base de OpenJDK
FROM openjdk:17-jdk-slim

# Establecer variables de entorno para el servidor de Minecraft
ENV MINECRAFT_VERSION=1.18.2
ENV FORGE_VERSION=40.1.0

# Crear el directorio del servidor
WORKDIR /minecraft

# Copiar los archivos del servidor al contenedor
COPY . .

# Instalar Forge sin GUI (modo headless)
RUN java -jar forge-${MINECRAFT_VERSION}-${FORGE_VERSION}-installer.jar --installServer

# Aceptar el EULA de Minecraft automáticamente
RUN echo "eula=true" > eula.txt

# Exponer el puerto del servidor de Minecraft
EXPOSE 25565

# Ejecutar el servidor de Minecraft
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "forge-${MINECRAFT_VERSION}-${FORGE_VERSION}.jar", "nogui"]