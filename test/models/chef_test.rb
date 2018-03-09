require 'test_helper'

class ChesfTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "sabtain", email: "test1@test.com")
  end

  test "should be valid " do
    assert @chef.valid?
  end
  test "name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  test "name should be less than 30 char" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  end
  test "email should accept correct format" do
    valid_emails = %w[user@emaple.com sabtain@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?, "#{valids.inspect} should be valid"
    end
  end
  test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
end