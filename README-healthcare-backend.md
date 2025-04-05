# 🩺 Healthcare Backend

This is the backend API for a full-stack Healthcare Management System built with **Django** and **Django REST Framework**. It supports managing patients, doctors, and their mappings, along with secure JWT-based authentication.

---

## 🚀 Features

- ✅ User Registration & JWT Authentication
- ✅ CRUD APIs for Patients & Doctors
- ✅ Patient–Doctor Mapping (assignment/unassignment)
- ✅ Route protection for authenticated users only
- ✅ CORS-enabled for frontend integration
- ✅ Token expiration handling

---

## 🛠️ Tech Stack

- **Python**
- **Django**
- **Django REST Framework**
- **djangorestframework-simplejwt** (for JWT auth)
- **django-cors-headers**
- **SQLite** (default, can be swapped for PostgreSQL)

---

## 📦 Installation

### 1. Clone the repo

```bash
git clone https://github.com/yourusername/healthcare-backend.git
cd healthcare-backend
```

### 2. Set up virtual environment

```bash
python -m venv venv
venv\Scripts\activate     # On Windows
# OR
source venv/bin/activate  # On Mac/Linux
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

## 🔧 Configuration

### Enable CORS for frontend:

In `settings.py`, ensure:

```python
INSTALLED_APPS = [
    ...
    'corsheaders',
    'rest_framework',
    'rest_framework_simplejwt',
    ...
]

MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    ...
]

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    )
}
```

---

## 🔑 API Endpoints

### Auth

- `POST /api/auth/register/` — Register new user
- `POST /api/auth/login/` — Obtain JWT access & refresh tokens

### Patients

- `GET /api/patients/`
- `POST /api/patients/`
- `DELETE /api/patients/<id>/`

### Doctors

- `GET /api/doctors/`
- `POST /api/doctors/`
- `DELETE /api/doctors/<id>/`

### Mappings

- `GET /api/mappings/`
- `POST /api/mappings/`
- `DELETE /api/mappings/<id>/`

> All endpoints require `Authorization: Bearer <access_token>`

---

## ▶️ Running the Server

```bash
python manage.py runserver
```

---

## 🔗 Related Repositories

- 💻 Frontend: [healthcare-frontend](https://github.com/yourusername/healthcare-frontend)

---

## 🙌 Author

Built by **Aarish Alam**  
Feel free to fork, star ⭐, and contribute!