Administer::Config.configure do
  define Post do
    association_display :title
  end

  define Category do
    association_display :name
  end

  define Comment do
    association_display :body
  end
end
