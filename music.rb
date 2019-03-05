require './music_functions.rb'

# initial welcome message
puts "Welcome to your music collection!"

# init function parses user response to determine which method to call
def init
  print "> "
  input = gets
  input_array = input.split(/\s(?=(?:[^"]|"[^"]*")*$)/)
  if input_array[0] == "add" && input_array.length == 3
    add(input_array[1], input_array[2])
    init()
  elsif input_array === ['show', 'all']
    show_all()
    init()
  elsif input_array === ['show', 'unplayed']
    show_unplayed()
    init()
  elsif input_array[0] == "play" && input_array.length == 2
    play(input_array[1])
    init()
  elsif input_array[0] == "show" && input_array [1] == "all" && input_array [2] == "by" && input_array.length == 4
    show_all_by(input_array[3])
    init()
  elsif input_array[0] == "show" && input_array [1] == "unplayed" && input_array [2] == "by" && input_array.length == 4
    show_unplayed_by(input_array[3])
    init()
  elsif input_array == ['quit']
    puts "Bye!"
  else
    puts "I don't understand. Please try again with a better command."
    init()
  end
end

init()
