$albums = {}

# add songs to your library
def add title, artist
  $albums.each do |album, status|
    # screen for duplicates
    if album[0].downcase == title.downcase
      return "You already have a song by that name."
    end
  end
    album = [title, artist]
    $albums[album] = "unplayed"
    puts "Added \"#{title}\" by #{artist}"
end

# play songs
def play title
  if $albums.any?
    $albums.each do |album, status|
      if album[0].downcase == title.downcase
        puts "You're listening to \"#{album[0]}\""
        $albums[album] = "played"
      else
        puts "You don't have any songs by that name."
      end
    end
  else
    puts "You don't have any albums! You should add some."
  end
end

# see all songs
def show_all
  if $albums.any?
    $albums.each { |album, status| puts "#{album[0]} by #{album[1]} (#{status})" }
  else
    puts "You don't have any albums! You should add some."
  end
end

# see unplayed songs
def show_unplayed
  if $albums.any?
    if $albums.value?("unplayed")
      $albums.each do |album, status|
        if status == "unplayed"
          puts "\"#{album[0]}\" by #{album[1]}"
        end
      end
    else
      puts "You have no unplayed albums"
    end
  else
    puts "You don't have any albums! You should add some."
  end
end

# show all songs by a specific artist
def show_all_by artist
  if $albums.any?
    x = nil
    $albums.each do |album, status|
      if album[1].downcase == artist.downcase
        puts "\"#{album[0]}\" by #{album[1]}"
        x = true
      end
    end
    if x == nil
      puts "You don't have any albums by that artist."
    end
  else
    puts "You don't have any albums! You should add some."
  end
end

# show unplayed songs by a specific artist
def show_unplayed_by artist
  if $albums.any?
    x = nil
    $albums.each do |album, status|
      if album[1].downcase == artist.downcase
        if status == "unplayed"
          puts "\"#{album[0]}\" by #{album[1]}"
           x = true
        end
        if x == nil
          puts "You don't have any unplayed albums by that artist."
        end
      end
    end
    if x == nil
      puts "You don't have any albums by that artist."
    end
  else
    puts "You don't have any albums! You should add some."
  end
end
