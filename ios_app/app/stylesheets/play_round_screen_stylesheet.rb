class PlayRoundScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet


  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def start_play_button(st)
    st.frame = {l: 30, t: 80, w: 120, h: 30}
    st.background_color = color.black
    st.color = color.white
    st.enabled = true
    st.text = "Start Playing"
  end

  def background_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('background.png')
  end

  def face_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('faces1.jpg')
  end

  def star1_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('star1.png')
  end

  def star2_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('star2.png')
  end

  def star3_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('star3.png')
  end

  def star4_image(st)
    st.frame = {l: 30, t: 140, w: 250, h: 250}
    st.background_image = image.resource('star4.png')
  end

  def duel_button(st)
    st.frame = {l: 30, t: 420, w: 120, h: 30}
    st.background_color = color.black
    st.color = color.white
    st.enabled = true
    st.text = "Duel"
  end

  def standard_button(st)
    st.frame = {l: 200, t: 420, w: 120, h: 30}
    st.background_color = color.black
    st.color = color.white
    st.enabled = true
    st.text = "Standard"
  end

  def ready(st)

  end

  def set(st)

  end

  def go(st)

  end

  def root_view(st)
    st.background_color = color.white
  end
end
