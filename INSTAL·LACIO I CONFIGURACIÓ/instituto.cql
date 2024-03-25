-- Crear un keyspace per al nostre institut
CREATE KEYSPACE IF NOT EXISTS institut_keyspace
  WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

-- Utilitzar el keyspace creat
USE institut_keyspace;

-- Crear una taula per emmagatzemar informació d'estudiants
CREATE TABLE IF NOT EXISTS students (
  student_id UUID PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  date_of_birth DATE,
  address TEXT,
  phone_number TEXT,
  enrolled_courses SET<TEXT>
);

-- Crear una taula per emmagatzemar informació de professors
CREATE TABLE IF NOT EXISTS professors (
  professor_id UUID PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  date_of_birth DATE,
  address TEXT,
  phone_number TEXT,
  courses_taught SET<TEXT>
);

-- Crear una taula per emmagatzemar informació de cursos
CREATE TABLE IF NOT EXISTS courses (
  course_id UUID PRIMARY KEY,
  course_name TEXT,
  professor_id UUID,
  schedule TEXT,
  students_enrolled SET<UUID>
);

-- Crear una taula per emmagatzemar notes dels estudiants
CREATE TABLE IF NOT EXISTS grades (
  student_id UUID,
  course_id UUID,
  grade FLOAT,
  PRIMARY KEY (student_id, course_id)
);
