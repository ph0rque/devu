class TestFrameworkHasManyTestsNow < ActiveRecord::Migration
  def self.up
    add_column :code_tests, :test_framework_id, :integer
    
    remove_column :test_frameworks, :code_test_id
  end

  def self.down
    remove_column :code_tests, :test_framework_id
    
    add_column :test_frameworks, :code_test_id, :integer
  end
end
