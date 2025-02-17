# Восьмое ДЗ в рамках обучения на курсах Otus

Django tutorial

Пройден туториал [django](https://docs.djangoproject.com/en/5.0/intro/tutorial01/), приложение обёрнуто в docker,
настройки приложения вынесены в переменные окружения, как и рекомендовано в 12 factor app. Настроена возможность деплоя 
приложения с использованием docker-compose.

## Запуск проекта

Для запуска проекта достаточно:

- склонировать репозиторий;
- запустить приложение на выполнение

```shell
make docker-up
```

Для запуска линтера понадобится:

- установить Python 3.12 любым доступным способом;
- установить [uv](https://docs.astral.sh/uv/getting-started/installation/getting-started/installation/)

# Использование Makefile

Для удобства использования в проект добавлена поддержка make actions. Доступны следующий команды:

- установка зависимостей
```shell
make install
```
 - запуск проверки кода;
```shell
make lint
```
- запуск приложения в docker и запуск браузера по-умолчанию с url='http://localhost:8080'
```shell
make docker-up
```
- завершение приложения в docker и удаление всех связанных с ним контейнеров/образов/volumes
```shell
make docker-down
```