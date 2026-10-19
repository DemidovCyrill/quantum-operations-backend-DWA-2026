# quantum-operations-backend-DWA-2026

DWA - Development of Web Applications

## Описание проекта

Веб-приложение для работы с квантовыми вентилями (quantum gates) с REST API для использования в SPA.

## Технологический стек

- **Backend:** FastAPI + Uvicorn
- **База данных:** PostgreSQL (asyncpg)
- **ORM:** SQLAlchemy 2.0 (async)
- **Миграции:** Alembic
- **Хранилище файлов:** MinIO (по умолчанию отключено)
- **Хранилище сессий:** Redis
- **Схемы:** Pydantic

## Таблицы БД

### users

| Поле | Тип | Описание |
|------|-----|----------|
| id | INTEGER | Primary Key, Auto Increment |
| username | VARCHAR(64) | Unique, Not Null |
| email | VARCHAR(128) | Unique, Not Null |
| password | VARCHAR(128) | Not Null |

### gates

| Поле | Тип | Описание |
|------|-----|----------|
| id | INTEGER | Primary Key, Auto Increment |
| title | VARCHAR(128) | Not Null |
| summary | VARCHAR(512) | Nullable |
| status | VARCHAR(16) | Not Null, Default: 'draft', Check: ('draft','published','deleted') |
| image_url | VARCHAR(255) | Not Null |
| video_url | VARCHAR(255) | Not Null |
| angle_x | INTEGER | Not Null, Default: 0 |
| angle_y | INTEGER | Not Null, Default: 0 |
| creator_id | INTEGER | Foreign Key → users.id, Not Null |

### likes

| Поле | Тип | Описание |
|------|-----|----------|
| id | INTEGER | Primary Key, Auto Increment |
| user_id | INTEGER | Foreign Key → users.id, Not Null |
| gate_id | INTEGER | Foreign Key → gates.id, Not Null |

**Unique Constraint:** (user_id, gate_id)

## REST API методы

### Аутентификация

| Метод | URL | Описание | Доступ |
|-------|-----|----------|--------|
| POST | `/api/users/register` | Регистрация нового пользователя | Все |
| POST | `/api/users/login` | Аутентификация (создаёт сессию в Redis) | Все |
| POST | `/api/users/logout` | Деавторизация (удаляет сессию из Redis) | Все |

### Гейты

| Метод | URL | Описание | Доступ |
|-------|-----|----------|--------|
| GET | `/api/gates` | Список опубликованных гейтов с фильтрацией | Все |
| GET | `/api/gates/feed` | Лента опубликованных гейтов | Все |
| GET | `/api/gates/draft` | Черновик текущего пользователя | Авторизованные |
| POST | `/api/gates` | Создание гейта с файлами | Авторизованные |
| PUT | `/api/gates/{id}/publish` | Публикация гейта | Авторизованные |
| DELETE | `/api/gates/{id}` | Удаление гейта (soft delete) | Авторизованные |
| POST | `/api/gates/{id}/like` | Поставить/отменить лайк | Авторизованные |

## Аутентификация

- **Тип:** Сессии через Redis
- **Cookie:** `session_id` (httponly)
- **TTL сессии:** 24 часа

## Запуск проекта

```bash
# Установка зависимостей
pip install -r requirements.txt

# Запуск Redis (отдельно)
redis-server

# Запуск миграций
alembic upgrade head

# Запуск сервера
uvicorn main:app --reload
```

## Swagger

Документация Swagger доступна по адресу: `http://127.0.0.1:8000/docs`
