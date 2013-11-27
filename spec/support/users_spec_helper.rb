module UsersSpecHelper

  def test_login
    'brianvmf@gmail.com'
  end

  def test_password
    'Ewbcst10'
  end

  def sign_in_user
    visit '/login'
    fill_in 'login[email]', with: test_login
    fill_in 'login[password]', with: test_password
    click_button("Log In")
  end
end
