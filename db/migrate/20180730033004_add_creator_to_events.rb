class AddCreatorToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :creator, foreign_key: {on_delete: :cascade}
  end
end
