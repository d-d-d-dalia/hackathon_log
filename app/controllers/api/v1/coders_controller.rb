class Api::V1::CodersController < ApplicationController

    before_action :find_coder, only: [:update, :show]

    def index
        #byebug
      @coders = Coder.all
      render json: @coders
    end
  
    def update
      @coder.update(coder_params)
      if @coder.save
        render json: @coder, status: :accepted
      else
        render json: { errors: @coder.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def show
        find_coder
    end
  
    private
  
    def coder_params
      params.permit(:name, :language)
    end
  
    def find_coder
      @coder = Coder.find(params[:id])
    end
    
end
