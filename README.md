### Home Test Ruby on Rails

1. Write a code for getting number of attachments per user and type.
Example of response:
  [
    { name: "John Smith", resume: 7, cover_letter: 3, photo: 1 },
    { name: "Alex Green", resume: 0, cover_letter: 2, photo: 5 },
    { name: "Jack Dopplet", resume: 0, cover_letter: 0, photo: 0 }
  ]

2. Write a code that prevents uploading more that 1 resume for
 a job-seeker that doesn't have email

```ruby
class CreateUsersAndAttachments < ActiveRecord::Migration
  create_table :users do |t|
    t.string :name
    t.string :email
    t.integer :role

    t.timestamps
  end
```
```ruby
  create_table :attachments do |t|
    t.string :title
    t.string :file_path
    t.references :user
    t.integer :type

    t.timestamps
  end
end
```

=========== Models

```ruby
class User < ActiveRecord::Base
  has_many :attachments

  enum role: [:admin, :job_seeker, :employer]
end
```

```ruby
class Attachment < ActiveRecord::Base
  belongs_to :user

  enum type: [:resume, :cover_letter, :photo]
end
```
### My Solution