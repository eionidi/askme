# (c) goodprogrammer.ru
#
# Модель вопроса.
# Каждый экземпляр этого объекта — загруженная из БД информация о конкретном вопросе.
class Question < ActiveRecord::Base
  # эта команда добавляет связь с моделью User на уровне объектов
  # она же добавляет метод .user к данному объекту
  belongs_to :user
  belongs_to :author, class_name: 'User'

  # эта валидация препятствует созданию Вопросов, у которых нет пользователя
  # если задан пустой text, объект не будет сохранен в базу
  validates :text, :user, presence: true
end
