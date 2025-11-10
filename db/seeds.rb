puts "Criando usuário padrão..."

User.create!(
  email: "felipe@email.com",
  password: "123456",
  password_confirmation: "123456"
)

puts "Usuário criado com sucesso: felipe@email.com / 123456"
