LUNCH = 40

def get_input
  if ARGV.size == 1 then
    ARGV.first
  else
    STDIN.read
  end
end

def handle_input_options(input_string)
  if ['-h', '--h', '-help', '--help'].any? {|str| str == input_string} then
    puts 'call with start and end time formatted like HH.MM - HH.MM as argument or as STDIN, ex: >pbpaste | ruby time_calculator.rb'
    exit!
  end
end

def to_minutes(time)
  hour, minute = time.split('.')
  (hour.to_i * 60) + minute.to_i
end

def minutes_to_time(minutes)
  hour = minutes / 60
  minute = minutes % 60
  hour.to_s + '.' + add_padding(minute)
end

def add_padding(number)
  "%02d" % number
end

def calculate_work_time(start_and_end_time)
  start_time, end_time = start_and_end_time.split('-')
  minutes_at_work = (to_minutes end_time.strip) - (to_minutes start_time.strip) - LUNCH
  minutes_to_time minutes_at_work
end

def handle_input
  input_string = get_input
  handle_input_options input_string
  
  if File.file? input_string
    puts "its a file"
    #TODO handle each line that matches a regexp and append the calculate times to those
  else
    puts calculate_work_time(input_string)
  end
end

handle_input
