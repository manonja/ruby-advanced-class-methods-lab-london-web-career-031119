require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    # return the new song created
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song

  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    @@all.last
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    # song = Song.new_from_filename("Thundercat - For Love I Come.mp3")
    # expect(song.name).to eq("For Love I Come")
    # expect(song.artist_name).to eq("Thundercat")
    data = filename.split(/[-.]/)
    # ["Thundercat ", " For Love I Come", "mp3"]
    new_name = data[1].strip
    new_artist_name = data[0].strip
    # make a new instance
    new_song = self.new
    new_song.name = new_name
    new_song.artist_name = new_artist_name
    #return the song
    new_song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
    @@all.last
  end

  def self.destroy_all
    @@all.clear
  end
end

# binding.pry

# puts "something"
