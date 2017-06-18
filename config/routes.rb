Rails.application.routes.draw do

  # Это правило говорит: если пользователь заходит по адресу /,
  # направь его в контроллер users, действие index
  # Грубо говоря, на главной странице у нас список юзеров
  root 'users#index'

  # ресурс пользователей (экшен destroy не поддерживается)
  resources :users

  # ресурс сессий (только три экшена :new, :create, :destroy)
  resource :session, only: [:new, :create, :destroy]

  # ресурс вопросов (кроме экшенов :show, :new, :index)
  resources :questions, except: [:show, :new, :index]
  resources :tags, only: [:show]
end
