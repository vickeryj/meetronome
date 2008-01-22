class Sucks < AltWidget
  def render(meeting, page, tag)
    page.replace_html tag, "man your meeting must suck"
  end
end