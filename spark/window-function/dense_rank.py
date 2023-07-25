from pyspark.sql.functions import *
from pyspark.sql.window import Window

windowSpec = Window.partitionBy("grade") \
                   .orderBy("gpa") \
                   .rowsBetween(Window.unboundedPreceding, Window.currentRow)

ranked_pupil = pupil.withColumn("rank", dense_rank().over(windowSpec))

ranked_pupil.select("id", "first_name", "last_name", "grade", "gpa") \
            .where(col("rank") == 1) \
            .orderBy("grade", "id") \
            .show()