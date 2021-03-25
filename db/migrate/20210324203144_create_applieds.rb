class CreateApplieds < ActiveRecord::Migration[5.1]
  def change
    create_table :applieds do |t|
      t.string :user_id
      t.string :job_id

      t.timestamps
    end
  end
end
