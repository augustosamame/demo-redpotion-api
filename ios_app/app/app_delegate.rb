class AppDelegate < PM::Delegate
  include CDQ # Remove this if you aren't using CDQ

  status_bar true, animation: :fade

  # Without this, settings in StandardAppearance will not be correctly applied
  # Remove this if you aren't using StandardAppearance
  ApplicationStylesheet.new(nil).application_setup

  def on_load(app, options)
    mp "now running on_load App_delegate"
    cdq.setup # Remove this if you aren't using CDQ
  #     Auth.sign_out do
  #       open SignInScreen
  #     end
    if Auth.signed_in?
      mp "about to update auth headers"
      ApiClient.update_authorization_header(Auth.authorization_header)
      mp "finished setting auth headers"
      if Auth.current_user.nil?
        mp "about to call set_current_user"
        Auth.current_user = Auth.set_current_user
        mp "continue after setting current_user"
      end
      mp "about to open authenticated root"
      open_authenticated_root
    else
      open SignInScreen.new(nav_bar: true)
    end
  end

  def open_authenticated_root
    open_tab_bar MatchesScreen.new(nav_bar: true)
  end

    # Remove this if you are only supporting portrait
#  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    # Manually set RMQ's orientation before the device is actually oriented
    # So that we can do stuff like style views before the rotation begins
#    device.orientation = new_orientation
#  end
end
