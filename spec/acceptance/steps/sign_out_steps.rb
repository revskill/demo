#encoding: utf-8
=begin
Tính năng: Đăng xuất
  
  Tình huống: Đăng xuất thành công
    Khi staff đăng nhập
    Thì sẽ thấy dòng chức "Đăng xuất"
    Khi nhấn vào chữ "Đăng xuất"
    Thì quay về màn hình đăng nhập và thấy dòng chữ "Đăng xuất thành công"
=end

module SignOutSteps
  step 'sẽ thấy dòng chức "Đăng xuất"' do 
    expect(page).to have_content "Đăng xuất"
  end

  step 'nhấn vào chữ "Đăng xuất"' do 
    click_link "Đăng xuất"
  end

  step 'quay về màn hình đăng nhập và thấy dòng chữ "Đăng xuất thành công"' do 
    uri = URI.parse(current_url)
    expect(uri.path).to have_content 'signin'
    expect(page).to have_content "Đăng xuất thành công"
  end
end