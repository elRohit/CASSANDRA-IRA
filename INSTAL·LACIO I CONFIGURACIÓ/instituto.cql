CREATE KEYSPACE IF NOT EXISTS institut WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE IF NOT EXISTS institut.alumnes (
  codi text PRIMARY KEY,
  nom text,
  cognoms text,
  data_naixament date,
  telefon text,
  correu text
);

INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A01', 'Joan', 'Martínez', '2000-01-01', '123456789', 'joan.martinez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A02', 'Maria', 'Garcia', '2000-02-02', '234567890', 'maria.garcia@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A03', 'Pere', 'Lopez', '2001-03-03', '345678901', 'pere.lopez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A04', 'Anna', 'Sanchez', '2002-04-04', '456789012', 'anna.sanchez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A05', 'Jordi', 'Perez', '2003-05-05', '567890123', 'jordi.perez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A06', 'Laura', 'Gomez', '2004-06-06', '678901234', 'laura.gomez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A07', 'David', 'Fernandez', '2005-07-07', '789012345', 'david.fernandez@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A08', 'Marta', 'Ramos', '2006-08-08', '890123456', 'marta.ramos@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A09', 'Sergi', 'Torres', '2007-09-09', '901234567', 'sergi.torres@institut.cat');
INSERT INTO institut.alumnes (codi, nom, cognoms, data_naixament, telefon, correu) VALUES ('A10', 'Cristina', 'Castro', '2008-10-10', '012345678', 'cristina.castro@institut.cat');

CREATE TABLE IF NOT EXISTS institut.materies (
  codi text PRIMARY KEY,
  nom text,
  professor text,
  aula text,
  horari text
);

INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M01', 'Matemàtiques', 'Professor1', 'Aula1', '08:00-10:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M02', 'Història', 'Professor2', 'Aula2', '10:00-12:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M03', 'Física', 'Professor3', 'Aula3', '12:00-14:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M04', 'Química', 'Professor4', 'Aula4', '14:00-16:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M05', 'Biologia', 'Professor5', 'Aula5', '16:00-18:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M06', 'Informàtica', 'Professor6', 'Aula6', '18:00-20:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M07', 'Anglès', 'Professor7', 'Aula7', '20:00-22:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M08', 'Francès', 'Professor8', 'Aula8', '22:00-00:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M09', 'Alemany', 'Professor9', 'Aula9', '00:00-02:00');
INSERT INTO institut.materies (codi, nom, professor, aula, horari) VALUES ('M10', 'Italiano', 'Professor10', 'Aula10', '02:00-04:00');

CREATE TABLE IF NOT EXISTS institut.matriculacions (
  codi_alumne text,
  codi_materia text,
  any text,
  estat text,
  PRIMARY KEY (codi_alumne, codi_materia)
);

INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A01', 'M01', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A02', 'M02', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A03', 'M03', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A04', 'M04', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A05', 'M05', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A06', 'M06', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A07', 'M07', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A08', 'M08', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A09', 'M09', '2022', 'Matriculat');
INSERT INTO institut.matriculacions (codi_alumne, codi_materia, any, estat) VALUES ('A10', 'M10', '2022', 'Matriculat');

CREATE TABLE IF NOT EXISTS institut.notes (
  codi_alumne text,
  codi_materia text,
  nota int,
  observacions text,
  PRIMARY KEY (codi_alumne, codi_materia)
);

INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A01', 'M01', 8, 'Bona nota');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A02', 'M02', 7, 'Nota acceptable');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A03', 'M03', 6, 'Nota suficient');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A04', 'M04', 5, 'Aprovat just');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A05', 'M05', 4, 'Suspès');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A06', 'M06', 9, 'Excel·lent');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A07', 'M07', 10, 'Matrícula d\'honor');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A08', 'M08', 3, 'Suspès');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A09', 'M09', 2, 'Suspès');
INSERT INTO institut.notes (codi_alumne, codi_materia, nota, observacions) VALUES ('A10', 'M10', 1, 'Suspès');
