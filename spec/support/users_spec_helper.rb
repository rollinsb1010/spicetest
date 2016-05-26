module UsersSpecHelper

  def test_login
    '$*&*&$'
  end

  def test_password
    '$$RJKKJ'
  end

  def sign_in_user
    visit '/login'
    fill_in 'login[email]', with: test_login
    fill_in 'login[password]', with: test_password
    click_button("Log In")
  end
end
