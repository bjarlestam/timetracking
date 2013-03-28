require 'date'

def add_padding(number)
  "%02d" % number
end

def add_day(day)
  add_padding(day.mday).to_s + " " + day.strftime("%a")[0].downcase + " \n"
end

monday = Date.today - Date.today.wday + 1

output = ""
output << "v" + add_padding(monday.cweek.to_s) + "\n"

for i in 0..4
  output << add_day(monday + i)
end

if ARGV.size == 1 then
  file = File.open(ARGV.first, "a")
  file.puts("\n")
  file.puts(output)
  file.close
else
  puts output
end

