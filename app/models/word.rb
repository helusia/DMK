class Word
  include ActiveModel::Model

  attr_accessor :word
  validates :word, presence: true
end