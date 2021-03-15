require_relative '../spec_helper.rb'

describe 'Logged in users can send and view messages' do
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

  it 'User sends a message and other users can view them' do
    #First user creates an account & logs out
    message = @bp.message
    validemail = @bp.new_email
    @login.enter_email_and_passwords(validemail, @pwd, @pwd)
    @mv = @login.click_signup_to_messages
    expect(@mv.header_text == validemail)
    @mv.logout
    expect(@login.login_button.displayed?)
    #First user logs back in & sends a message
    @mv = @login.login_to_view_messages(validemail, @pwd)
    @mv.enter_and_send_message(message)
    expect(@mv.last_message.text == message)
    @mv.logout
    #Another user is able to view the previous user's message on logging in
    validemail2 = @bp.new_email
    @login.enter_email_and_passwords(validemail2, @pwd, @pwd)
    @mv = @login.click_signup_to_messages
    expect(@mv.header_text == validemail2)
    expect(@mv.last_message.text == message)
    @mv.logout
  end
end

