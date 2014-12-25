module GenerateTokenService
  def self.generate
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    p = (0...10).map { o[rand(o.length)] }.join
    p
  end
end