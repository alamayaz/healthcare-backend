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
- ✅ Docker containerization for easy deployment

---

## 🛠️ Tech Stack

- **Python**
- **Django**
- **Django REST Framework**
- **djangorestframework-simplejwt** (for JWT auth)
- **django-cors-headers**
- **SQLite** (development) / **PostgreSQL** (production)
- **Docker** & **Docker Compose**

---

## 📦 Installation

### Option 1: Using Docker (Recommended)

```bash
# Clone the repository
git clone https://github.com/yourusername/healthcare-backend.git
cd healthcare-backend

# Create .env file from example
cp .env.example .env

# Start the containers
docker-compose up -d

# The API will be available at http://localhost:8000
```

### Option 2: Manual Setup

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

## 🐳 Docker Setup

This project is containerized using Docker for easy deployment and consistency across environments.

### Prerequisites

- Docker
- Docker Compose

### Running with Docker

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Build and start the containers:
   ```bash
   docker-compose up -d
   ```

3. The application will be available at `http://localhost:8000`

### Docker Environment Variables

You can modify the following environment variables in the `.env` file:

- `DB_NAME`: PostgreSQL database name
- `DB_USER`: Database username
- `DB_PASSWORD`: Database password
- `DJANGO_SUPERUSER_USERNAME`: Admin username (created on startup)
- `DJANGO_SUPERUSER_PASSWORD`: Admin password
- `DJANGO_SUPERUSER_EMAIL`: Admin email

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

- 💻 Frontend: [healthcare-frontend](https://github.com/alamayaz/healthcare-frontend)

---

## 🙌 Author

Built by **Ayaz Alam**  
Feel free to fork, star ⭐, and contribute!
