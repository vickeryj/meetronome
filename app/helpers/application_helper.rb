# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def meet_link_to(name, options = {}, html_options = {}, *parameters_for_method_reference)
    link_to(content_tag(:span, name), options, {:onclick=>"this.blur;", :class => "button"}.merge(html_options))
  end
  
  def meet_link_to_function(name, *args, &block)
    link_to_function content_tag(:span, name), args, :onclick=>"this.blur;", :class=>"button"
  end
end
