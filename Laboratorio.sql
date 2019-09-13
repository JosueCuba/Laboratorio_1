  CREATE TABLE DEPARTMENTS
   (	"DEPTNO" NUMBER(2,0) NOT NULL ENABLE, 
	"DNAME" VARCHAR2(10), 
	"LOCATION" VARCHAR2(8), 
	"MGR" NUMBER(4,0), 
	 CONSTRAINT "DEPARTMENTS_PK" PRIMARY KEY ("DEPTNO")
   );

   COMMENT ON COLUMN "DEPARTMENTS"."DEPTNO" IS ' �nico n�mero de departamento';
   COMMENT ON COLUMN "DEPARTMENTS"."DNAME" IS ' Nombre del departamento';
   COMMENT ON COLUMN "DEPARTMENTS"."LOCATION" IS ' Localizaci�n (ciudad)';
   COMMENT ON COLUMN "DEPARTMENTS"."MGR" IS 'Manager (Referencias Los empleados)
';





  CREATE TABLE "COURSES" 
   (	"CODE" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CATEGORY" CHAR(3), 
	"DURATION" VARCHAR2(2), 
	 CONSTRAINT "COURSES_PK" PRIMARY KEY ("CODE", "DESCRIPTION")
   );

   COMMENT ON COLUMN "COURSES"."CODE" IS 'c�digo curso �nico';
   COMMENT ON COLUMN "COURSES"."DESCRIPTION" IS ' Descripci�n del curso (t�tulo) CATEGOR�A ';
   COMMENT ON COLUMN "COURSES"."CATEGORY" IS 'Categor�a de cursos (GEN, DAC, o DSG)';
   COMMENT ON COLUMN "COURSES"."DURATION" IS 'Duraci�n del curso (en d�as)
';



  CREATE TABLE "SYSTEM"."EMPLOYEES" 
   (	"EMPNO" NUMBER(4,0) NOT NULL ENABLE, 
	"ENAME" VARCHAR2(8), 
	"INIT" VARCHAR2(5), 
	"JOB" VARCHAR2(8), 
	"MGR" NUMBER(6,2), 
	"BDATE" DATE, 
	"MSAL" VARCHAR2(8), 
	"COMM" NUMBER(6,2), 
	"DEPTNO" NUMBER(2,0), 
	 CONSTRAINT "EMPLOYEES_PK" PRIMARY KEY ("EMPNO")ENABLE, 
	 CONSTRAINT "EMPLOYEES_EMPLOYEES_EMPNO" FOREIGN KEY ("EMPNO")
	  REFERENCES "SYSTEM"."EMPLOYEES" ("EMPNO") ENABLE
   );

   COMMENT ON COLUMN "EMPLOYEES"."EMPNO" IS ' N�mero �nico empleado';
   COMMENT ON COLUMN "EMPLOYEES"."ENAME" IS ' Apellidos';
   COMMENT ON COLUMN "EMPLOYEES"."INIT" IS ' Iniciales (sin puntuacion)
';
   COMMENT ON COLUMN "EMPLOYEES"."JOB" IS 'Descripci�n del trabajo';
   COMMENT ON COLUMN "EMPLOYEES"."MGR" IS 'Manager (Referencias Los empleados)';
   COMMENT ON COLUMN "EMPLOYEES"."BDATE" IS 'Fecha de nacimiento';
   COMMENT ON COLUMN "EMPLOYEES"."MSAL" IS ' salario mensual * (excluyendo la prima neta)';
   COMMENT ON COLUMN "EMPLOYEES"."COMM" IS 'Comisi�n (por a�o, por los representantes de ventas)';
   COMMENT ON COLUMN "EMPLOYEES"."DEPTNO" IS '(Departamento de referencias departamentos)';



  CREATE TABLE "HISTORY" 
   (	"EMPNO" NUMBER(4,0) NOT NULL ENABLE, 
	"BEGINYEAR" NUMBER(4,0), 
	"BEGINDATE" DATE NOT NULL ENABLE, 
	"ENDDATE" DATE, 
	"DEPTNO" NUMBER(2,0), 
	"MSAL" NUMBER(6,2), 
	"COMMENTS" VARCHAR2(60 BYTE), 
	 CONSTRAINT "HISTORY_PK" PRIMARY KEY ("EMPNO", "BEGINDATE")
   );

   COMMENT ON COLUMN "HISTORY"."EMPNO" IS ' Empleado (Referencias empleados)';
   COMMENT ON COLUMN "HISTORY"."BEGINYEAR" IS 'componente a�o de BeginDate';
   COMMENT ON COLUMN "HISTORY"."BEGINDATE" IS ' Begin intervalo de fechas';
   COMMENT ON COLUMN "HISTORY"."ENDDATE" IS 'intervalo de fecha de finalizaci�n';
   COMMENT ON COLUMN "HISTORY"."DEPTNO" IS 'Departamento (Referencias departamentos) ';
   COMMENT ON COLUMN "HISTORY"."MSAL" IS ' salario mensual durante el intervalo';
   COMMENT ON COLUMN "HISTORY"."COMMENTS" IS 'el espacio de texto libre';



  CREATE TABLE "OFFERINGS" 
   (	"COURSE" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"BEGINDATE" DATE NOT NULL ENABLE, 
	"TRAINER" NUMBER(4,0), 
	"LOCATION" VARCHAR2(8), 
	 CONSTRAINT "OFFERINGS_PK" PRIMARY KEY ("COURSE", "BEGINDATE")
   );

   COMMENT ON COLUMN "OFFERINGS"."COURSE" IS 'C�digo del curso  (Referencias Cursos)';
   COMMENT ON COLUMN "OFFERINGS"."BEGINDATE" IS ' primer d�a de curso';
   COMMENT ON COLUMN "OFFERINGS"."TRAINER" IS 'Instructor (Referencias empleados)';
   COMMENT ON COLUMN "OFFERINGS"."LOCATION" IS 'Ubicaci�n de la oferta de cursos';



  CREATE TABLE "OFFERINGS" 
   (	"COURSE" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"BEGINDATE" DATE NOT NULL ENABLE, 
	"TRAINER" NUMBER(4,0), 
	"LOCATION" VARCHAR2(8), 
	 CONSTRAINT "OFFERINGS_PK" PRIMARY KEY ("COURSE", "BEGINDATE")
   );

   COMMENT ON COLUMN "OFFERINGS"."COURSE" IS 'C�digo del curso  (Referencias Cursos)';
   COMMENT ON COLUMN "OFFERINGS"."BEGINDATE" IS ' primer d�a de curso';
   COMMENT ON COLUMN "OFFERINGS"."TRAINER" IS 'Instructor (Referencias empleados)';
   COMMENT ON COLUMN "OFFERINGS"."LOCATION" IS 'Ubicaci�n de la oferta de cursos';



  CREATE TABLE "SALGRADES" 
   (	"GRADE" NUMBER(2,0) NOT NULL ENABLE, 
	"LOWERLIMIT" NUMBER(6,2) NOT NULL ENABLE, 
	"UPPERLIMIT" NUMBER(6,2), 
	"BONUS" NUMBER(6,2), 
	 CONSTRAINT "SALGRADES_PK" PRIMARY KEY ("GRADE")
   );

   COMMENT ON COLUMN "SALGRADES"."GRADE" IS 'n�mero de grado salario Unique';
   COMMENT ON COLUMN "SALGRADES"."LOWERLIMIT" IS ' salario m�nimo para este grado L�mite Superior ';
   COMMENT ON COLUMN "SALGRADES"."UPPERLIMIT" IS ' salario m�ximo para este bono grado';
   COMMENT ON COLUMN "SALGRADES"."BONUS" IS ' bono neto en la parte superior del salario mensua';



