class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :contents
      t.string :author
      t.datetime :message_date

      t.timestamps
    end
  end
end
