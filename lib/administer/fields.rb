module Administer
  module Fields
    def fields
      all_fields = @entity.columns.map { |column|
        {
          :name => column.name,
          :type => column.type
        }
      }

      all_fields = convert_belongs_to_associations(all_fields)

      visible_fields = all_fields.delete_if{ |field| ["id", "created_at", "updated_at"].any?{ |a| a == field[:name] } }
      visible_fields
    end

    private
    def convert_belongs_to_associations(fields)
      entity_belongs_to = associations(:belongs_to)
      keys = entity_belongs_to.map{ |assoc| assoc[:key] }
      fields.delete_if { |field| keys.include? field[:name] }
      fields + entity_belongs_to
    end

    def associations(type = nil)
      @entity.reflect_on_all_associations(type).map do |association|
        {
          :entity => association.klass,
          :name => association.name,
          :type => association.macro,
          :key => association.primary_key_name
        }
      end
    end
  end
end
