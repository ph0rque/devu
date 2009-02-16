class CodeSolution < ActiveRecord::Base

  hobo_model # Don't put anything above this
  include FileUtils

  fields do
    title :string
    code  :text
    timestamps
  end
  
  belongs_to :user, :creator => true
  belongs_to :code_test
  has_many   :code_statuses, :dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    user_is?(acting_user)
  end
 
  def update_permitted?
    (user_is?(acting_user) || acting_user.administrator?) && !code_test_changed?

  end
 
  def destroy_permitted?
    (acting_user.signed_up? && user_is?(acting_user)) || acting_user.administrator?
  end
 
  def view_permitted?(field)
    true
  end

  def execute
    require 'popen4'

    # Create directories if they don't exist for: rails_root / test_execution / id /
    FileUtils.mkdir_p "#{RAILS_ROOT}/test_execution/#{self.id}"
    
    # Write the test body to a file in: rails_root / test_execution / id / test.rb
    file = File.new("#{RAILS_ROOT}/test_execution/#{self.id}/test.rb", "w") 
    
    # Dump the DB fields to the files
    file.write(self.code + "\n\n" + self.code_test.test_body)
    file.close
    
    # Invoke the test.rb file with the Ruby interpreter capturing stdout and stderr
    if self.code_test.test_framework.name == 'Rspec'
      pid, stdin, stdout, stderr = Open4::popen4("spec test.rb")
    else
      pid, stdin, stdout, stderr = Open4::popen4("ruby test.rb")
    end
    
    # Delete the rails_root / test_execution / id / directory and it's contents
    # Do we need to do this?
    
    # Return the output
    cs = self.code_statuses << CodeStatus.create(:result_output => (stdout || stderr))
    return cs.result_output
  end
end
