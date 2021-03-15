require_relative '../pages/base_page'
require 'selenium-webdriver'

class MessageViewPage < BasePage

  def initialize(driver)
    super(driver)
  end

  def welcome_header
    wait_until_displayed(:xpath, '//header[1]')
    @driver.find_element(:xpath, '//header[1]')
  end

  def header_text
    greeting = welcome_header.text
  end

  def log_out_link
    wait_until_displayed(:link, 'Log Out')
    @driver.find_element(:link, 'Log Out')
  end

  def logout
    log_out_link.click
    wait_for_page_load
  end

  def message_text_area
    wait_until_displayed(:id, 'message_content')
    @driver.find_element(:id, 'message_content')
  end

  def send_message_btn
    wait_until_displayed(:xpath, '//input[@value=\'Send\']')
    @driver.find_element(:xpath, '//input[@value=\'Send\']')
  end

  def click_send_message_btn
    send_message_btn.click
  end

  def enter_and_send_message(message)
    message_text_area.send_keys(message)
    click_send_message_btn
    wait_for_page_load
  end

  def displayed_messages
    wait_until_displayed(:class, 'chat-container')
    @driver.find_elements(:class, 'chat-container')
  end

  def last_message
    displayed_messages.last
  end

end
