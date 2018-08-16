User.create!([
  {email: "vu.thu.hien@gmail.com",
   password: "hien123", password_confirmation: "hien123",
   name: "Vu Thu Hien", username: "hienvu", is_admin: 1,
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  },
  {email: "nguyen.xuan.thien@gmail.com",
   password: "thien123", password_confirmation: "thien123",
   name: "Nguyen Xuan Thien", username: "xuanthien",
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  },
  {email: "kumekawa.kanau@gmail.com",
   password: "kumekawa123", password_confirmation: "kumekawa123",
   name: "Kumekawa Kanau", username: "kumekawa",
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  },
  {email: "watanabe.hikaru@gmail.com",
   password: "hikaru123", password_confirmation: "hikaru123",
   name: "Watanabe Hikaru", username: "hikaru",
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  },
  {email: "admin@gmail.com",
   password: "admin123", password_confirmation: "admin123",
   name: "Admin", username: "admin", is_admin: 1,
   image: File.open(Rails.root + "public/uploads/image/profile_default.png")
  }
])

10.times do |n|
  Category.create!(title: Faker::Book.genre)
end

10.times do |n|
  Author.create!(
    name: Faker::Name,
    bio: Faker::Lorem.paragraph)
end

20.times do |n|
  Book.create!(
    title: Faker::Book.title,
    isbn: Faker::Number.number(9),
    publisher: Faker::Book.publisher,
    publish_date: "01-01-2007",
    description: Faker::Lorem.paragraph(20),
    picture: File.open(Rails.root + "public/uploads/image/book_default.jpg"),
  )
end

50.times do |n|
  BookCategory.create!(
    book_id: Faker::Number.between(1,20),
    category_id: Faker::Number.between(1,10)
  )
end

15.times do |n|
  AuthorBook.create!(
    book_id: Faker::Number.between(1,20),
    author_id: Faker::Number.between(1,10)
  )
end

books = Book.all
users = User.all

users.each do |user|
  books.each do |book|
    Review.create!(
        title: Faker::Book.title+"  "+Faker::Book.author,
        content: Faker::Lorem.paragraph(20),
        user_id: user.id,
        book_id: book.id
      )

    Rate.create!(
        user_id: user.id,
        book_id: book.id,
        score: Faker::Number.between(1, 5),
    )
  end
end
