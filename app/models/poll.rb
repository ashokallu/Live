class Poll < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  has_many :options, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  accepts_nested_attributes_for :options

  def with_blank_options(n=4)
  	n.times do
  		options.build
  	end
  	self
  end
end
