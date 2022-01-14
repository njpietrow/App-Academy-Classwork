class Card
  attr_reader :face_value, :visible

  DICTIONARY = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']

  def self.make_random_card
    Card.new(DICTIONARY.sample, false)
  end

  def initialize(face_value, visible = false)
    @face_value = face_value
    @visible = visible
  end

  def hide
    @visible = false
  end

  def reveal
    @visible = true
  end

  def visible?
    @visible
  end

  def to_s
    if @visible == true
      return @face_value
    else
      return ' '
    end
  end

  def ==(other_card)
    begin
      self.face_value == other_card.face_value
    rescue
      false
    end

  end

end

