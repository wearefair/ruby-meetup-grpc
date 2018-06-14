def log(msg, obj):
    print("{0}:\n\t<{1}: {2}: {3}, {4}: {5}, {6}: {7}>\n".format(
        msg, type(obj).__name__, "name", obj.name, "id", obj.id, "email", obj.email))
