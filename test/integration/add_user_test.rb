require 'test_helper'

class AddUserTest < Capybara::Rails::TestCase

  def setup
    User.each { |u| u.destroy }

    @new_user = {
      first_name: "John",
      last_name: "Adams",
      email: "john@adams.com"
    }
  end

  test 'post user' do
    visit new_user_path

    assert page.has_content?("First name")
    assert page.has_content?("Last name")
    assert page.has_content?("Email")

    fill_in 'First name', with: 'Adam'
    fill_in 'Last name', with: 'Willem'
    fill_in 'Email', with: "adam@gmail.com"

    click_on 'Create User'

    assert_current_path user_path(User.last)

    assert page.has_content?("Adam")
    assert page.has_content?("Willem")
    assert page.has_content?("adam@gmail.com")
  end

end
