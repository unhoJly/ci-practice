# ci-practice

Минимальный Spring Boot REST-сервис для самостоятельной практики первого CI-сценария в GitHub Actions.

## Стек

- Java 21
- Spring Boot 3
- Maven

## Запуск тестов

```bash
mvn test
```

## Запуск приложения

```bash
mvn spring-boot:run
```

Затем: `GET http://localhost:8080/api/hello`
