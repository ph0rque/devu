class CodeStatus < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    tests_passed :integer
    memory_used  :integer
    speed        :decimal
    timestamps
  end

  belongs_to :code_solution

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
