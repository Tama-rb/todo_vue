class Api::TodosController < ApplicationController
  def index
    render json: Todo.order('updated_at DESC')
  end

  def show
     render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, adapter: :json, status: 201
    else
      render json: { error: @todo.errors }, status: 422
    end
  end

  def update
    @todo = Todo.find(params[:todo_id])
    if @todo.update(todo_params)
      render json: Todo.find_by(id: params[:todo_id]), status: :ok
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
