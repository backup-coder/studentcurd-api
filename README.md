# Student CRUD REST API

A simple Student CRUD REST API built with Flask, following best practices and the Twelve-Factor App methodology.

## 📋 Project Overview
This API allows you to perform CRUD operations on student records:
- Create a new student.
- Retrieve all students.
- Retrieve a student by ID.
- Update an existing student.
- Delete a student.

## ⚙️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/student-api.git
cd student-api
```

### 2. Create Virtual Environment and Install Dependencies
```bash
python -m venv venv
source venv/bin/activate  # For Linux/Mac
venv\Scripts\activate    # For Windows
pip install -r requirements.txt
```

### 3. Set Up Environment Variables
Create a `.env` file in the project root:
```
DATABASE_URL=sqlite:///students.db
FLASK_APP=wsgi.py
FLASK_DEBUG=1
```

### 4. Run Database Migrations
```bash
flask db upgrade
```

### 5. Run the Server
```bash
flask --app wsgi run --host=0.0.0.0
```
The server will run at: `http://127.0.0.1:5000`

## 🐳 Docker Setup

### 1. Build the Docker Image
```bash
make docker-build VERSION=1.0.0
```

### 2. Run the Container
```bash
make docker-run VERSION=1.0.0
```
The API will now be accessible at `http://127.0.0.1:5000`.

### 3. Stop the Container
```bash
make docker-stop
```

### 4. Clean Up Docker Images
```bash
make docker-clean VERSION=1.0.0
```

## 📌 API Endpoints

- **Health Check:** `GET /api/v1/healthcheck`
- **Create Student:** `POST /api/v1/students`
- **Get All Students:** `GET /api/v1/students`
- **Get Student by ID:** `GET /api/v1/students/<id>`
- **Update Student:** `PUT /api/v1/students/<id>`
- **Delete Student:** `DELETE /api/v1/students/<id>`

## 🧪 Running Tests
(Coming soon!)

## 📫 Postman Collection
Import the `postman_collection.json` file to easily test all endpoints.

## 🚀 Future Enhancements
- Add authentication.
- Improve input validation.
- Add unit tests.

## 🤝 Contributing
Feel free to fork the repo and submit pull requests. Feedback is always welcome!

## 📄 License
MIT License


