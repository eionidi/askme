# (c) goodprogrammer.ru
#
# Модель вопроса.
# Каждый экземпляр этого объекта — загруженная из БД информация о конкретном вопросе.
class Question < ActiveRecord::Base
  # эта команда добавляет связь с моделью User на уровне объектов
  # она же добавляет метод .user к данному объекту
  belongs_to :user
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :tags

  # эта валидация препятствует созданию Вопросов, у которых нет пользователя
  # если задан пустой text, объект не будет сохранен в базу
  validates :text, :user, presence: true

  before_save :create_h_tags

  def self.get_tags_from_question(question)
    question.text.scan(/#[\w]+/).map {|tag| tag.downcase.delete('#')}.uniq
  end

  def create_h_tags
    #Question.get_tags_from_question(self).map {|tag| Tag.find_or_create_by(title: tag)}
    h_tags = []
    tags = Question.get_tags_from_question(self)
    tags.each do |tag|
      h_tags << Tag.find_or_create_by(title: tag)
    end

    self.tags = h_tags if h_tags.any?
  end
end
