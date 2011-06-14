module Administer::Fields
  FieldBuilder.register_class ActiveRecord::ConnectionAdapters::Column do |column|
    case column.type
    when :text
      TextArea.new(column.name)
    when :date
      DateSelect.new(column.name)
    else
      TextField.new(column.name)
    end
  end
  FieldBuilder.register_class ActiveRecord::Reflection::AssociationReflection do |reflection|
    case reflection.macro
    when :belongs_to
      BelongsTo.new(reflection.name, reflection.primary_key_name, reflection.klass, reflection.active_record)
    when :has_many
      HasMany.new(reflection.name, reflection.klass, reflection.active_record)
    end
  end
end
