# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
    validates :image_url, presence: true 
    validates :captured, inclusion: [true,false]
    validates :name , length: {minimum: 3 , maximum: 255} , uniqueness: {message: " '%{value}' is already in use "}
    validates :number , numericality: {greater_than: 0}, uniqueness: {message: " '%{value}' has already been declared "}
    validates :attack , numericality: {in: 0..100}
    validates :defense, numericality: {in: 0..100}

    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel',
        'fairy',
        'dark'
      ].sort.freeze
      #we checked bulbapedia you are welcome
    
      validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }

      has_many :poke_moves, 
      primary_key: :id,
      foreign_key: :pokemon_id,
      class_name: :PokeMove,
      dependent: :destroy

      has_many :items, 
      primary_key: :id,
      foreign_key: :pokemon_id,
      class_name: :Item,
      dependent: :destroy

      has_many :moves, 
      through: :poke_moves,
      source: :move

end
