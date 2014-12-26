module GeneratePasswordService
  def self.generate
    o = [('a'..'z')].map { |i| i.to_a }.flatten
    p = (0...5).map { o[rand(o.length)] }.join
    o1 = [('A'..'Z')].map { |i| i.to_a }.flatten
    p1 = (0...1).map { o1[rand(o1.length)] }.join
    o2 = [('0'..'9')].map { |i| i.to_a }.flatten
    p2 = (0...1).map { o2[rand(o2.length)] }.join
    o3 = ['~','!','@','#','$','%','^','&','*','(',')','_','+','|','}','{','\\']
    p3 = (0...1).map { o3[rand(o3.length)] }.join
    string_shuffle(p + p1 + p2 + p3)
  end

  def self.string_shuffle(s)
    s.split("").shuffle.join
  end
end