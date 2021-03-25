class CreateAppliedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :_jobs do |t|
      t.string :user_id
      t.string :job_id

      t.timestamps
    end
  end
end
