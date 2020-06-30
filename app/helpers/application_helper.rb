module ApplicationHelper
  def page_title
    title = "Moring Glory"
    title = @page_title + "-" + title if @page_title
    title
  end

  def menu_link_to(text, path, option = {})
    content_tag :li do
      condition = option[:method] || !current_page?(path)

      link_to_if(condition, text, path, option) do
        content_tag(:span, text)
      end
    end
  end
end
