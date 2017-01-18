module QuestionHelper
  @questions_count = @questions.count
  @answers_count = @questions.where.not(answer: nil).count
  @unanswered_count = @questions_count - @answers_count
end
