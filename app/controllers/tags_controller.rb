class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.questions
    render 'index'
  end
end
