class User
  include Mongoid::Document

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  before_create :capitalize

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  private

  def capitalize
    self.first_name.capitalize!
    self.last_name.capitalize!
  end
end
