module GeneratePasswordService
  def self.generate
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    p = (0...3).map { o[rand(o.length)] }.join
    o2 = [('0'..'9')].map { |i| i.to_a }.flatten
    p2 = (0...3).map { o2[rand(o2.length)] }.join
    o3 = ['~','!','@','#','$','%','^','&','*','(',')','_','+','|','}','{','\\']
    p3 = (0...2).map { o3[rand(o3.length)] }.join
    string_shuffle(p + p2 + p3)
  end

  def self.string_shuffle(s)
    s.split("").shuffle.join
  end
end