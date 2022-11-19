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

before to install the app you have to installed *ruby* and *rails*. This webapp wors with the follow versions

```code
ruby '2.7.1'
rails '6.1.7'
```
after that you can clone the app
```shell
$ git clone git@github.com:Astr0surf3r/hometest.git
$ cd hometest
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```

to checkout my solution at **point 1.** you have to click in Final Report page

```code
http://localhost:3000/final-report
```

And at the end to checkout the solution at **point 2.** you have to go at the follow page 

```code
http://localhost:3000/attachments/new
```

and try to submit the follow data:

Title: Example
User: Venusia
Type: Resume

and after submit the form. A message will appear in the browser!
