users = User.first_or_create([{ name: 'Senofonte', email: "senofonte@example.com", role: "admin" }, { name: 'Venusia', email: "", role: "job_seeker"  }])

attachments = Attachment.first_or_create([{ title: 'First Document', user_id: 1, type_doc: "cover_letter" }, { title: 'Great Document', user_id: 2, type_doc: "resume"}])