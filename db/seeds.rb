categories_names = [
  { 'en': 'Action and Adventure', 'pt-BR': 'Ação e Aventura' },
  { 'en': 'Art', 'pt-BR': 'Arte' },
  { 'en': 'Autobiographies', 'pt-BR': 'Autobiografia' },
  { 'en': 'Biographies', 'pt-BR': 'Biografia' },
  { 'en': 'Children', 'pt-BR': 'Infantil' },
  { 'en': 'Comics', 'pt-BR': 'Quadrinhos' },
  { 'en': 'Cookbooks', 'pt-BR': 'Receita' },
  { 'en': 'Diaries', 'pt-BR': 'Diário' },
  { 'en': 'Dictionaries', 'pt-BR': 'Dicionário' },
  { 'en': 'Drama', 'pt-BR': 'Drama' },
  { 'en': 'Encyclopedias', 'pt-BR': 'Enciclipédia' },
  { 'en': 'Fantasy', 'pt-BR': 'Fantasia' },
  { 'en': 'Guide', 'pt-BR': 'Guia' },
  { 'en': 'History', 'pt-BR': 'História' },
  { 'en': 'Horror', 'pt-BR': 'Terror' },
  { 'en': 'Math', 'pt-BR': 'Matemática' },
  { 'en': 'Mystery', 'pt-BR': 'Suspense' },
  { 'en': 'Poetry', 'pt-BR': 'Poesia' },
  { 'en': 'Religious', 'pt-BR': 'Religião' },
  { 'en': 'Romance', 'pt-BR': 'Romance' },
  { 'en': 'Satire', 'pt-BR': 'Sátira' },
  { 'en': 'Science fiction', 'pt-BR': 'Ficção Científica' },
  { 'en': 'Science', 'pt-BR': 'Ciência' },
  { 'en': 'Self help', 'pt-BR': 'Auto ajuda' },
  { 'en': 'Series', 'pt-BR': 'Série' },
  { 'en': 'Travel', 'pt-BR': 'Viagens' },
  { 'en': 'Trilogies', 'pt-BR': 'Trilogia' }
]

categories_names.each do |name|
  category = Category.create!(name: name[:en])
  category.translations.create(name: name[:'pt-BR'], locale: :'pt-BR')
end
