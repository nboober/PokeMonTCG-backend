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


fire_gymLeader = User.create(name: "Fire", password: "gym", username: "fireGym")
water_gymLeader = User.create(name: "Water", password: "gym", username: "waterGym")
  grass_gymLeader = User.create(name: "Grass", password: "gym", username: "grassGym")
 lightning_gymLeader = User.create(name: "Lightning", password: "gym", username: "lightningGym")
psychic_gymLeader = User.create(name: "Psychic", password: "gym", username: "psychicGym")
 rock_gymLeader = User.create(name: "Rock", password: "gym", username: "rockGym")
 poison_gymLeader = User.create(name: "Poison", password: "gym", username: "posionGym")
 ground_gymLeader = User.create(name: "Ground", password: "gym", username: "groundGym")

user1 = User.create(name: "Nick", password: "poke", username: "nboober")
user2 = User.create(name: "Khaled", password: "poke", username: "khassan")
user3 = User.create(name: "Sergio", password: "poke", username: "sperez")
user4 = User.create(name: "Charlie", password: "poke", username: "cchung")
user5 = User.create(name: "Heejae", password: "poke", username: "hhan")
user6 = User.create(name: "Mickey", password: "poke", username: "mpartlow")
user7 = User.create(name: "Tiffany", password: "poke", username: "tabraham")
user8 = User.create(name: "David", password: "poke", username: "dfellows")
user9 = User.create(name: "Cristina", password: "poke", username: "cpark")


    ground_deck = Deck.create(user: ground_gymLeader, name: "Ground Gym Leader Deck")
# # ##Build deck by deck, take out DECK DESTROY ALL AT THE TOP, WHEN YOU SEE A DECK HAS A FULL 60 CARDS THEN MOVE ON, IF DECK BREAKS, JUST DESTROY THAT PARTICULAR DECK AND MOVE ON

  raw_cards_fire = RestClient.get('https://api.pokemontcg.io/v1/cards?types=fighting|colorless')
  fire_cards = JSON.parse(raw_cards_fire)

60.times do
    random_card = fire_cards["cards"].sample
    
    no_attack = {"name" => "No Attack", "damage" => 0}

    if random_card["attacks"][1] == nil
        random_card["attacks"].push(no_attack)
    end
    Card.create!(name: random_card["name"], imageUrl: random_card["imageUrlHiRes"], hp: random_card["hp"].to_i, attack_name: random_card["attacks"][0]["name"], attack_damage: random_card["attacks"][0]["damage"].to_i,
    attack_name_2: random_card["attacks"][1]["name"], attack_damage_2: random_card["attacks"][1]["damage"].to_i, deck: ground_deck)
end


# User.update(167, :name => "Psychic")
# Deck.destroy(120)
# k = (5909..5937).to_a
# Card.delete(k)
#   User.delete(165)
#   Deck.delete(122)