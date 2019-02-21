// ERD: https://dbdiagram.io/d/5c6d9beff7c5bb70c72f12ba
Table message {
  id int PK
  text varchar
  status varchar
  from_id int
  to_id int
  created_at varchar
}

Table call_log {
  id int PK
  start varchar
  end varchar
  from_id int
  to_id int
  created_at varchar
}

Table user {
  id int PK
  contact_id int // contact for the user
  created_at varchar
}

Table contact {
  id int PK
  first_name varchar
  last_name varchar
  user_id int
  created_at varchar
}

Table phone_number_owner {
  contact_id int
  phone_number int
  created_at varchar
}

Table phone_number {
  id int PK
  number varchar
  twilio_id int
  created_at varchar
}

Table twilio_account {
  id int PK
  sid varchar
  auth_token varchar
  user_id int
  created_at varchar
}

// Relations

Ref: user.contact_id - contact.id

// Message relations
Ref: message.from_id > phone_number.id
Ref: message.to_id > phone_number.id

Ref: phone_number_owner.contact_id > contact.id
Ref: phone_number_owner.phone_number > phone_number.id
Ref: phone_number.twilio_id > twilio_account.id

// Call log relations
Ref: call_log.from_id > phone_number.id
Ref: call_log.to_id > phone_number.id

Ref: twilio_account.user_id > user.id

Ref: contact.user_id - user.id
