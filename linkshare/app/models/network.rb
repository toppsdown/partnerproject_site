class Network < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :shares, dependent: :destroy

  # validate an email in this network
end
