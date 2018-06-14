def log(msg, obj, inspect = true)
  out = inspect ? obj.inspect : obj
  puts "#{msg}:\n\t#{out}\n\n"
end
