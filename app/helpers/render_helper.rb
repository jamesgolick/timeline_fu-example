module RenderHelper
  def render_timeline(events)
    events.map do |event|
      render(:partial => "timeline_events/#{event.event_type}", :object => event)
    end.join
  end
end
