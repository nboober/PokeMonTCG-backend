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
deck1 = Deck.create!(name: "Fire and Electic Starter Deck", user: user1)
raw_cards = RestClient.get('https://api.pokemontcg.io/v1/cards?types=fire|lightning')
cards = JSON.parse(raw_cards)
# byebug

60.times do
    random_card = cards["cards"].sample
    Card.create!(name: random_card["name"], imageUrl: random_card["imageUrlHiRes"], hp: random_card["hp"].to_i, deck: deck1)
end