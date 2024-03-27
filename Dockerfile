# Використання базового образу Python
FROM python:3.11.8

# Встановлення залежностей
RUN pip install pipenv

# Встановлення робочого каталогу в контейнері
WORKDIR /usr/src/app

# Копіювання файлів проекту в контейнер
COPY Pipfile Pipfile.lock ./

# Встановлення домашньої роботи "Персональний помічник" через pipenv
RUN pipenv install --deploy --ignore-pipfile

# Копіювання код проекту у контейнер
COPY . .

# Команда для запуску домашньої роботи "Персональний помічник"
CMD ["pipenv", "run", "python", "bot.py"]