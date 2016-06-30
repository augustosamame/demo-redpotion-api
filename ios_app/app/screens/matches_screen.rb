class MatchesScreen < PM::Screen
  title "Matches"
  stylesheet MatchesScreenStylesheet

  def on_load
    mp "now running on_load Matches"
    mp Auth.signed_in?
    mp Auth.current_user
    set_nav_bar_button :right, title: "Sign Out", action: :sign_out
    set_nav_bar_button :left, title: (Auth.current_user ? Auth.current_user["email"] : "")
    append(UIButton, :new_match_button).layout(l: 30, t: 80, w: 120, h: 30).on(:tap) do |sender|
      create_new_match
    end
    mp "about to load matches"
    get_user_matches
  end

  def get_user_matches
    mp "first line of get_user_matches"
    Match.all do |response, matches|
      if response.success?
        @matches = matches
        mp @matches
      else
        app.alert "Sorry, there was an error fetching the matches."
        mp response.error.localizedDescription
      end
    end
  end

  def create_new_match
    mp "first line of load new match"
    Match.create(player2_id: "random", match_type: "Duel") do |response, newmatch|
      if response.success?
        @newmatch = newmatch
        mp @newmatch 
      else
        app.alert "Sorry, there was an error fetching the matches."
        mp response.error.localizedDescription
      end
    end
  end

  def sign_out
    Auth.sign_out do
      Auth.current_user = nil
      open SignInScreen
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
