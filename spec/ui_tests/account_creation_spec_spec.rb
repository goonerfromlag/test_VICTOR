require_relative '../spec_helper.rb'

describe 'Users can create accounts with valid email' do
  before do
    @driver = Selenium::WebDriver.for(:chrome)
    @bp = BasePage.new(@driver)
    @login = LoginPage.new(@driver)
    @mv = MessageViewPage.new(@driver)
    @pwd = 'password'
  end
  after do
    @bp.quit_driver
  end

  it 'user successfully creates a new account' do
    validemail = @bp.new_email
    @login.enter_email_and_passwords(validemail, @pwd, @pwd)
    @mv = @login.click_signup_to_messages
    expect(@mv.header_text == validemail)
    expect(@mv.log_out_link.displayed?)
  end

  it 'warns if the email field is empty' do
    @login.enter_email_and_passwords(String.new, @pwd, @pwd)
    @login.click_signup_button
    expect(@login.blank_email_error_msg.displayed?)
    expect(@login.invalid_email_error_msg.displayed?)
  end

  it 'warns if the password field is empty' do
    validemail = @bp.new_email
    @login.enter_email_and_passwords(validemail, String.new, @pwd)
    @login.click_signup_button
    expect(@login.blank_pwd_error_msg.displayed?)
  end

  it 'warns if the password confirmation field is empty' do
    validemail = @bp.new_email
    @login.enter_email_and_passwords(validemail, @pwd, String.new)
    @login.click_signup_button
    expect(@login.pwd_confirmation_error_msg.displayed?)
  end

  #To do: it 'warns if the email is invalid' do
  # Unable to find locators for relevant error messages
  #end
end