#encoding: utf-8
=begin
Tính năng: Đổi mật khẩu
  Tình huống: Staff vào được trang đổi mật khẩu
  	Khi staff đăng nhập
  	Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
  	Thì dẫn đến trang đổi mật khẩu
  Tình huống: Mật khẩu phải từ 8 đến 16 ký tự
    Khi staff đăng nhập
    Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
    Và điền mật khẩu "123457"
    Và nhấn nút "Lưu"
    Thì báo lỗi "Mật khẩu phải từ 8 đến 16 ký tự"
  Tình huống: Mật khẩu phải từ 8 đến 16 ký tự
    Khi staff đăng nhập
    Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
    Và điền mật khẩu "123457891234567"
    Và nhấn nút "Lưu"
    Thì báo lỗi "Mật khẩu phải từ 8 đến 16 ký tự"

  Tình huống: Mật khẩu phải là chữ latin
    Khi staff đăng nhập
    Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
    Và điền mật khẩu "ありがとう"
    Và nhấn nút "Lưu"
    Thì báo lỗi "Mật khẩu chỉ chứa ký tự Latin"

  Tình huống: Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt
    Khi staff đăng nhập
    Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
    Và điền mật khẩu "dumm"
    Và nhấn nút "Lưu"
    Thì báo lỗi "Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt" 
=end

module ChangePasswordSteps
  step 'staff đăng nhập' do 
    visit '/'
    fill_in :signin_staff_mail_address, :with => 'dummytest'
    fill_in :signin_staff_login_password, :with => 'dummy1'
    click_button 'Đăng nhập'
  end

  step 'nhấn vào nút đổi mật khẩu của nhân viên đầu tiên' do 
    page.find('.cp6').click
  end

  step 'dẫn đến trang đổi mật khẩu' do 
    expect(page).to have_content 'Đổi mật khẩu'
    expect(page).to have_content 'ikoutest_staff'
  end

  step 'điền mật khẩu "123457"' do 
    fill_in :password, :with => '1234567'
  end

  step 'nhấn nút "Lưu"' do 
    click_button 'Lưu'
  end

  step 'báo lỗi "Mật khẩu phải từ 8 đến 16 ký tự"' do 
    expect(page).to have_content "Mật khẩu phải từ 8 đến 16 ký tự"
  end

  #
  step 'điền mật khẩu "123457891234567"' do 
    fill_in :password, :with => '123457891234567'
  end

  #
  step 'điền mật khẩu "ありがとう"' do 
    fill_in :password, :with => 'ありがとう'
  end

  step 'báo lỗi "Mật khẩu chỉ chứa ký tự Latin"' do 
    expect(page).to have_content "Mật khẩu chỉ chứa ký tự Latin"
  end

  #
  step 'điền mật khẩu "dummy"' do 
    fill_in :password, :with => 'dummy'
  end

  step 'báo lỗi "Mật khẩu mới trùng với mật khẩu cũ"' do 
    expect(page).to have_content "Mật khẩu mới trùng với mật khẩu cũ"
  end

  #
  step 'điền mật khẩu "dummabcdef"' do 
    fill_in :password, :with => 'dummabcdef'
  end

  step 'báo lỗi "Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt"' do 
    expect(page).to have_content "Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt"
  end
end