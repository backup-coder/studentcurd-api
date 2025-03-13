import os
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Database setup
db = SQLAlchemy()
DB_URL = os.getenv('DATABASE_URL')
