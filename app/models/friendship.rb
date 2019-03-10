class Friendship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :friend, class_name: 'User', optional: true
end
