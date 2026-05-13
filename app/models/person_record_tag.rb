class PersonRecordTag < ApplicationRecord
  belongs_to :person_record
  belongs_to :tag
end
