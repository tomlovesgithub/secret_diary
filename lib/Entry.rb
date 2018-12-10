require_relative "./secret_diary"

class Entry

  def initialize(title, entry, diary)
    title = title.to_sym
    diary.diary << {title => entry}
  end

end
