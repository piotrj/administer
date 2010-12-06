module Administer::DashboardHelper
  def administer_model_names
    Administer::Model.all.collect { |m| m.model_name }
  end
end
