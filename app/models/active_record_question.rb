class ActiveRecordQuestion < ApplicationRecord
  has_one :active_record_answer, dependent: :destroy
  accepts_nested_attributes_for :active_record_answer

  validates :question_text, presence: true
end
