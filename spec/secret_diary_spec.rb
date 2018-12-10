# Test-drive the secret diary example:
#
# SecretDiary
#   - lock
#   - unlock
#   - add_entry
#   - get_entries
#
# Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.
#
# When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.
#
# When the user calls `lock` again they throw errors again.
# First organise it into one class only.
#
# Then, when all your tests are green, reorganise it into classes with high cohesion.
#
# This will also involve reorganising your tests!

require_relative '../lib/secret_diary.rb'

describe SecretDiary do

  let(:diary) { SecretDiary.new }

  context "#lock" do

    it "locks diary" do
      (diary.unlock)
      expect{diary.lock}.to change{diary.unlocked}.from(true).to(false)
    end

    context "when locked" do

      it "#add_entry and get_entry throw errors" do
        expect{ diary.add_entry("stuff","things") }.to raise_error("Diary locked")
      end

      it "#add_entry and get_entry throw errors" do
        expect{ diary.get_entry("stuff") }.to raise_error("Diary locked")
      end

    end

  end

  context "#unlock" do

    it "unlocks diary" do
      expect { diary.unlock }.to change{diary.unlocked}.from(false).to(true)
    end

    context "when unlocked" do

      before(:each) { diary.unlock }

      it "#add_entry adds entries" do
        expect { diary.add_entry("stuff","things") }.to change { diary.diary.count }.from(0).to(1)

      end

    end

    context "fuck" do

      before(:each) { diary.unlock }
      before(:each) { diary.add_entry("stuff","things") }

      it "fuck" do
        expect(diary.get_entry("stuff")).to eq("things")
      end

    end


  end

end
