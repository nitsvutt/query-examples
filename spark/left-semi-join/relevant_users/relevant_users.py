pupil.join(innovation_craft.where(col("type") == 1),
           pupil["id"] == innovation_craft["owner_id"],
           "left_semi") \
     .select("id", "first_name", "last_name", "grade") \
     .orderBy("grade", "id") \
     .show()