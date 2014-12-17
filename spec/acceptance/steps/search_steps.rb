#encoding: utf-8
=begin
Tính năng: Tìm kiếm và lọc
  Tình huống: staff tìm kiếm theo tên và email
    Khi staff đã đăng nhập
    Và staff gõ tên ikoutest_staff và email dummy_ikoutest vào các ô tìm kiếm
    Thì kết quả sẽ hiện ra ikoutest_staff và email dummy_ikoutest
=end
module SearchSteps
  step 'staff đã đăng nhập' do 
    visit '/'
    fill_in :signin_staff_mail_address, :with => 'dummytest'
    fill_in :signin_staff_login_password, :with => 'dummy1'
    click_button 'Đăng nhập'
  end
  step 'staff gõ tên ikoutest_staff và email dummy_ikoutest vào các ô tìm kiếm' do 
    fill_in :q_staff_name, :with => 'ikoutest'
    fill_in :q_mail_address, :with => 'dummy_ikoutest'
    page.find('.search_button').click
  end
  step 'kết quả sẽ hiện ra ikoutest_staff và email dummy_ikoutest' do 
    expect(page).to have_content 'ikoutest_staff'
    expect(page).to have_content 'dummy_ikoutest'
  end
end