class ChangeTable2 < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :items, :pokemons
  end
end
