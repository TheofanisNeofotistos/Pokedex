# == Schema Information
#
# Table name: poke_moves
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  move_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PokeMove < ApplicationRecord
    validates :move_id , uniqueness: {scope: :pokemon_id,
    message: "you can only have this move equipped once"}

    belongs_to :pokemon,
    primary_key: :id,
    foreign_key: :pokemon_id,
    class_name: :Pokemon

    belongs_to :move, 
    primary_key: :id,
    foreign_key: :move_id,
    class_name: :Move
end
