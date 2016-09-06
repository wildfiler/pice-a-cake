module ApplicationHelper
  def markdown(text)
    @renderer ||= ::MarkdownRenderer.new
    @renderer.render(text)
  end
end
