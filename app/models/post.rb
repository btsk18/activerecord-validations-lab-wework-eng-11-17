class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with PostValidator
end

class PostValidator < ActiveModel::Validator
  def validate(record)
    record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
  end
end
