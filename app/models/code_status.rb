class CodeStatus < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    result_output :text
    tests_passed :integer
    memory_used  :integer
    speed        :decimal
    timestamps
  end

  belongs_to :code_solution

  # --- Permissions --- #

  def create_permitted?  ; false; end
  def update_permitted?  ; false; end
  def destroy_permitted? ; false; end

  def view_permitted?(field)
    true
  end

end
