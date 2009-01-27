class CodeSolution < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    code  :text
    timestamps
  end

  belongs_to :code_test
  has_many   :code_statuses, :dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end
 
  def update_permitted?
    (acting_user.signed_up? && acting_user == self.user) || acting_user.administrator?
  end
 
  def destroy_permitted?
    (acting_user.signed_up? && acting_user == self.user) || acting_user.administrator?
  end
 
  def view_permitted?(field)
    true
  end

end
