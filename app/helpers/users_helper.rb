module UsersHelper
  def get_questions(questions)
    "#{questions.count} #{I18n.t 'question', count: questions.count}"
  end
end