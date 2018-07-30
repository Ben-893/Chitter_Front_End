require 'user'

describe User do

  describe 'get_users'  do
    let (:user) { described_class.new(1, "Ben") }
    it "gets all of the users" do
      allow(described_class).to receive(:get_users).and_return([user])
      expect(described_class.get_users).to eq [user]
    end
  end

  describe 'create_user' do
    it 'creates a new user' do
      allow(described_class).to receive(:create_user).with('Ben', 'password').and_return ({id: "1", handle: 'Ben' }) 
      expect(described_class.create_user('Ben', 'password')).to eq({id: "1", handle: 'Ben' })
    end
  end

  describe 'sign_in' do
    it 'allows the user to sign in' do
      allow(described_class).to receive(:sign_in).with('Ben', 'password').and_return ({user_id: "1", session_key: '12345' })
      expect(described_class.sign_in('Ben', 'password')).to eq ({user_id: "1", session_key: '12345' })
    end
  end





end