import org.apache.spark.sql.functions._

pupil.join(innovation_craft.where(col("type") === 1),
           pupil.col("id") === innovation_craft.col("owner_id"),
           "left_semi")
     .select("id", "first_name", "last_name", "grade")
     .orderBy("grade", "id")
     .show()