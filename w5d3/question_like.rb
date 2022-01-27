require_relative 'questions_database'

class QuestionLike

  attr_accessor :like_id, :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|datum| QuestionLike.new(datum) }
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes
        ON  question_likes.user_id = users.id
      WHERE
        question_likes.question_id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*)
      FROM
        users
      WHERE
        users.id IN (
          SELECT
            user_id
          FROM
            question_likes
          WHERE
            question_id = ?
          )
    SQL
    data.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
        ON questions.id = question_likes.question_id
      
      
    SQL
  end


  def initialize(options)
    @like_id = options['like_id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end