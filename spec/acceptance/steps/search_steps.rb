#encoding: utf-8
=begin
Tính năng: Tìm kiếm và lọc
  Tình huống: staff tìm kiếm theo tên và email
    Khi staff đã đăng nhập
    Và staff gõ tên name_for_search và email dummysearch vào các ô tìm kiếm
    Thì kết quả sẽ hiện ra name_for_search và email dummysearch

  Tình huống: staff tìm kiếm theo tên
    Khi staff đã đăng nhập
    Và staff gõ tên name_for_search vào ô tìm kiếm
    Thì kết quả sẽ hiện ra name_for_search và email dummysearch

  Tình huống: staff tìm kiếm theo email
    Khi staff đã đăng nhập
    Và staff gõ tên dummysearch vào ô tìm kiếm
    Thì kết quả sẽ hiện ra name_for_search và email dummysearch
=end
module SearchSteps
  step 'staff đã đăng nhập' do 
    visit '/'
    fill_in :signin_staff_mail_address, :with => 'dummytest'
    fill_in :signin_staff_login_password, :with => 'dummy1'
    click_button 'Đăng nhập'
  end
  step 'staff gõ tên name_for_search và email dummysearch vào các ô tìm kiếm' do 
    fill_in :q_staff_name_cont, :with => 'name_for_search'
    fill_in :q_mail_address_cont, :with => 'dummysearch'
    page.find('.search_button').click
  end
  step 'kết quả sẽ hiện ra name_for_search và email dummysearch' do 
    expect(page).to have_content 'name_for_search'
    expect(page).to have_content 'dummysearch'
  end
  step 'staff gõ tên name_for_search vào ô tìm kiếm' do 
    fill_in :q_staff_name_cont, :with => 'name_for_search'
    page.find('.search_button').click
  end
  step 'staff gõ tên dummysearch vào ô tìm kiếm' do 
    fill_in :q_mail_address_cont, :with => 'dummysearch'
    page.find('.search_button').click
  end
end