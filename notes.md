# HomeReno
A social Home Improvement app that allows users to create and share ideas.

## Models

### User
  - has_many tasks
  - has_many comments
  - has_many tasks, through comments
  
  Attributes
  - email
  - password

### Task
  - belongs_to user
  - has_many comments
  - has_many users, through comments

  Attributes
  - name
  - description
  - complete, boolean, default to false

### Comment
  - belongs_to user
  - belongs_to task

  - content