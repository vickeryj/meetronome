class RubicsCube < AltWidget
  def render(meeting, page, tag)
    page.replace_html tag, "With practice you could have solved #{(meeting.time_in_seconds/25).to_int } rubik's cubes during this meeting"
  end
end