require 'faker'

puts "Running DB seed..."



10.times do 
    User.create({
        "email" => Faker::Internet.email,
        "password" => Faker::Internet.password
    })
end

10.times do
    Character.create({
        "name" => Faker::Fantasy::Tolkien.character,
        "age" => Faker::Number.number(digits: 2),
        "race" => Faker::Games::DnD.race,
        "class_name" => Faker::Games::DnD.klass,
        "special_abilities" => Faker::Games::DnD.background,
        "description" => Faker::Books::Lovecraft.paragraph(sentence_count: 2)
    })
end


