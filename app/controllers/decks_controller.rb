class DecksController < ApplicationController

    def show
        deck = Deck.find(params[:id])
        
        render json: deck.to_json(to_serialized_json)
    end

    private

    def to_serialized_json
        {
    :include => {:cards => {
            :except => [:created_at, :updated_at]
        }},
        :except => [:created_at, :updated_at]
    }
    end

end
