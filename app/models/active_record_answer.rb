class ActiveRecordAnswer < ApplicationRecord
  belongs_to :active_record_question

  validates :method, presence: true
end
