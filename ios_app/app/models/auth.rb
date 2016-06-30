class Auth < Motion::Authentication
  strategy DeviseTokenAuthGem
  sign_in_url "http://localhost:3000/auth/sign_in"
  sign_up_url "http://localhost:3000/auth/sign_up"
end
