require 'httparty'

class User
  include HTTParty
  WEBSITE = 'https://chitter-backend-api.herokuapp.com'

  attr_reader :id, :handle


  def initialize(id, handle)
    @id = id
    @handle = handle
  end

  def self.get_users
    response = HTTParty.get("#{WEBSITE}/users")
    response.map { |user| User.new(user['id'], user['handle'])}
  end

  def self.create_user(handle, password)
    response = HTTParty.post("#{WEBSITE}/users",
      :query => {user: {handle: handle, password: password}},
      :headers => { 'Content-Type': 'application/json' })
    fail unless response.success?
  end

  def self.sign_in(handle, password)
    response = HTTParty.post("#{WEBSITE}/sessions",
      :query => {session: {handle: handle, password: password}},
      :headers => { 'Content-Type': 'application/json' })
    fail unless response.success?
    response
  end

  def self.find(user_id)
    return nil unless user_id
    response = HTTParty.get("#{WEBSITE}/users/#{user_id}")
    @user = User.new(response['id'], response['handle'])
  end

end








