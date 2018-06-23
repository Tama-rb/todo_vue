class Api::TodosController < ApplicationController
  def index
    render json: Todo.order('updated_at DESC')
  end

  def show
     render json: Todo.find_by(id: params[:todo_id])
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render :show, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render :show, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.fetch(:todo, {}).permit(
          :content, :is_done
      )
    end
end
