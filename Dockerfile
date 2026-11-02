FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /workspace

# Копируем только файл зависимостей
COPY pom.xml ./

# Качаем зависимости через обычный mvn
RUN mvn -B dependency:go-offline

COPY src/ src/

# Собираем проект через обычный mvn
RUN mvn -B clean package -DskipTests && \
    JAR_FILE=$( \
      find target -maxdepth 1 -type f -name '*.jar' \
      ! -name '*.original' | head -n 1 \
    ) && \
    cp "$JAR_FILE" target/app.jar

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /workspace/target/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]