# Коллекция услуг (квантовых гейтов).
# Поля: id, title, description, angle_x, angle_y, image_key, video_key,
#        status ("draft" | "published" | "deleted"), likes (список ID пользователей)

# ID текущего пользователя (учебное упрощение: у нас один "залогиненный" юзер)
CURRENT_USER_ID = 999

gates = [
    {
        "id": 1,
        "title": "Гейт Паули-X",
        "description": (
            "Однокубитный гейт, выполняющий поворот вектора состояния "
            "вокруг оси X на угол angle_x. Аналог классического NOT."
        ),
        "angle_x": 180,
        "angle_y": 0,
        "image_key": "pauli_x.png",
        "video_key": "pauli_x.mp4",
        "status": "published",
        "likes": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    },
    {
        "id": 2,
        "title": "Гейт Адамара",
        "description": (
            "Создаёт суперпозицию: переводит |0> в (|0>+|1>)/sqrt(2). "
            "Ключевой гейт для квантового параллелизма."
        ),
        "angle_x": 90,
        "angle_y": 90,
        "image_key": "hadamard.png",
        "video_key": "hadamard.mp4",
        "status": "published",
        "likes": [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31],
    },
    {
        "id": 3,
        "title": "Гейт CNOT",
        "description": (
            "Двухкубитный гейт: инвертирует целевой кубит, если управляющий "
            "находится в |1>. Базовый элемент запутанности."
        ),
        "angle_x": 180,
        "angle_y": 180,
        "image_key": "cnot.png",
        "video_key": "cnat.mp4",
        "status": "published",
        "likes": [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24],
    },
    {
        "id": 4,
        "title": "Фазовый гейт S",
        "description": (
            "Добавляет фазовый сдвиг pi/2 к состоянию |1>. "
            "Основа для гейтов T и фазовых вращений."
        ),
        "angle_x": 0,
        "angle_y": 90,
        "image_key": "phase_s.png",
        "video_key": "video.mp4",
        "status": "published",
        "likes": [1, 2, 4, 8],
    },
    {
        "id": 5,
        "title": "Гейт Паули-Z",
        "description": (
            "Фазовый гейт: добавляет -1 к состоянию |1>. "
            "Не меняет вероятности измерения, только знак амплитуды."
        ),
        "angle_x": 0,
        "angle_y": 180,
        "image_key": "pauli_z.png",
        "video_key": "pauli_z.mp4",
        "status": "published",
        "likes": [3, 6, 9, 12, 15],
    },
    {
        # ЧЕРНОВИК — отображается на странице добавления
        "id": 6,
        "title": "Новый гейт (черновик)",
        "description": "Описание появится после заполнения формы.",
        "angle_x": 0,
        "angle_y": 0,
        "image_key": "pauli_y.png",
        "video_key": "pauli_y.mp4",
        "status": "draft",
        "likes": [],
    },
]