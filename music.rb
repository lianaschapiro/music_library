puts "Welcome to your music collection!"

$albums = {}

def add title, artist
  album = [title, artist]
  $albums[album] = "unplayed"
  "Added #{title} by #{artist}"
end

def play title

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
        puts "#{album}"
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

