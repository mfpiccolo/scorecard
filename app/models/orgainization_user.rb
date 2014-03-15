class OrganizationUser < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user

  validates :role, inclusion: { in: %w(owner member) }
  validates :organization, presence: true
  validates :user, presence: true, uniqueness: { scope: :organization }
end
