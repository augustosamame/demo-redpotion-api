class PlayRoundScreen < PM::Screen
  title "Let's Play!"
  stylesheet PlayRoundScreenStylesheet
  attr_accessor

  def initialize(match)
    mp match.id
  end

  def on_load
    set_nav_bar_button :left, title: "Exit Match", action: :exit_match
    set_nav_bar_button :right, title: (Auth.current_user ? Auth.current_user["email"] : "")
    append(UIButton, :new_round_button).layout(l: 30, t: 80, w: 120, h: 30).on(:tap) do |sender|
      start_round
    end
  end

  def exit_match
    mp "exiting match"
    mp "automatically loses round"

  end

  def start_round
    mp "starting round"
    mp "create new round"

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
