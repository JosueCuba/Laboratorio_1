  CREATE TABLE DEPARTMENTS
   (	"DEPTNO" NUMBER(2,0) NOT NULL ENABLE, 
	"DNAME" VARCHAR2(10), 
	"LOCATION" VARCHAR2(8), 
	"MGR" NUMBER(4,0), 
	 CONSTRAINT "DEPARTMENTS_PK" PRIMARY KEY ("DEPTNO")
   );

   COMMENT ON COLUMN "DEPARTMENTS"."DEPTNO" IS ' único número de departamento';
   COMMENT ON COLUMN "DEPARTMENTS"."DNAME" IS ' Nombre del departamento';
   COMMENT ON COLUMN "DEPARTMENTS"."LOCATION" IS ' Localización (ciudad)';
   COMMENT ON COLUMN "DEPARTMENTS"."MGR" IS 'Manager (Referencias Los empleados)
';





  CREATE TABLE "COURSES" 
   (	"CODE" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CATEGORY" CHAR(3), 
	"DURATION" VARCHAR2(2), 
	 CONSTRAINT "COURSES_PK" PRIMARY KEY ("CODE", "DESCRIPTION")
   );

   COMMENT ON COLUMN "COURSES"."CODE" IS 'código curso único';
   COMMENT ON COLUMN "COURSES"."DESCRIPTION" IS ' Descripción del curso (título) CATEGORÍA ';
   COMMENT ON COLUMN "COURSES"."CATEGORY" IS 'Categoría de cursos (GEN, DAC, o DSG)';
   COMMENT ON COLUMN "COURSES"."DURATION" IS 'Duración del curso (en días)
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

   COMMENT ON COLUMN "EMPLOYEES"."EMPNO" IS ' Número único empleado';
   COMMENT ON COLUMN "EMPLOYEES"."ENAME" IS ' Apellidos';
   COMMENT ON COLUMN "EMPLOYEES"."INIT" IS ' Iniciales (sin puntuacion)
';
   COMMENT ON COLUMN "EMPLOYEES"."JOB" IS 'Descripción del trabajo';
   COMMENT ON COLUMN "EMPLOYEES"."MGR" IS 'Manager (Referencias Los empleados)';
   COMMENT ON COLUMN "EMPLOYEES"."BDATE" IS 'Fecha de nacimiento';
   COMMENT ON COLUMN "EMPLOYEES"."MSAL" IS ' salario mensual * (excluyendo la prima neta)';
   COMMENT ON COLUMN "EMPLOYEES"."COMM" IS 'Comisión (por año, por los representantes de ventas)';
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
   COMMENT ON COLUMN "HISTORY"."BEGINYEAR" IS 'componente año de BeginDate';
   COMMENT ON COLUMN "HISTORY"."BEGINDATE" IS ' Begin intervalo de fechas';
   COMMENT ON COLUMN "HISTORY"."ENDDATE" IS 'intervalo de fecha de finalización';
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

   COMMENT ON COLUMN "OFFERINGS"."COURSE" IS 'Código del curso  (Referencias Cursos)';
   COMMENT ON COLUMN "OFFERINGS"."BEGINDATE" IS ' primer día de curso';
   COMMENT ON COLUMN "OFFERINGS"."TRAINER" IS 'Instructor (Referencias empleados)';
   COMMENT ON COLUMN "OFFERINGS"."LOCATION" IS 'Ubicación de la oferta de cursos';



  CREATE TABLE "OFFERINGS" 
   (	"COURSE" VARCHAR2(6 BYTE) NOT NULL ENABLE, 
	"BEGINDATE" DATE NOT NULL ENABLE, 
	"TRAINER" NUMBER(4,0), 
	"LOCATION" VARCHAR2(8), 
	 CONSTRAINT "OFFERINGS_PK" PRIMARY KEY ("COURSE", "BEGINDATE")
   );

   COMMENT ON COLUMN "OFFERINGS"."COURSE" IS 'Código del curso  (Referencias Cursos)';
   COMMENT ON COLUMN "OFFERINGS"."BEGINDATE" IS ' primer día de curso';
   COMMENT ON COLUMN "OFFERINGS"."TRAINER" IS 'Instructor (Referencias empleados)';
   COMMENT ON COLUMN "OFFERINGS"."LOCATION" IS 'Ubicación de la oferta de cursos';



  CREATE TABLE "SALGRADES" 
   (	"GRADE" NUMBER(2,0) NOT NULL ENABLE, 
	"LOWERLIMIT" NUMBER(6,2) NOT NULL ENABLE, 
	"UPPERLIMIT" NUMBER(6,2), 
	"BONUS" NUMBER(6,2), 
	 CONSTRAINT "SALGRADES_PK" PRIMARY KEY ("GRADE")
   );

   COMMENT ON COLUMN "SALGRADES"."GRADE" IS 'número de grado salario Unique';
   COMMENT ON COLUMN "SALGRADES"."LOWERLIMIT" IS ' salario mínimo para este grado Límite Superior ';
   COMMENT ON COLUMN "SALGRADES"."UPPERLIMIT" IS ' salario máximo para este bono grado';
   COMMENT ON COLUMN "SALGRADES"."BONUS" IS ' bono neto en la parte superior del salario mensua';



