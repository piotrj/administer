class Capybara::Session
  def has_textfield?(locator)
    find_field(:textfield, locator)
  end

  def has_textarea?(locator)
    find_field(:textarea, locator)
  end

  def has_select?(locator)
    find_field(:select, locator)
  end

  def has_dateselect?(locator)
    id_prefix = find(:xpath, XPath::HTML.label(locator))[:for]
    year = find_field(:select, "#{id_prefix}_1i")
    month = find_field(:select, "#{id_prefix}_2i")
    day = find_field(:select, "#{id_prefix}_3i")
    year && month && day
  end

  def has_checkbox?(locator)
    find_field(:checkbox, locator)
  end

  def find_field(type, locator)
    all(:xpath, XPath::HTML.field_of_type(type, locator)).present?
  end
end

module XPath::HTML
  def self.field_of_type(type, locator)
    xpath = fieldtype_to_xpath(type)
    xpath = locate_field(xpath, locator)
    xpath
  end

  def self.label(label)
    anywhere(:label)[string.n.is(label)]
  end

  private
  def self.fieldtype_to_xpath(type)
    case type
    when :textfield
      descendant(:input)[~attr(:type).one_of('submit', 'image', 'radio', 'checkbox', 'hidden', 'file')]
    when :checkbox
      descendant(:input)[attr(:type) == 'checkbox']
    when :textarea
      descendant(:textarea)
    when :select
      descendant(:select)
    end
  end
end
