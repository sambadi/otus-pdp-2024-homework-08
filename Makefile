install:  # установка зависимостей
	cd ./app &&	uv sync

lint: # проверка кода с помощью pre-commit
	cd ./app && uv run pre-commit run --all-files

docker-up: # запуск на исполнение с помощью docker
	docker compose up --build -d && cd ./app && uv run python -m webbrowser "http://localhost:8080/"

docker-down: # останов запущенного с помощью docker инстанса
	docker compose down -v --rmi local