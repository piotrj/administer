module Administer::EntitiesHelper
  def render_field(field, form)
    case field[:type]
    when :text
      render :partial => "administer/fields/textarea", :object => field, :locals => {:f => form}
    when :date
      render :partial => "administer/fields/dateselect", :object => field, :locals => {:f => form}      
    else
      render :partial => "administer/fields/textfield", :object => field, :locals => {:f => form}
    end
  end
end