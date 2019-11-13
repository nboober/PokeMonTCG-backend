class DecksController < ApplicationController

    def create
        deck = Deck.create(name: params[:deck_name], user_id: params[:user_id])

        raw_cards = RestClient.get("https://api.pokemontcg.io/v1/cards?types=#{params[:type1]}|#{params[:type2]}&subtype=EX|Mega|stage_1|basic|stage_2")
        cards_hash = JSON.parse(raw_cards)
        cards = cards_hash["cards"]


        face_down = cards.select{|card| card["name"] == "Ho-Oh BREAK"} #removing face down card
        cards.delete(face_down[0]) #removing face down card
        
        60.times do
            random_card = cards.sample
            
            no_attack = {name: "No Attack", damage: 0}
        
            if random_card["attacks"][1] == nil
                random_card["attacks"].push(no_attack)
            end

            Card.create!(name: random_card["name"], imageUrl: random_card["imageUrlHiRes"], hp: random_card["hp"].to_i, attack_name: random_card["attacks"][0]["name"], attack_damage: random_card["attacks"][0]["damage"].to_i,
            attack_name_2: random_card["attacks"][1]["name"], attack_damage_2: random_card["attacks"][1]["damage"].to_i, deck: deck)
        end
    end
    
    
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
