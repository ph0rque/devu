class CodeTest < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title           :string
    description     :text
    test_body       :text #change to :markdown
    number_of_tests :integer
    published       :boolean
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :test_framework
  has_many   :code_solutions

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
