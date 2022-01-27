require_relative 'questions_database'

class Reply

  attr_accessor :id, :body, :author_id, :parent_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map{|datum| Reply.new(datum)}
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if data.empty?
    Reply.new(data.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    data.map {|datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @author_id = options['author_id']
    @parent_id = options['parent_id']
    @question_id = options['question_id']
  end

  def create
    raise "Reply ID already exists in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.body, self.author_id, self.parent_id, self.question_id)
      INSERT INTO
        replies (body, author_id, parent_id, question_id)
      VALUES
        (?, ?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def author
    User.find_by_id(self.author_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM 
        replies
      WHERE
        parent_id = ?
    SQL
    Reply.new(data.first) unless data.empty?
  end
end