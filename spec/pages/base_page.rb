class BasePage
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    driver.manage.window.maximize
    @driver.navigate.to("http://localhost:3000/")
  end

  def wait_until_displayed(type, name, timeout: 5)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until {@driver.find_element(type, name).displayed?}
  end

  def wait_for_page_load
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    wait.until { @driver.execute_script("return document.readyState;") == "complete" }
  end

  def new_email
    @email = 'test_' + SecureRandom.alphanumeric(5) + SecureRandom.random_number(99999).to_s + '@mail.com'
  end

  def message
    @message = SecureRandom.alphanumeric(5) + " " + SecureRandom.alphanumeric(2) + " " + SecureRandom.alphanumeric(10)
  end

  def quit_driver
    @driver.quit unless @driver.nil?
  end
end