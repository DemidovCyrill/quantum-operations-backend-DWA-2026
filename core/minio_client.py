"""
Клиент для работы с MinIO.
В лабораторной 3 используется для хранения файлов изображений и видео.
"""

import os
from pathlib import Path
from typing import Optional

from minio import Minio
from minio.error import S3Error


# Конфигурация MinIO
MINIO_ENDPOINT = os.getenv("MINIO_ENDPOINT", "127.0.0.1:9000")
MINIO_ACCESS_KEY = os.getenv("MINIO_ACCESS_KEY", "minioadmin")
MINIO_SECRET_KEY = os.getenv("MINIO_SECRET_KEY", "minioadmin")
MINIO_BUCKET = os.getenv("MINIO_BUCKET", "quantum-operations")
MINIO_SECURE = os.getenv("MINIO_SECURE", "false").lower() == "true"


def get_minio_client() -> Minio:
    """Возвращает клиент MinIO."""
    return Minio(
        MINIO_ENDPOINT,
        access_key=MINIO_ACCESS_KEY,
        secret_key=MINIO_SECRET_KEY,
        secure=MINIO_SECURE
    )


def ensure_bucket_exists(client: Minio, bucket_name: str = MINIO_BUCKET) -> None:
    """Создаёт бакет, если он не существует."""
    if not client.bucket_exists(bucket_name):
        client.make_bucket(bucket_name)


def upload_file(
    file_path: str,
    object_name: str,
    bucket_name: str = MINIO_BUCKET
) -> Optional[str]:
    """
    Загружает файл в MinIO.
    Возвращает URL файла или None в случае ошибки.
    """
    try:
        client = get_minio_client()
        ensure_bucket_exists(client, bucket_name)
        client.fput_object(bucket_name, object_name, file_path)
        return f"/{bucket_name}/{object_name}"
    except S3Error as e:
        print(f"Ошибка загрузки файла в MinIO: {e}")
        return None


def upload_file_from_bytes(
    file_data: bytes,
    object_name: str,
    bucket_name: str = MINIO_BUCKET
) -> Optional[str]:
    """
    Загружает файл из байтов в MinIO.
    Возвращает URL файла или None в случае ошибки.
    """
    try:
        client = get_minio_client()
        ensure_bucket_exists(client, bucket_name)
        from io import BytesIO
        client.put_object(
            bucket_name,
            object_name,
            BytesIO(file_data),
            length=len(file_data)
        )
        return f"/{bucket_name}/{object_name}"
    except S3Error as e:
        print(f"Ошибка загрузки файла в MinIO: {e}")
        return None


def get_file_url(object_name: str, bucket_name: str = MINIO_BUCKET) -> str:
    """Возвращает URL файла в MinIO."""
    return f"/{bucket_name}/{object_name}"


def delete_file(object_name: str, bucket_name: str = MINIO_BUCKET) -> bool:
    """Удаляет файл из MinIO. Возвращает True в случае успеха."""
    try:
        client = get_minio_client()
        client.remove_object(bucket_name, object_name)
        return True
    except S3Error as e:
        print(f"Ошибка удаления файла из MinIO: {e}")
        return False
