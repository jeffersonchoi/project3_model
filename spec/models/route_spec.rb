require 'rails_helper'

RSpec.describe Route, type: :model do
  it { should have_many(:buses) }
  it { should have_many(:stops) }
end
