require "tempfile"

file = Tempfile.new("dump")
file.write($stdin.read.force_encoding("utf-8"))
file.rewind
`rubocop -a #{file.path}`
out = file.read
file.close
file.unlink
puts out
