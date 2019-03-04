require './music_functions.rb'

describe "add" do

  context "when album doesn't exist" do
    before do
      $albums = {}
    end

     it "adds new album" do
      expect(add("Ride the Lightning", "Metallica")).to eq nil
    end
  end

  context "when song title already exists" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed"}
    end

    it "will not add duplicate album" do
      expect(add("Ride the Lightning", "Metallica")).to eq "You already have a song by that name."
    end
  end

end


describe "show all" do

  context "when library is empty" do
    before do
      $albums = {}
    end

    it "shows no albums" do
      expect(show_all()).to eq nil
    end
  end

  context "when libray contains songs" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "shows all albums" do
      expect(show_all()).to eq ({["Ride the Lightning", "Metallica"]=>"unplayed", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"})
    end
  end

end

describe "play" do
  context "when library is empty" do
    before do
      $albums = {}
    end

    it "does not play song" do
      expect(play("Ride the Lightning")).to eq nil
    end
  end

  context "when library does not contain that particular song" do
    before do
      $albums = {["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "does not play song" do
      expect(play("Ride the Lightning")).to eq ({["Pauls Boutique", "Beastie Boys"]=>"unplayed"})
    end
  end

  context "when library contains that particular song" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed"}
    end

    it "plays song" do
      expect(play("Ride the Lightning")).to eq ({["Ride the Lightning", "Metallica"]=>"played"})
    end
  end
end

# describe "show unplayed" do
#   it "shows unplayed albums" do
#     expect(show_unplayed()).to eq "You have no unplayed albums"
#   end
# end


