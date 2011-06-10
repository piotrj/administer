module Administer::DashboardHelper
  def administer_model_names
    Administer::Model.all.collect { |m| m.entity.model_name }
  end
end
