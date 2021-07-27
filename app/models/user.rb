require 'pp'

class User < ActiveRecord::Base
  has_secure_password

  def authenticate_with_credentials(email, password)

    email = email.downcase().strip()
    user = User.find_by_email(email)

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
