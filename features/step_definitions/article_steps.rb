Given /^the following articles exist:$/ do |articles_table|
  # table is a Cucumber::Ast::Table
  articles_table.hashes.each do |article|
  Article.create!(article)
  end 
end

