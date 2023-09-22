class ActiveRecordQuestion < ApplicationRecord
  has_one :active_record_answer
  accepts_nested_attributes_for :active_record_answer

  validates :question, presence: true
end
