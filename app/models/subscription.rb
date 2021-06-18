class Subscription < ApplicationRecord
  belongs_to :user_id

  extend Enumerize

  enumerize :status, in: [:inactive, :free_trial, :active]
end
