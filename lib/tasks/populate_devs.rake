require 'rake'

task :populate_devs => :environment do

ProgrammingLanguage.create(name: "Ruby")
ProgrammingLanguage.create(name: "Kotlin")
ProgrammingLanguage.create(name: "PHP")
ProgrammingLanguage.create(name: "Scala")
ProgrammingLanguage.create(name: "Java")
ProgrammingLanguage.create(name: "C++")

Language.create(code: "en")
Language.create(code: "vn")
Language.create(code: "ja")
Language.create(code: "ch")
Language.create(code: "fr")


  100.times do |i|

    total_number_of_languages = rand(1..3)
    total_number_of_programming_languages = rand(1..5)

    languages_id_array = (1..5).to_a.sample(total_number_of_languages)
    programming_languages_id_array = (1..6).to_a.sample(total_number_of_programming_languages)

    developer = Developer.create({ email: "Dev#{i+1}@abc.com" })

    languages_id_array.each do | lang_id |
      developer.languages << Language.find_by(id: lang_id)
    end

    programming_languages_id_array.each do | prog_lang_id |
        developer.programming_languages << ProgrammingLanguage.find_by(id: prog_lang_id)
    end

  end
end
