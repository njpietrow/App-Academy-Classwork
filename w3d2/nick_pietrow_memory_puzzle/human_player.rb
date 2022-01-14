class HumanPlayer
  def initialize(name)
    @name = name
  end

  def prompt
    puts "#{@name}, please enter the position of the card you'd like to flip"
    print "=> "
    pos = gets.chomp.split(',')
    pos.map!(&:to_i)
  end

  def receive_revealed_card(pos, face_value)
  end

  def receive_match(pos_1, pos_2)
  end

end