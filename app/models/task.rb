class Task < ApplicationRecord
  scope :are_done, -> (is_done) { where is_done: is_done }
end
