class User < ActiveRecord::Base
  has_many :baskets

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def self.create(params)
    user = User.new(params)
    user.password = params[:password_hash]
    user.save!
    return user
  end

  def login(input_password)
    self.password == input_password
  end

end
