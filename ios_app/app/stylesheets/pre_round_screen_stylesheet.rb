class PreRoundScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def new_round_button(st)
    st.background_color = color.black
    st.color = color.white
    st.enabled = true
    st.text = "Play!"
  end

  def root_view(st)
    st.background_color = color.white
  end
end
