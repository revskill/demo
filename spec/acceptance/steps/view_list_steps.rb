#encoding: utf-8
=begin

Tính năng: Đăng nhập và thấy danh sách người dùng và salon

  Tình huống: Đăng nhập thành công
    Khi staff đăng nhập    
    Thì staff có thể thấy danh sách người dùng, salon
    Và hiện thông báo "Đăng nhập thành công"





=end
module ViewListSteps
	step "staff đăng nhập" do 
		visit '/'
		fill_in :signin_staff_mail_address, :with => 'dummytest'
		fill_in :signin_staff_login_password, :with => 'dummy1'
		click_button 'Đăng nhập'
	end

	step "staff có thể thấy danh sách người dùng, salon" do 
		expect(page).to have_content "ikoutest_staff"
		expect(page).to have_content "staff1"
		expect(page).to have_content "Đăng nhập thành công"
	end


end