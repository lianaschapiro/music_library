puts "Welcome to your music collection!"

$albums = {}

def add title, artist
  album = "#{title} by #{artist}"
  $albums[album] = "unplayed"
  "added #{album}"
end

def play title

end

def show_all
  $albums.each { | album, status | return "#{album} (#{status})" }
end

def show_unplayed

end

def show_unplayed_by artist
end

def quit

end

require 'irb'
IRB.start

