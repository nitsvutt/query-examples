pupil.join(innovationCraft.where(col("type") == 1),
           pupil["id"] == innovationCraft["owner_id"],
           "left_semi") \
     .select("id", "first_name", "last_name", "grade") \
     .orderBy("grade", "id") \
     .show()