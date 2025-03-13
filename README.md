A simple Student CRUD REST API built with Flask, following best practices and the Twelve-Factor App methodology.

📋 Project Overview

This API allows you to perform CRUD operations on student records:

Create a new student.

Retrieve all students.

Retrieve a student by ID.

Update an existing student.

Delete a student.

⚙️ Setup Instructions

1. Clone the Repository

git clone https://github.com/YOUR_USERNAME/student-api.git
cd student-api

2. Create Virtual Environment and Install Dependencies

python -m venv venv
source venv/bin/activate  # For Linux/Mac
venv\Scripts\activate    # For Windows
pip install -r requirements.txt

3. Set Up Environment Variables

Create a .env file in the project root:

DATABASE_URL=sqlite:///students.db
FLASK_APP=wsgi.py
FLASK_DEBUG=1

4. Run Database Migrations

flask db upgrade

5. Run the Server

flask --app wsgi run --host=0.0.0.0 --port 5000

The server will run at: http://127.0.0.1:5000

📌 API Endpoints

Health Check: GET /api/v1/healthcheck

Create Student: POST /api/v1/students

Get All Students: GET /api/v1/students

Get Student by ID: GET /api/v1/students/<id>

Update Student: PUT /api/v1/students/<id>

Delete Student: DELETE /api/v1/students/<id>

🧪 Running Tests

(Coming soon!)

📫 Postman Collection

Import the postman_collection.json file to easily test all endpoints.

🚀 Future Enhancements

Add authentication.

Improve input validation.

Add unit tests.

🤝 Contributing

Feel free to fork the repo and submit pull requests. Feedback is always welcome!

📄 License

MIT License

