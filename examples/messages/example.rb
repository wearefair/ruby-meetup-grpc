require 'log'
require 'person_pb'

person = Person.new()
log "Blank person", person

person = Person.new(name: "Marshall", id: 12345)
person.email = "marshall@email.com"
log "Person with attributes", person

encoded = Person.encode(person)
log "Binary encoding (length: #{encoded.length})", encoded

json_encoded = Person.encode_json(person)
log "JSON encoding (length: #{json_encoded.length})", json_encoded, false

decoded = Person.decode(encoded)
log "Decoded person", decoded
