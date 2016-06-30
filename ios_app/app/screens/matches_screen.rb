class MatchesScreen < PM::TableScreen
  title "Matches"
  stylesheet MatchesScreenStylesheet

  refreshable

  def on_load
    @matches = []
    load_matches
  end

  def on_refresh
    load_matches
  end

  def load_matches
    Match.all do |response, matches|
      if response.success?
        @matches = matches
        stop_refreshing
        update_table_data
      else
        app.alert "Sorry, there was an error fetching the matches."
        mp response.error.localizedDescription
      end
    end
  end

  def table_data
    [{
      cells: @matches.map do |match|
        {
          height: 100,
          player2: match.player2_id,
          action: :view_match,
          arguments: { match: match }
        }
      end
    }]
  end

  def view_match(args)
    open ViewMatchScreen.new(args)
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
