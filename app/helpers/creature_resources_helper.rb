module CreatureResourcesHelper
  def resource_type_icon(resource_type)
    case resource_type
    when 'website'
      _icon = 'fas fa-link'
    when 'video'
      _icon = 'fas fa-video'
    when 'audio'
      _icon = 'fas fa-headphones'
    when 'book'
      _icon = 'fas fa-book'
    when 'paper'
      _icon = 'fas fa-file-alt'
    when 'event'
      _icon = 'fas fa-calendar-alt'
    when 'location'
      _icon = 'fas fa-map-marker-alt'
    when 'art'
      _icon = 'fas fa-palette'
    else
      _icon = 'fas fa-question-circle'
    end

    tag.i class: "#{_icon} text-black-50 small"
  end
end
