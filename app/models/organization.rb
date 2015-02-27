class Organization < ActiveRecord::Base
  acts_as_our_cities_organization

  has_many :memberships
  has_many :users, through: :memberships
end
