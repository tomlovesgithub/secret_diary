# First organise it into one class only.
#
# class SecretDiary
#
#   attr_reader :unlocked
#
#   def initialize
#     @diary = []
#     lock
#   end
#
#   def unlock
#     @unlocked = true
#   end
#
#   def lock
#     @unlocked = false
#   end
#
#   def add_entry(title, entry)
#     check
#     title = title.to_sym
#     @diary << {title => entry}
#   end
#
#   def check
#     if @unlocked == false
#       fail("Diary locked")
#     end
#   end
#
#   def get_entry(title)
#     check
#     @diary[0][title.to_sym]
#   end
#
#   def get_entries
#     check
#     @diary
#   end
#
# end

# require_relative "./Entry.rb"

# Then, when all your tests are green, reorganise it into classes with high cohesion.
#
# This will also involve reorganising your tests!

require_relative "./lock.rb"
require_relative "./Entry"


class SecretDiary

  include Lock

  attr_accessor :diary

  def initialize
    @diary = []
    lock
  end

  def add_entry(title, entry)
    check
    new_entry = Entry.new(title, entry, self)
  end

  def check
    if @unlocked == false
      fail("Diary locked")
    end
  end

  def get_entry(title)
    check
    @diary[0][title.to_sym]
  end

  def get_entries
    check
    @diary
  end

end
