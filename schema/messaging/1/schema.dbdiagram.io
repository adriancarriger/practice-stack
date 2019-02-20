Table message {
  id int PK
  user_id int
  text varchar
  status varchar
  from_id int
  to_id int
  created_at varchar
}

Table call_log {
  id int PK
  duration int
  from_id int
  to_id int
  created_at varchar
}

Table user {
  id int PK
  person_id int
  created_at varchar
}

Table person {
  id int PK
  first_name varchar
  last_name varchar
  created_at varchar
}

Table phone_number_owner {
  person_id int
  phone_number int
  created_at varchar
}

Table phone_nunber {
  number int PK
  created_at varchar
}

// Relations

Ref: user.person_id - person.id

// Message relations
Ref: message.from_id > phone_nunber.number
Ref: message.to_id > phone_nunber.number

Ref: phone_number_owner.person_id > person.id
Ref: phone_number_owner.phone_number > phone_nunber.number

// Call log relations
Ref: call_log.from_id > phone_nunber.number
Ref: call_log.to_id > phone_nunber.number
