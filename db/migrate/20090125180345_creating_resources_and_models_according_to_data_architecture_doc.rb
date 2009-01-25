class CreatingResourcesAndModelsAccordingToDataArchitectureDoc < ActiveRecord::Migration
  def self.up
    create_table :code_tests do |t|
      t.string   :title
      t.text     :description
      t.integer  :number_of_tests
      t.boolean  :published
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
    
    create_table :code_solutions do |t|
      t.string   :title
      t.text     :code
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :code_test_id
    end
    
    create_table :code_statuses do |t|
      t.integer  :tests_passed
      t.integer  :memory_used
      t.decimal  :speed
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :code_solution_id
    end
    
    create_table :test_frameworks do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :code_test_id
    end
  end

  def self.down
    drop_table :code_tests
    drop_table :code_solutions
    drop_table :code_statuses
    drop_table :test_frameworks
  end
end
