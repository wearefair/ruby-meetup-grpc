require 'log'
require 'person_pb'

logs
person = Person.new(name: 'Marshall', id: 12345)
person.email = 'marshall@email.com' # set an attribute directly
log 'Person with attributes', person

encoded = Person.encode(person)
log "Binary (length: #{encoded.length})", encoded

json_encoded = Person.encode_json(person)
log "JSON (length: #{json_encoded.length})", json_encoded, inspect: false

log 'Decoded', Person.decode(encoded)
