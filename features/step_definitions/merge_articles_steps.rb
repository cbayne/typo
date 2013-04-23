Given /^the blog is set up with a non-admin$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'publisher',
                :password => 'publisher',
                :email => 'publisher@snow.com',
                :profile_id => 2,
                :name => 'publisher',
                :state => 'active'})
end

Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
  	Article.create!(article)
  end
end

And /^I am logged into the non-admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'publisher'
  fill_in 'user_password', :with => 'publisher'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
