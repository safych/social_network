class AddAvatarToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :avatar, :string
  end
end
