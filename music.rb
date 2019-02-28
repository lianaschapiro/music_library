"Welcome to your music collection!"

$albums = {}

def add title, artist
  $albums.each do |album, status|
    if album[0].downcase == title.downcase
      return "You already have a song by that name."
    end
  end
    album = [title, artist]
    $albums[album] = "unplayed"
    puts "Added \"#{title}\" by #{artist}"
end

def play title
  $albums.each do |album, status|
    if album[0].downcase == title.downcase
      puts "You're listening to \"#{album[0]}\""
      $albums[album] = "played"
    else
      "You don't have any songs by that name."
    end
  end
end

def show_all
  if $albums.any?
    $albums.each { |album, status| puts "#{album[0]} by #{album[1]} (#{status})" }
  else
    "You don't have any albums! You should add some."
  end
end

def show_unplayed
  if $albums.value?("unplayed")
    $albums.each do |album, status|
      if status == "unplayed"
        puts "\"#{album[0]}\" by #{album[1]}"
      end
    end
  else
    "You have no unplayed albums"
  end
end

def show_unplayed_by artist
end

def quit

end

require 'irb'
IRB.start

