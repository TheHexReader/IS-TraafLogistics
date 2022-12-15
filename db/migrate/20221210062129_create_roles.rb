class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :role_name
      t.boolean :can_destroy

      t.timestamps
    end
  end
end
