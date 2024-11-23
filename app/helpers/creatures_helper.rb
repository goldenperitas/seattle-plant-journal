module CreaturesHelper
  def toxic_status_badge(toxic_status)
    case toxic_status
    when "use_caution"
      _class = "bg-warning text-black"
      _icon = "fa-exclamation-triangle"
    when "toxic"
      _class = "bg-danger text-white"
      _icon = "fa-exclamation-triangle"
    else
      _class = "bg-dark"
      _icon = "fa-question"
    end

    tag.div class: "badge #{_class} rounded-pill" do
      concat tag.i class: "fas #{_icon} me-1"
      concat toxic_status.humanize
    end
  end
end
