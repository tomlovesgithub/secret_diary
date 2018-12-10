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

require_relative '../lib/cohesion.rb'

describe SecretDiary do

  let(:diary) { SecretDiary.new }

  context "responds to" do

    it "#lock" do
      diary.unlock("tom")
      expect{diary.lock}.to change{diary.unlocked}.from(true).to(false)
    end

    it "#unlock with no args prompts user for password" do
      expect { diary.unlock }.to_not change { diary.unlocked }
    end

    it "#unlock with 'password' as arg unlocks" do
      expect{diary.unlock("tom")}.to change{diary.unlocked}.from(false).to(true)
    end

  end

  context "when locked" do

    it "#add_entry throws errors" do
      expect{ diary.add_entry("stuff","things") }.to raise_error{ "Diary locked" }
    end

  end

  context "when unlocked" do

    before(:each) { diary.unlock("tom") }

    it "#add_entry adds entries" do

      expect{ diary.add_entry }.to change{ diary.diary.count }.from[0].to[1]
    end

  end

end
