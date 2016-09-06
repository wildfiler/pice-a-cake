class MarkdownRenderer
  RENDER_OPTIONS = {
    filter_html:     true,
    link_attributes: { rel: 'nofollow' },
    prettify:        true
  }.freeze

  EXTENSIONS = {
    autolink:           true,
    lax_spacing:        true,
    strikethrough:      true,
    superscript:        true
  }.freeze

  def initialize
    @render_engine = Redcarpet::Render::HTML.new(RENDER_OPTIONS)
    @renderer = Redcarpet::Markdown.new(@render_engine, EXTENSIONS)
  end

  def render(text)
    @renderer.render(text).html_safe
  end
end
