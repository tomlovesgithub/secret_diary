class SecretDiary

  attr_reader :unlocked

  def initialize
    lock
    @diary = []

  end

  def unlock(name = nil)
    @name = name
    name == PASSWORD ? @unlocked = true : @unlocked = false
  end

  def lock
    @unlocked = false
  end

  def add_entry
    @unlocked == true ? add : raise("Diary Locked")
  end

  def add
    date = ("#{Time.new.day}/#{Time.new.month}/#{Time.new.year}")
    p "Hi, #{@name} add an entry for #{date}"
    entry = gets.chomp
    @diary << {date => entry}
  end

  private

  PASSWORD = "tom"

end
