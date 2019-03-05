require './music_functions.rb'

describe "add" do

  context "when album doesn't exist" do
    before do
      $albums = {}
    end

     it "adds new album" do
      expect(add("Ride the Lightning", "Metallica")).to eq ["Ride the Lightning", "Metallica"]
    end

  end

  context "when song title already exists" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed"}
    end

    it "will not add duplicate album" do
      expect(add("Ride the Lightning", "Metallica")).to eq nil
    end
  end

end


describe "show all" do

  context "when library is empty" do
    before do
      $albums = {}
    end

    it "shows no albums" do
      expect(show_all).to eq nil
    end
  end

  context "when libray contains songs" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "shows all albums" do
      expect(show_all).to eq ({["Ride the Lightning", "Metallica"]=>"unplayed", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"})
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

  context "when library doesn't contain that particular song" do
    before do
      $albums = {["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "does not play song" do
      expect(play("Ride the Lightning")).to eq nil
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

describe "show unplayed" do

  context "when library is empty" do
    before do
      $albums = {}
    end

    it "shows no albums" do
      expect(show_unplayed).to eq nil
    end
  end

  context "when library doesn't contain unplayed songs" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"played"}
    end

    it "shows no albums" do
      expect(show_unplayed).to eq nil
    end
  end

  context "when library contains unplayed songs" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"played", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "shows unplayed albums" do
      expect(show_unplayed).to eq [["Pauls Boutique", "Beastie Boys"]]
    end
  end

end

describe "show all by" do

  context "when library is empty" do
    before do
      $albums = {}
    end
    it "shows no albums" do
      expect(show_all_by("Beastie Boys")).to eq nil
    end
  end

  context "when library doesn't contain songs by that artist" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed"}
    end

    it "shows no albums" do
      expect(show_all_by("Beastie Boys")).to eq nil
    end
  end

  context "when library contains songs by that artist" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed"}
    end

    it "shows albums" do
      expect(show_all_by("Metallica")).to eq [["Ride the Lightning", "Metallica"]]
    end
  end

end

describe "show unplayed by" do

  context "when library is empty" do
    before do
      $albums = {}
    end

    it "shows no albums" do
      expect(show_unplayed_by("Beastie Boys")).to eq nil
    end
  end

  context "when library doesn't contain unplayed albums by that artist" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"unplayed", ["Pauls Boutique", "Beastie Boys"]=>"played"}
    end

    it "shows no albums" do
      expect(show_unplayed_by("Beastie Boys")).to eq nil
    end
  end

  context "when library contains unplayed albums by that artist" do
    before do
      $albums = {["Ride the Lightning", "Metallica"]=>"played", ["Pauls Boutique", "Beastie Boys"]=>"unplayed"}
    end

    it "shows albums" do
      expect(show_unplayed_by("Beastie Boys")).to eq [["Pauls Boutique", "Beastie Boys"]]
    end
  end

end
