class CodeSolutionsBelongToUsers < ActiveRecord::Migration
  def self.up
    add_column :code_solutions, :user_id, :integer
  end

  def self.down
    remove_column :code_solutions, :user_id
  end
end
