from flask import Blueprint, request, jsonify
from app.utils import db
from app.models import Student
import logging

# Setup logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

# Define Blueprint
student_bp = Blueprint('student_bp', __name__, url_prefix='/api/v1')

# Healthcheck Endpoint
@student_bp.route('/healthcheck', methods=['GET'])
def healthcheck():
    logger.info("Healthcheck endpoint called")
    return jsonify({'status': 'healthy'}), 200

# Create Student
@student_bp.route('/students', methods=['POST'])
def create_student():
    try:
        data = request.get_json()
        logger.info(f"Raw request data: {request.data}")  # Log raw request data
        if not data or not all(k in data for k in ('name', 'age', 'email')):
            logger.warning("Invalid request data for student creation")
            return jsonify({'error': 'Invalid request data. Ensure name, age, and email are provided.'}), 400
        logger.info(f"Received data for student creation: {data}")
        new_student = Student(name=data['name'], age=data['age'], email=data['email'])
        db.session.add(new_student)
        db.session.commit()
        return jsonify(new_student.to_dict()), 201
    except Exception as e:
        logger.error(f"Error creating student: {e}")
        return jsonify({'error': 'An error occurred while creating the student.'}), 500

# Get All Students
@student_bp.route('/students', methods=['GET'])
def get_students():
    students = Student.query.all()
    logger.info("Fetched all students")
    return jsonify([student.to_dict() for student in students]), 200

# Get Student by ID
@student_bp.route('/students/<int:id>', methods=['GET'])
def get_student(id):
    student = Student.query.get_or_404(id)
    logger.info(f"Fetched student with ID: {id}")
    return jsonify(student.to_dict()), 200

# Update Student
@student_bp.route('/students/<int:id>', methods=['PUT'])
def update_student(id):
    try:
        student = Student.query.get_or_404(id)
        data = request.get_json()
        if not data:
            logger.warning("Invalid request data for updating student")
            return jsonify({'error': 'Invalid request data.'}), 400
        logger.info(f"Updating student with ID: {id} with data: {data}")
        student.name = data.get('name', student.name)
        student.age = data.get('age', student.age)
        student.email = data.get('email', student.email)
        db.session.commit()
        return jsonify(student.to_dict()), 200
    except Exception as e:
        logger.error(f"Error updating student: {e}")
        return jsonify({'error': 'An error occurred while updating the student.'}), 500

# Delete Student
@student_bp.route('/students/<int:id>', methods=['DELETE'])
def delete_student(id):
    try:
        student = Student.query.get_or_404(id)
        logger.info(f"Deleting student with ID: {id}")
        db.session.delete(student)
        db.session.commit()
        return jsonify({'message': 'Student deleted successfully'}), 200
    except Exception as e:
        logger.error(f"Error deleting student: {e}")
        return jsonify({'error': 'An error occurred while deleting the student.'}), 500
