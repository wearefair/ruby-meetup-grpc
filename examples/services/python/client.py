import grpc
from person_pb2 import GetPersonRequest
from person_pb2_grpc import PersonServiceStub
from log import log

channel = grpc.insecure_channel('localhost:50051')
client = PersonServiceStub(channel)

person = client.GetPerson(GetPersonRequest(id = 100))
log("Got person 100", person)

try:
    person = client.GetPerson(GetPersonRequest(id = 200))
except grpc.RpcError as e:
    print("Got error for user 200:\n\t{}\n".format(e))
