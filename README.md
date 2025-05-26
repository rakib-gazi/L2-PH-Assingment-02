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
    VARCHAR Name output : 'abc';<!--without any space -->
 
````