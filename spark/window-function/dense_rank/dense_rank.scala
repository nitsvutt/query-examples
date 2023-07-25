import org.apache.spark.sql.functions._
import org.apache.spark.sql.expressions.Window

val window_spec = Window.partitionBy("grade")
                        .orderBy("gpa")
                        .rowsBetween(Window.unboundedPreceding, Window.currentRow)

val ranked_pupil = pupil.withColumn("rank", dense_rank().over(window_spec))

ranked_pupil.select("id", "first_name", "last_name", "grade", "gpa")
            .where(col("rank") === 1)
            .orderBy("grade", "id")
            .show()