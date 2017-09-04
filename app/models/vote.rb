class Vote < ActiveRecord::Base
  belongs_to :option, counter_cache: true
  belongs_to :user, counter_cache: true
  belongs_to :poll, counter_cache: true
end
