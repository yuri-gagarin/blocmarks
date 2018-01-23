
RSpec.describe User, :type => :model do
  context "creates a basic user" do
    user1 = User.create!(email: "andy@aol.com", password: "supersecret")
    user2 = User.create!(email: "bobby@aol.com", password: "topsecret")
    it "has two users" do
      users = User.all
      expect(users.size).to eq(2)
    end
    it "creates a non admin user" do
      expect(user1.role).to eq("member")
      expect(user2.role).to eq("member")
    end
  end

end
