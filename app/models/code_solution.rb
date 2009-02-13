class CodeSolution < ActiveRecord::Base

  hobo_model # Don't put anything above this

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

end
