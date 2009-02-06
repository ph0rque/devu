class CodeTest < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title           :string
    description     :text
    test_body       :text #TODO change to :markdown
  # number_of_tests :integer don't need this with hobo
    published       :boolean
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :test_framework
  has_many   :code_solutions, :dependent => :destroy #TODO remove before deployment

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
