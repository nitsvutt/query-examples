import org.apache.spark.sql.functions._

pupil.join(innovation_craft,
           pupil.col("id") === innovation_craft.col("owner_id"),
           "left_anti")
     .select("id", "first_name", "last_name", "grade")
     .orderBy("grade", "id")
     .show()