#encoding: utf-8
=begin
Feature: Admin user
  Background:
    Admin account exists
  Scenario: Login
    When admin logins
    Then admin could see list of users


=end
module ViewListSteps
	step "admin logins" do 
		visit '/'
		fill_in :signin_staff_mail_address, :with => 'dummytest'
		fill_in :signin_staff_login_password, :with => 'dummy1'
		click_button 'Đăng nhập'
	end

	step "admin could see list of users" do 
		expect(page).to have_content "ikoutest_staff"
		expect(page).to have_content "staff1"
	end
end