class MeetingTime < AltWidget
  def render(meeting, page, tag)
    page.replace_html tag, "This meeting has lasted #{meeting.time_in_seconds} seconds"
  end
end
