class Invitation < ActiveRecord::Base
  validates_presence_of :invited_email
  validates_presence_of :invited_name
  validates_presence_of :inviter_name
end
