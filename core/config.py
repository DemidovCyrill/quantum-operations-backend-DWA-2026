from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    DB_HOST: str = "127.0.0.1"
    DB_PORT: int = 5433
    DB_USER: str
    DB_PASSWORD: str
    DB_NAME: str

    MINIO_URL: str = "http://127.0.0.1:9000/quantum-operations"
    USE_MINIO: bool = True
    CURRENT_USER_ID: int = 1

    @property
    def DATABASE_URL(self) -> str:
        return (
            f"postgresql+asyncpg://{self.DB_USER}:{self.DB_PASSWORD}"
            f"@{self.DB_HOST}:{self.DB_PORT}/{self.DB_NAME}"
        )

    @property
    def MEDIA_PREFIX(self) -> str:
        return self.MINIO_URL if self.USE_MINIO else "/static/img"

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")


settings = Settings()