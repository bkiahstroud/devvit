class AddSubdevvitToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :subdevvit
    add_foreign_key :posts, :subdevvits
  end
end
