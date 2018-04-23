# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

developer1 = Developer.create({ email: "sun@abc.com" })
developer1.programming_languages << ProgrammingLanguage.create(name: "Ruby") << ProgrammingLanguage.create(name: "Kotlin")
developer1.languages << Language.create(code: "en") << Language.create(code: "vn")


developer2 = Developer.create({ email: "rob@abc.com" })
developer2.programming_languages << ProgrammingLanguage.find_by(name: "Ruby") << ProgrammingLanguage.create(name: "PHP")
developer2.languages << Language.create(code: "ch") << Language.create(code: "fr")

developer3 = Developer.create({ email: "sam@abc.com" })
developer3.programming_languages << ProgrammingLanguage.create(name: "Scala")
developer3.languages << Language.find_by(code: "en") << Language.create(code: "ja")
