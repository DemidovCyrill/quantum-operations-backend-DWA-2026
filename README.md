# quantum-operations-backend-DWA-2026

DWA - Development of Web Applications

## Описание проекта

Веб-приложение для работы с квантовыми вентилями (quantum gates) с REST API для использования в SPA.

## Технологический стек

- **Backend:** FastAPI + Uvicorn
- **База данных:** PostgreSQL (asyncpg)
- **ORM:** SQLAlchemy 2.0 (async)
- **Миграции:** Alembic
- **Хранилище файлов:** MinIO
- **Схемы:** Pydantic

## Таблицы БД

### users

| Поле | Тип | Описание |
|------|-----|----------|
| id | INTEGER | Primary Key, Auto Increment |
| username | VARCHAR(64) | Unique, Not Null |
| email | VARCHAR(128) | Unique, Not Null |
| created_at | TIMESTAMP | Not Null, Default: NOW() |

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
| created_at | TIMESTAMP | Not Null, Default: NOW() |
| formed_at | TIMESTAMP | Nullable |

### likes

| Поле | Тип | Описание |
|------|-----|----------|
| id | INTEGER | Primary Key, Auto Increment |
| user_id | INTEGER | Foreign Key → users.id, Not Null |
| gate_id | INTEGER | Foreign Key → gates.id, Not Null |
| created_at | TIMESTAMP | Not Null, Default: NOW() |

**Unique Constraint:** (user_id, gate_id)

## REST API методы

### Домен услуги (gates)

| Метод | URL | Описание |
|-------|-----|----------|
| GET | `/api/gates` | Список опубликованных гейтов с фильтрацией |
| GET | `/api/gates/feed` | Лента опубликованных гейтов |
| GET | `/api/gates/draft` | Получение черновика текущего пользователя |
| POST | `/api/gates` | Добавление нового гейта с файлами |
| PUT | `/api/gates/{id}/publish` | Публикация гейта (смена статуса) |
| DELETE | `/api/gates/{id}` | Удаление гейта (soft delete) |
| POST | `/api/gates/{id}/like` | Поставить/отменить лайк |

### Домен пользователи (users)

| Метод | URL | Описание |
|-------|-----|----------|
| POST | `/api/users/register` | Регистрация нового пользователя |
| POST | `/api/users/login` | Аутентификация (заглушка для 4-й лабораторной) |
| POST | `/api/users/logout` | Деавторизация (заглушка для 4-й лабораторной) |

## Функция-singleton

```python
# core/current_user.py
@lru_cache(maxsize=1)
def get_current_user() -> dict:
    return {"id": 1, "username": "admin", "email": "admin@example.com"}
```

## Запуск проекта

```bash
# Установка зависимостей
pip install -r requirements.txt

# Запуск миграций
alembic upgrade head

# Запуск сервера
uvicorn main:app --reload
```

## Тестирование

Тестирование через Insomnia/Postman:

1. GET списка услуг (с фильтром)
2. Добавить новую услугу с картинкой и видео
3. Получить поля черновика
4. Опубликовать услугу
5. Получить ленту без ид
6. Получить ленту по ид ?next=true
7. Поставить лайк
8. Удалить услугу
9. Зарегистрировать нового пользователя
