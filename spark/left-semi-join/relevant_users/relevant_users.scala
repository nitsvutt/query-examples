pupil.join(innovationCraft.where(col("type") === 1),
           pupil.col("id") === innovationCraft.col("owner_id"),
           "left_semi")
     .select("id", "first_name", "last_name", "grade")
     .orderBy("grade", "id")
     .show()