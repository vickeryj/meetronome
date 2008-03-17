class Quips < AltWidget

  def self.quip
    ["Did you know that the hot air generated during meetings is a significant contributer to global warming?",
            'If you had to identify, in one word, the reason why the human race has not achieved, and never will achieve, its full potential, that word would be "meetings."  ~Dave Barry, "Things That It Took Me 50 Years to Learn"',
            '"Meetings are an addictive, highly self-indulgent activity that corporations and other large organizations habitually engage in only because they cannot masturbate" ~Dave Barry',
            '“The only summit meeting that can succeed is the one that does not take place.” ~ Barry Goldwater',
            "Don't say anything until the meeting is half over; this stamps you as being wise.",
            "Meeting, n.:
            An assembly of people coming together to decide what person or department not represented in the room must solve a problem."].rand
  end
  
  def render(meeting, page, tag)
    page.replace_html tag, Quips.quip
  end
end