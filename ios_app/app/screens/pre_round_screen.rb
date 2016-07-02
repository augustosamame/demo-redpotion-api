class PreRoundScreen < PM::Screen
  title "Let's play!"
  stylesheet PreRoundScreenStylesheet

  attr_accessor :match

  def initialize(match)
    @match = match
    mp @match
  end


  def on_load
    set_nav_bar_button :left, title: "Exit Match", action: :exit_match
    set_nav_bar_button :right, title: (Auth.current_user ? Auth.current_user["email"] : "")
    append(UIButton, :new_round_button).layout(l: 30, t: 80, w: 120, h: 30).on(:tap) do |sender|
      mp "start round of match " + @match.id.to_s
      choose_category
    end
  end

  def choose_category
    mp "first line of choose_category"
    mp "spin wheel to get random category from @match categories"
    # TODO get random category from match here
    newmatch = 1
    prng = Random.new
    chosen_category = prng.rand(1..5)
    open PlayRoundScreen.new(nav_bar: true, match: newmatch, category: chosen_category)

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
