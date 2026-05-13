class Tag < ApplicationRecord
  belongs_to :user, optional: true
  has_many :person_record_tags, dependent: :destroy
  has_many :person_records, through: :person_record_tags

  validates :name, presence: true
  validates :tag_type, presence: true
  validates :sentiment, presence: true
end
