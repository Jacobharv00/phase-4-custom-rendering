class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # only: option
    # render json: cheeses, only: [:id, :name, :price, :is_best_seller]

    # except: option
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
  if cheese
    render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
  else
    render json: { error: 'Cheese not found' }, status: :not_found 
  end
end

end
