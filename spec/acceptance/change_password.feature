#encoding: utf-8
#language: vi
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

  Tình huống: Mật khẩu cũ và mới phải khác nhau
  	Khi staff đăng nhập
  	Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
  	Và điền mật khẩu "dummy"
  	Và nhấn nút "Lưu"
  	Thì báo lỗi "Mật khẩu mới trùng với mật khẩu cũ"

  Tình huống: Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt
    Khi staff đăng nhập
    Và nhấn vào nút đổi mật khẩu của nhân viên đầu tiên
    Và điền mật khẩu "dummabcdef"
    Và nhấn nút "Lưu"
    Thì báo lỗi "Mật khẩu chứa ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt"    