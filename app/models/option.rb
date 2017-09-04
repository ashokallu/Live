class Option < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :poll
  has_many :votes, :dependent => :nullify
end
