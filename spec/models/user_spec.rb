require 'spec_helper'

describe User do
  it { should have_many :tutorials }
  it { should have_many :likes }
  it { should have_many :comments }

  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
end