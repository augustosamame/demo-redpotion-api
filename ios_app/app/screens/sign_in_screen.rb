class SignInScreen < PM::XLFormScreen
  title "Sign In"
  stylesheet SignInScreenStylesheet

  def form_data
    [
      {
        cells: [
          {
            title:       'Email',
            name:        :email,
            type:        :email,
            placeholder: 'Enter your email',
            required:    true
          },
          {
            title:       'Password',
            name:        :password,
            type:        :password,
            placeholder: 'Enter your password',
            required:    true
          },
          {
            title: 'Sign In',
            name: :save,
            type: :button,
            on_click: -> (cell) {
              authenticate
            }
          }
        ]
      }
    ]
  end

  def authenticate
    Auth.sign_in(email: values["email"], password: values["password"]) do |response|
      if response.success?
        # Auth.current_user = User.new(response.object["data"])
        ApiClient.update_authorization_header(Auth.authorization_header)
        Auth.current_user = Auth.set_current_user
        app.delegate.open_authenticated_root
      elsif response.object
        mp response.object
        mp response.error
        app.alert response.object["errors"].nil? ? 'Unknown error' : response.object["errors"][0]
      else
        app.alert "Sorry, there was an error. #{response.error.localizedDescription}"
      end
    end
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
