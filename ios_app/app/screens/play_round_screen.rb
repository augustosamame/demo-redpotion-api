class PlayRoundScreen < PM::Screen
  title "Now Playing"
  stylesheet PlayRoundScreenStylesheet

  def on_load
    set_nav_bar_button :left, title: "Exit Match", action: :exit_match
    set_nav_bar_button :right, title: (Auth.current_user ? Auth.current_user["email"] : "")
    append(UIButton, :start_play_button).on(:tap) do |sender|
      mp "start round of match "
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

    @background_image = append!(UIImageView, :background_image)
    @face_image = append!(UIImageView, :face_image)
    rmq(:face_image).hide
    @star1_image = append!(UIImageView, :star1_image)
    @star2_image = append!(UIImageView, :star2_image)
    @star3_image = append!(UIImageView, :star3_image)
    @star4_image = append!(UIImageView, :star4_image)
    append(UIButton, :duel_button).on(:tap) do |sender|
      mp "start duel game " + @match.id.to_s
      start_duel_game
    end
    append(UIButton, :standard_button).on(:tap) do |sender|
      mp "start standard game " + @match.id.to_s
      start_standard_game
    end
    append(UILabel, :ready)
    append(UILabel, :set)
    append(UILabel, :go)

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
