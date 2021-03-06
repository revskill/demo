#encoding: utf-8
=begin

Tính năng: Đăng nhập và thấy danh sách người dùng và salon
  Tình huống: Đăng nhập thành công
    Khi staff đăng nhập
    Thì staff có thể thấy danh sách người dùng, salon

  Tình huống: Hiển thị danh sách 50 kết quả
    Khi staff đăng nhập
    Thì staff có thể thấy danh sách 50 kết quả người dùng
  
  Tình huống: Hiển thị phân trang
    Khi staff đăng nhập
    Thì staff có thể thấy "Trang trước", "Trang sau"
 
  Tình huống: Chức năng phân trang
    Khi staff đăng nhập
    Và staff nhấn vào đường dẫn 2
    Thì staff có thể thấy 'www2'





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
    expect(page).to have_content "ふははは"
    expect(page).to_not have_content "www2"
  end
    
  step 'staff có thể thấy "Trang trước", "Trang sau"' do 
    expect(page).to have_content "Trang sau"
  end

  step 'staff nhấn vào đường dẫn 2' do 
    click_link '2'
  end

  step "staff có thể thấy 'www2'" do 
    expect(page).to have_content 'www2'
  end
end