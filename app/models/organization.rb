class Organization < ActiveRecord::Base
  has_many :categories, class_name: DefaultCategory, dependent: :destroy
  has_many :organization_users, dependent: :destroy
  has_many :users, through: :organization_users
  has_many :scorecards
end
