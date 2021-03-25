class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :job_code
      t.text :description
      t.date :date_publishe

      t.timestamps
    end
  end
end
