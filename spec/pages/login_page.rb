require_relative '../pages/base_page'
require_relative '../pages/message_view_page'
require 'selenium-webdriver'

class LoginPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def email_field
    wait_until_displayed(:id, 'user_email')
    @driver.find_element(:id, 'user_email')
  end

  def password_field
    wait_until_displayed(:id, 'user_password')
    @driver.find_element(:id, 'user_password')
  end

  def confirm_password_field
    wait_until_displayed(:id, 'user_password_confirmation')
    @driver.find_element(:id, 'user_password_confirmation')
  end

  def sign_up_button
    wait_until_displayed(:css, 'input.submit-button')
    @driver.find_element(:css, 'input.submit-button')
  end

  def login_link
    wait_until_displayed(:link, 'Log in')
    @driver.find_element(:link, 'Log in')
  end

  def login_button
    wait_until_displayed(:xpath, '//input[@value=\'Log In\']')
    @driver.find_element(:xpath, '//input[@value=\'Log In\']')
  end

  def signup_link
    wait_until_displayed(:link, 'Sign up')
    @driver.find_element(:link, 'Sign up')
  end

  def blank_email_error_msg
    wait_until_displayed(:xpath, '//li[text()[contains(.,"Email can\'t be blank")]]')
    @driver.find_element(:xpath, '//li[text()[contains(.,"Email can\'t be blank")]]')
  end

  def invalid_email_error_msg
    wait_until_displayed(:xpath, '//li[text()[contains(.,"Email is invalid")]]')
    @driver.find_element(:xpath, '//li[text()[contains(.,"Email is invalid")]]')
  end

  def blank_pwd_error_msg
    wait_until_displayed(:xpath, '//li[text()[contains(.,"Password can\'t be blank")]]')
    @driver.find_element(:xpath, '//li[text()[contains(.,"Password can\'t be blank")]]')
  end

  def pwd_confirmation_error_msg
    wait_until_displayed(:xpath, '//li[text()[contains(.,"Password confirmation doesn\'t match Password")]]')
    @driver.find_element(:xpath, '//li[text()[contains(.,"Password confirmation doesn\'t match Password")]]')
  end

  def click_signup_link
    signup_link.click
    wait_for_page_load
  end

  def enter_email(text)
    email_field.clear
    email_field.send_keys(text)
  end

  def enter_password(text)
    password_field.clear
    password_field.send_keys(text)
  end

  def enter_confirm_password(text)
    confirm_password_field.clear
    confirm_password_field.send_keys(text)
  end

  def login_to_view_messages(email, pwd)
    enter_email(email)
    enter_password(pwd)
    login_button.click
    wait_for_page_load
    MessageViewPage.new(@driver)
  end

  def click_login_link
    login_link.click
  end

  def click_signup_button
    sign_up_button.click
    wait_for_page_load
  end

  def click_signup_to_messages
    sign_up_button.click
    MessageViewPage.new(@driver)
  end

  def enter_email_and_passwords(email, pwd, confirm_pwd)
    click_signup_link
    enter_email(email)
    enter_password(pwd)
    enter_confirm_password(confirm_pwd)
  end
end
