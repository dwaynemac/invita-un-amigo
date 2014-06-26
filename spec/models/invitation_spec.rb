require 'spec_helper'

describe Invitation do
  it { should validate_presence_of :inviter_name }
  it { should validate_presence_of :invited_name }
  it { should validate_presence_of :invited_email }
end
