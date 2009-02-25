module RenderHelper
  def render_timeline(events)
    events.map do |event|
      render(:partial => "timeline_events/#{event.event_type}", :locals => {:event => event})
    end.join
  end

  def render_timestamp(time)
    content_tag(:span, time.to_s(:short), :title => time.to_s(:db), :class => "timestamp")
  end
end
