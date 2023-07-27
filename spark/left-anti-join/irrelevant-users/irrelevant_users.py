from pyspark.sql.functions import *

pupil.join(innovation_craft,
           pupil["id"] == innovation_craft["owner_id"],
           "left_anti") \
     .select("id", "first_name", "last_name", "grade") \
     .orderBy("grade", "id") \
     .show()