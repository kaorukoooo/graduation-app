class PersonRecord < ApplicationRecord
  belongs_to :user
  has_many :person_record_tags, dependent: :destroy
  has_many :tags, through: :person_record_tags

  validates :nickname, presence: true
end
