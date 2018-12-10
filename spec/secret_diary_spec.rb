require_relative '../lib/secret_diary.rb'

# Test-drive the secret diary example:

describe SecretDiary do

  # SecretDiary
  #   - lock
  #   - unlock

  let(:diary) { SecretDiary.new }

  context "#lock" do

    it "locks diary" do
      (diary.unlock)
      expect{diary.lock}.to change{diary.unlocked}.from(true).to(false)
    end
    # Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.
    context "when locked" do

      #   - add_entry

      it "#add_entry throws errors" do
        expect{ diary.add_entry("stuff","things") }.to raise_error("Diary locked")
      end

      #   - get_entry

      it "#get_entry throws errors" do
        expect{ diary.get_entry("stuff") }.to raise_error("Diary locked")
      end

      #   - get_entries

      it "#get_entry throws errors" do
        expect{ diary.get_entries }.to raise_error("Diary locked")
      end

    end

  end

  context "#unlock" do

    it "unlocks diary" do
      expect { diary.unlock }.to change{diary.unlocked}.from(false).to(true)
    end

    context "when unlocked" do
      # When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.
      before(:each) { diary.unlock }

      it "#add_entry adds entries" do
        expect { diary.add_entry("stuff","things") }.to change { diary.get_entries.count }.from(0).to(1)
      end

    end

    context "after entries added" do

      before(:each) { diary.unlock }
      before(:each) {
        diary.add_entry("stuff","things")
        diary.add_entry("things","and stuff")
        diary.add_entry("and stuff","and things")
      }

      it "get_entry(title) gets specific entry" do
        expect(diary.get_entry("stuff")).to eq("things")
      end

      it "get_entry(title) gets specific entry" do
        expect(diary.get_entries).to eq([{:stuff=>"things"}, {:things=>"and stuff"}, {:"and stuff"=>"and things"}])
      end

    end


  end

end
