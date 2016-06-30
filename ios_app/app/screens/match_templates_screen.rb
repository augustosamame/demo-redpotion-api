class MatchTemplatesScreen < PM::TableScreen
  title "Match Templates"
  stylesheet MatchTemplatesScreenStylesheet

  def on_load
    @templates = []
    load_match_templates
  end

  def load_match_templates
    MatchTemplate.all do |response, templates|
      if response.success?
        @templates = templates
        update_table_data
      else
        app.alert "Sorry, there was an error fetching the templates."
        mp response.error.localizedDescription
      end
    end
  end

  def table_data
    [{
      cells: @templates.map do |template|
        {
          height: 100,
          title: template.name,
          remote_image: {
            url: template.image_url,
          },
          action: :new_match,
          arguments: { template: template }
        }
      end
    }]
  end

  def new_match(args)
    open NewMatchScreen.new(args)
  end

  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
