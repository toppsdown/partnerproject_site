class Network < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :groups, dependent: :destroy
  has_many :shares, dependent: :destroy

  # validate an email in this network
end
