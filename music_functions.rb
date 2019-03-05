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
    return album
end

# play songs
def play title
  if $albums.any?
    $albums.each do |album, status|
      if album[0].downcase == title.downcase
        $albums[album] = "played"
        puts "You're listening to \"#{album[0]}\""
        return album => $albums[album]
      end
    end
    puts "You don't have any songs by that name."
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
      unplayed = []
      $albums.each do |album, status|
        if status == "unplayed"
          puts "\"#{album[0]}\" by #{album[1]}"
          unplayed.push(album)
        end
      end
      return unplayed
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
    artist_albums = []
    $albums.each do |album, status|
      if album[1].downcase == artist.downcase
        puts "\"#{album[0]}\" by #{album[1]} (#{status})"
        artist_albums.push(album)
        x = true
      end
    end
    if x == true
      return artist_albums
    else
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
    artist_unplayed = []
    $albums.each do |album, status|
      if album[1].downcase == artist.downcase
        if status == "unplayed"
          puts "\"#{album[0]}\" by #{album[1]}"
          artist_unplayed.push(album)
          x = true
        end
      end
    end
    if x == true
      return artist_unplayed
    else
      puts "You don't have any unplayed albums by that artist."
    end
  else
    puts "You don't have any albums! You should add some."
  end
end
