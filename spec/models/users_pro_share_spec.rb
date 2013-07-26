require 'spec_helper'

describe UsersProShare do
  let(:user) { FactoryGirl.create(:user) }
  let(:professional) { FactoryGirl.create(:professional) }
  let(:users_pro_share) { user.users_pro_share.build(professional_id: user.id) }

  subject { users_pro_share }

  it { should be_valid }
end


describe "follower methods" do
  it { should respond_to(:user) }
  it { should respond_to(:professional) }
  its(:user) { should eq user }
  its(:professional) { should eq professional }
end