# Capstone Management System (CMS), DBMS-Project

A comprehensive database-driven solution that streamlines the management of capstone projects in educational institutions. This system enables efficient organization, evaluation, and tracking of student projects, fostering collaboration among faculty, students, and administrative staff throughout the project lifecycle.

## 🎯 Overview

The Capstone Management System is designed to facilitate the management of capstone projects in academic institutions by providing role-specific functionalities for administrators, faculty, and students. The system streamlines tasks like team formation, panel assignments, exam scheduling, grading, and student evaluations while ensuring data integrity and automation.

### Key Objectives
- Efficient management of capstone projects and teams
- Automated grade calculations and performance tracking
- Role-based access control for different user types
- Comprehensive reporting and evaluation system
- Seamless collaboration between faculty and students

## ✨ Features

### 👨‍💼 Admin Functionalities
- **User Management**: Add, update, and remove users (Faculty, Admin) with secure authentication
- **Panel Management**: Create panels and assign faculty members to specific departments
- **Team Management**: Assign students to teams and associate them with faculty supervisors
- **Exam Scheduling**: Create exams with date, time, and maximum marks allocation
- **Grade Management**: Automated grade calculations and comprehensive reporting
- **Database Operations**: Complete CRUD operations for all entities

### 👩‍🏫 Faculty Functionalities
- **Project Oversight**: View teams and projects assigned under their panel
- **Student Evaluation**: Enter marks for students during evaluations
- **Communication**: Access and communicate with supervised students
- **Performance Monitoring**: Track student progress and project milestones

### 👨‍🎓 Student Functionalities
- **Team Information**: View assigned team, project details, and faculty supervisor
- **Exam Schedules**: Access exam schedules with date, time, and maximum marks
- **Performance Tracking**: View individual grades, total marks, and semester performance
- **Profile Management**: Update personal information and secure login access

## 🛠 Tech Stack

### Backend
- **Python**: Core programming language for backend development
- **Flask**: Lightweight web framework for API handling and routing
- **MySQL**: Relational database for structured data storage
- **bcrypt/Werkzeug**: Password hashing and security

### Frontend
- **HTML5**: Markup structure
- **CSS3**: Styling and layout
- **JavaScript**: Client-side interactivity
- **Bootstrap**: Responsive design framework

### Development Tools
- **VS Code**: Integrated Development Environment
- **MySQL Workbench**: Database modeling and query execution
- **Postman**: API testing and documentation
- **Git & GitHub**: Version control and collaboration

### Deployment
- **Flask Development Server**: Local development environment

## 🏗 System Architecture

The system follows a three-tier architecture:

1. **Presentation Layer**: HTML/CSS/JavaScript frontend with Bootstrap
2. **Application Layer**: Flask-based backend with role-based routing
3. **Data Layer**: MySQL database with normalized schema and automated triggers

### Database Features
- **Automated Triggers**: Grade calculation and data consistency
- **Stored Procedures**: Complex business logic implementation
- **Referential Integrity**: Foreign key constraints and cascading operations
- **Role-based Security**: Encrypted passwords and access control

## 🚀 Installation & Setup

### Prerequisites
- Python 3.7 or higher
- MySQL 8.0 or higher
- Git

### Step-by-Step Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/chaitra-v26/DBMS_Capstone-Management-System.git
   cd DBMS_Capstone-Management-System
   ```

2. **Set up Virtual Environment**
   ```bash
   python -m venv venv
   
   # On Windows
   venv\Scripts\activate
   
   # On macOS/Linux
   source venv/bin/activate
   ```

3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Database Setup**
   ```bash
   # Login to MySQL
   mysql -u root -p
   
   # Create database
   CREATE DATABASE capstone_management;
   
   # Run the SQL scripts from db_scripts folder
   source db_scripts/schema.sql;
   source db_scripts/triggers.sql;
   source db_scripts/procedures.sql;
   ```

5. **Configure Database Connection**
   ```python
   # Update config.py with your MySQL credentials
   MYSQL_HOST = 'localhost'
   MYSQL_USER = 'your_username'
   MYSQL_PASSWORD = 'your_password'
   MYSQL_DB = 'capstone_management'
   ```

6. **Run the Application**
   ```bash
   python app.py
   ```

7. **Access the Application**
   Open your browser and navigate to: `http://localhost:5000`

## 📖 Usage

### Default Login Credentials

**Admin Access:**
- Navigate to `/admin` endpoint
- Use admin credentials set during database initialization

**Faculty Access:**
- Register through admin panel or use existing faculty credentials
- Access faculty-specific functionalities

**Student Access:**
- Register through the student registration page
- Login with registered credentials

### Basic Workflow

1. **Admin Setup**: Create departments, panels, and assign faculty
2. **Team Formation**: Admin assigns students to teams and projects
3. **Exam Scheduling**: Admin schedules exams for specific teams
4. **Evaluation Process**: Faculty evaluates students, admin enters marks
5. **Grade Calculation**: Automated triggers calculate final grades
6. **Reporting**: Generate comprehensive performance reports

## 🗄 Database Schema

### Core Tables
- **Department**: Academic departments
- **Team**: Project teams and assignments
- **Panel**: Evaluation panels
- **Faculty**: Faculty information and panel assignments
- **Student**: Student details and team associations
- **Exam**: Examination details and scheduling
- **CapstoneMarks**: Calculated total marks
- **Undergoes**: Individual evaluation records
- **StudentGrades**: Final semester grades

### Key Relationships
- Students belong to teams and departments
- Teams are supervised by faculty members
- Faculty members are assigned to panels
- Exams are scheduled for specific teams
- Automated grade calculations through triggers

## 🔗 API Endpoints

### Authentication
- `POST /login` - User authentication
- `POST /logout` - User logout

### Admin Routes
- `GET /admin/dashboard` - Admin dashboard
- `POST /admin/panels` - Create/manage panels
- `POST /admin/teams` - Create/manage teams
- `POST /admin/exams` - Schedule exams
- `POST /admin/marks` - Enter marks

### Faculty Routes
- `GET /faculty/dashboard` - Faculty dashboard
- `GET /faculty/teams` - View assigned teams
- `POST /faculty/evaluate` - Submit evaluations

### Student Routes
- `GET /student/dashboard` - Student dashboard
- `GET /student/grades` - View grades
- `GET /student/schedule` - View exam schedule

## The application includes:

- **Home Page**: Landing page with role-based login options
- **Registration Pages**: Separate registration for students and faculty
- **Dashboards**: Role-specific dashboards with relevant functionalities
- **Management Interfaces**: Admin panels for managing all system entities
- **Responsive Design**: Mobile-friendly interface using Bootstrap

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
---
