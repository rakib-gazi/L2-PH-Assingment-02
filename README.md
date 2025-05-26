# Bonus Section

## Q.Explain the Primary Key and Foreign Key concepts in PostgreSQL.

The primary key & Foreign key is the most import thing in  PostgreSQL, Which is used for data integrity & relationship. 

### Primary Key:  

Primary key is a column or set of columns in a table that uniquely identifies each record in the table.  It's reduce data duplicate & improve data integrity.

### Features of Primary Key:
1. It must be unique.
2. It must not be null.
3. It can be a single column or a combination of multiple columns.

```
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
```
***Student Table Output***
```
|Student_id|name|age|
|----------|----|---|
|1         |John|25 |
|2         |Mary|30 |
|3         |Peter|35|

```
**Here student_id is primary key**

### Foreign Key: 
Foreign key is a column or set of columns in a table that refers to the primary key  in another table.  It's used to establish relationship between two tables.


### Features of Foreign Key:
1. It's established between two table.
2. It can be null if relationship is optional.
3. we can use ON DELETE & ON UPDATE to specify what should happen when the referenced table is updated or deleted.

```
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

***Course Table Output***
```
|Course_id|Course_name|Student_id|
|---------|-----------|----------|
|1        |Math       |1         |
|2        |Science    |3         |
|3        |History    |2         |


```
**Here student_id is foreign key, which is referencing student_id in students table**

### IF i joint between students & course table output like this

```
|Course_id|Course_name|name      |age|
|---------|-----------|----------|---|
|1        |Math       |John      |25 |
|2        |Science    |Peter     |35 |
|3        |History    |Mary      |30 |
```
---


## Q.What is the difference between the VARCHAR and CHAR data types.

### CHAR:
1. CHAR stand for Character.
2. It's a fixed-length string like Pone Number, PIN Code etc.
3. It's used when the length of the string is fixed.
4. If I store 'abc' in CHAR(5), it will store 'abc' with 2 spaces. Result like that "abe  ".
5. For fixed length data, it's performance is Good.
6. It's cost fixed memory if data is also small.

### VARCHAR:
1. VARCHAR stand for Variable Character.
2. It's a variable-length string like Name, Address, email etc.
3. It's used when the length of the string is variable.
4. If I store 'abc' in VARCHAR(5), it will store 'abc' only. Result like that "abe", No extra space.
5. For variable length data, it's performance is Good.
6. It's cost variable memory if data is also variable.


### Example:

If I create a table with CHAR(5) and VARCHAR(5) like this:
```
CREATE TABLE test (
    name CHAR(5),
    Name VARCHAR(5)
);
```
Then If I inset data here like this:
```
INSERT INTO test (name, Name)
VALUES ('abc', 'abc');
```
Then the result will be like this:
```
    Char name output :  'abe  '; <!--with extra 2 space -->
    VARCHAR Name output : 'abc'; <!--without any space -->
 
````

---


## Q.Explain the purpose of the WHERE clause in a SELECT statement.

In structured Query Language (SQL), WHERE Clause is used to Filter data from a table based on specified conditions. Normally it's used with SELECT, UPDATE, and DELETE statements.

### Purpose :
WHERE clause is used when you want to select only specific data form database. That's means it's provided you specific data not Full data from table.

### Without WHERE Clause The select statement like this:

```
SELECT * FROM students;
```

***It's select all data from students table.***

### With WHERE Clause The select statement like this:
```
SELECT * FROM students
WHERE class = 9;
```
***It's select only data from students table where class is 9.***

### Syntax of WHERE Clause:
***1. equal to : =***
```
SELECT * FROM students
WHERE class = 9;
```
***2. not equal to : != or <>***
```
SELECT * FROM students
WHERE class <> 9;

SELECT * FROM students
WHERE class != 9;
```
***3. greater than : >***
```
SELECT * FROM students
WHERE class > 9;
```
***4. less than : <***
```
SELECT * FROM students
WHERE class < 9;
```
***5. greater than or equal to : >=***
```
SELECT * FROM students
WHERE class >= 9;
```
***6. less than or equal to : <=***
```
SELECT * FROM students
WHERE class <= 9;
```
***7. LIKE : used for pattern matching***
```
SELECT * FROM students
WHERE name LIKE 'A%';
```
***8. BETWEEN : used for range of values***
```
SELECT * FROM students
WHERE class BETWEEN 9 AND 10;
```
***9. IN : used for multiple values***
```
SELECT * FROM students
WHERE class IN (8, 9, 10);
```
***10. IS Null : used for checking null values***
```
SELECT * FROM students
WHERE class IS NULL;
```

---


## Q.What are the LIMIT and OFFSET clauses used for?

In structured Query Language (SQL), The LIMIT & OFFSET are used for filter data. Specially when we want to get a limited number of data from a table. The LIMIT clause is used to
specify the maximum number of rows to return, while the OFFSET clause is used to specify how many data will skipped in return time.

### LIMIT clause:
The LIMIT clause is used to limit the number of rows returned in a query. It is used to restrict the number of rows that are returned from a query.

```
SELECT * FROM students LIMIT 5;
````
***This will return the first 5 rows of the students table.***

### OFFSET clause:
The OFFSET clause is used to specify how many rows to skip before starting to return rows.

```
SELECT * FROM students LIMIT 5 OFFSET 10;
```
***This will return the 11th to 15th rows of the students table.***

###Special Use Case:
When we want to page wise data The LIMIT and OFFSET clause are used together.

***1st Page***
```
SELECT * FROM students LIMIT 10 OFFSET 0;
```
***2nd Page***
```
SELECT * FROM students LIMIT 10 OFFSET 10;
```
***3rd Page***
```
SELECT * FROM students LIMIT 10 OFFSET 20;
```

### Here per page will show 10 data.
### Note: We always start count offset from 0. example: 0, 10, 20, 30, 40,50 etc.


