class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.string :title
      t.string :full_name
      t.string :nationality
      t.string :mobile
      t.string :email
      t.string :occupation

      t.timestamps
    end
  end
end
