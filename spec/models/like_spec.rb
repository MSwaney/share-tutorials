require 'spec_helper'

describe Like do
  it { should belong_to :user }
  it { should belong_to :tutorial }
  it { should validate_uniqueness_of(:user_id).scoped_to(:tutorial_id) }
end