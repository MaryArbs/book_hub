class AddProfileUrlToBooks < ActiveRecord::Migration
  def change
    add_column :books, :profile_url, :string
  end
end
