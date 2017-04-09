names=["jay","test","alayna","someone"]

names.each do |name|
  User.create(name:name, email: "#{name}.gmail.com", password: "password")
  
end 