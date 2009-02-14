class CodeTest < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title           :string
    description     :text
    test_body       :text
  # number_of_tests :integer don't need this with hobo
    published       :boolean
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :test_framework
  has_many   :code_solutions, :dependent => :destroy

  validates_presence_of :test_framework
  
  named_scope :published,   :conditions => ['published = ?', true]
  named_scope :unpublished, :conditions => ['published = ?', false]
  
  # --- Permissions --- #

  def create_permitted?
    user_is?(acting_user)
  end

  def update_permitted?
    !test_framework_changed? && ((user_is?(acting_user) && published == false) || acting_user.administrator?)
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
