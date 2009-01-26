class AddedBodyToTestsTable < ActiveRecord::Migration
  def self.up
    add_column :code_tests, :test_body, :text
  end

  def self.down
    remove_column :code_tests, :test_body
  end
end
