class AddedResultOutputToCodeStatus < ActiveRecord::Migration
  def self.up
    remove_column :code_tests, :number_of_tests
    
    add_column :code_statuses, :result_output, :text
    change_column :code_statuses, :speed, :decimal, :limit => nil
  end

  def self.down
    add_column :code_tests, :number_of_tests, :integer
    
    remove_column :code_statuses, :result_output
    change_column :code_statuses, :speed, :integer, :limit => 10, :precision => 10, :scale => 0
  end
end
