# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##THIS IS OUR FIRE AND ELECTRIC DECK

User.destroy_all
Deck.destroy_all
Card.destroy_all

user1 = User.create(name: "Nick")

deck1 = Deck.create!(name: "Fire and Electric Starter Deck", user: user1)
deck2 = Deck.create!(name: "Grass and Psychic Starter Deck", user: user1)

raw_cards_deck1 = RestClient.get('https://api.pokemontcg.io/v1/cards?types=fire|lightning')
deck1_cards = JSON.parse(raw_cards_deck1)

raw_cards_deck2 = RestClient.get('https://api.pokemontcg.io/v1/cards?types=psychic|grass')
deck2_cards = JSON.parse(raw_cards_deck2)



# byebug

60.times do
    random_card = deck1_cards["cards"].sample
    
    no_attack = {name: "No Attack", damage: 0}

    if random_card["attacks"][1] == nil
        random_card["attacks"].push(no_attack)
        # byebug
    end
    Card.create!(name: random_card["name"], imageUrl: random_card["imageUrlHiRes"], hp: random_card["hp"].to_i, attack_name: random_card["attacks"][0]["name"], attack_damage: random_card["attacks"][0]["damage"].to_i,
    attack_name_2: random_card["attacks"][1]["name"], attack_damage_2: random_card["attacks"][1]["damage"].to_i, deck: deck1)
    # byebug
end

60.times do
    random_card = deck2_cards["cards"].sample

    no_attack = {name: "No Attack", damage: 0}

    if random_card["attacks"][1] == nil
        random_card["attacks"].push(no_attack)
    end

    Card.create!(name: random_card["name"], imageUrl: random_card["imageUrlHiRes"], hp: random_card["hp"].to_i, attack_name: random_card["attacks"][0]["name"], attack_damage: random_card["attacks"][0]["damage"].to_i,
    attack_name_2: random_card["attacks"][1]["name"], attack_damage_2: random_card["attacks"][1]["damage"].to_i, deck: deck2)
    
end