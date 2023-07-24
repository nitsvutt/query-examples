# This is my own example.
"""
1. Metadata:
+----------------------------+
| Pupil                      |
+--------------+-------------+
| Column Name  | Type        |
+--------------+-------------+
| id           | int         |
| first_name   | string      |
| last_name    | string      |
| grade        | int         |
| gpa          | double      |
+--------------+-------------+
- This table shows the GPA of all pupils of a primary school.
- (id) is the primary key of the table.
- Each row is a record of a pupil.

+----------------------------+
| Innovation_craft           |
+--------------+-------------+
| Column Name  | Type        |
+--------------+-------------+
| id           | int         |
| name         | string      |
| type         | string      |
| result       | int         |
| owner_id     | double      |
+--------------+-------------+
- This table shows the innovative ideas of all pupils of a primary school.
- (id) is the primary key of the table, (owner_id) is a foreign key to the primary key (id) of the pupil table.
- Each row is a record of a an innovation.

2. Requirement:
- Write a query to report all pupils having innovation in Education Major and order the result by pupils' grade and id.

3. Example:
a. Input:
+-----------------------------------+
| Pupil                             |
+---+----------+---------+-----+----+
| id|first_name|last_name|grade| gpa|
+---+----------+---------+-----+----+
|  1|       Anh|     Tran|    2| 8.4|
|  2|       Anh|   Nguyen|    3| 8.2|
|  3|       Bao|   Nguyen|    2| 8.6|
|  4|     Khanh|       Vo|    4| 8.9|
|  5|      Quan|     Pham|    4| 8.9|
|  6|      Tuan|     Tran|    5| 8.6|
|  7|        Tu|     Tran|    1| 9.5|
|  8|      Tung|    Huynh|    1| 9.2|
|  9|        Vu|     Tran|    5|10.0|
| 10|       Yen|    Huynh|    3| 9.2|
+---+----------+---------+-----+----+

+---------------------------------------------+
| Innovation_craft                            |
+---+--------------------+----+------+--------+
| id|                name|type|result|owner_id|
+---+--------------------+----+------+--------+
|  1|          Air blower|   2|     3|       4|
|  2|  Bottle pencil case|   1|     4|       2|
|  3|  E-learning website|   1|     1|       9|
|  4|      Funny hand fan|   2|     4|       5|
|  5|Paper flower bouquet|   3|     2|      10|
+---+--------------------+----+------+--------+

b. Output:
+---+----------+---------+-----+
| id|first_name|last_name|grade|
+---+----------+---------+-----+
|  2|       Anh|   Nguyen|    3|
|  9|        Vu|     Tran|    5|
+---+----------+---------+-----+

c. Explanation:
- There are two student, Anh Nguyen and Vu Tran, having Education contributions.
"""

pupil.join(innovation_craft.where(col("type") == 1),
           on = (pupil["id"] == innovation_craft["owner_id"]),
           how = "left_semi") \
     .select("id", "first_name", "last_name", "grade") \
     .orderBy("grade", "id") \
     .show()