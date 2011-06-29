Administer::Config.configure do
  controller do
    before_filter :test_authorization
  end

  model Post do
    display_name do
      title
    end
  end

  model Category do
    display_name :name
  end

  model Comment do
    display_name :body
  end

  model Attachment do
    display_name :content
  end
end
