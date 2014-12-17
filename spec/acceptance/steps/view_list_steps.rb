#encoding: utf-8
=begin

Tính năng: Đăng nhập và thấy danh sách người dùng và salon
  Tình huống: Đăng nhập thành công
    Khi staff đăng nhập
    Thì staff có thể thấy danh sách người dùng, salon

  Tình huống: Hiển thị danh sách 50 kết quả
    Khi staff đăng nhập
    Thì staff có thể thấy danh sách 50 kết quả người dùng





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
    expect(page).to have_content "SALON03"
    expect(page).to have_content "Đăng nhập thành công"
  end

  step 'staff có thể thấy danh sách 50 kết quả người dùng' do 
    expect(page).to have_content "stt50"
    expect(page).to_not have_content "stt51"
  end
    

end