Administer::Config.configure do
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
end
