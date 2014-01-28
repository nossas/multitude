# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = TaskType.where(name: "Conceituar/Redigir de roteiro de filme").first_or_create!
t.update points: 720, category_id: 3
t = TaskType.where(name: "Produzir/Dirigir filme").first_or_create!
t.update points: 600, category_id: 3
t = TaskType.where(name: "Editar/Finalizar filme").first_or_create!
t.update points: 600, category_id: 3
t = TaskType.where(name: "Escrever/Distribuir press releases").first_or_create!
t.update points: 120, category_id: 4
t = TaskType.where(name: "Conceituar/Criar memes/imagens").first_or_create!
t.update points: 120, category_id: 5
t = TaskType.where(name: "Mapear redes").first_or_create!
t.update points: 180, category_id: 4
t = TaskType.where(name: "Desenvolver features para apps").first_or_create!
t.update points: 1440, category_id: 7
t = TaskType.where(name: "Desenhar projetos web").first_or_create!
t.update points: 1440, category_id: 5
t = TaskType.where(name: "Participar de brainstorms para apps").first_or_create!
t.update points: 360, category_id: 7
t = TaskType.where(name: "Participar de programa beta-testers").first_or_create!
t.update points: 4, category_id: 7
t = TaskType.where(name: "Realizar pesquisa/avaliação técnica").first_or_create!
t.update points: 600, category_id: 6
t = TaskType.where(name: "Realizar pesquisa/avaliação jurídica").first_or_create!
t.update points: 600, category_id: 6
t = TaskType.where(name: "Organizar coletiva de imprensa").first_or_create!
t.update points: 8, category_id: 4
t = TaskType.where(name: "Fotografar evento/temática").first_or_create!
t.update points: 360, category_id: 3
t = TaskType.where(name: "Realizar streaming de evento").first_or_create!
t.update points: 6, category_id: 3
t = TaskType.where(name: "Organizar evento de rua").first_or_create!
t.update points: 12, category_id: 1
t = TaskType.where(name: "Participar de evento de rua").first_or_create!
t.update points: 240, category_id: 1
t = TaskType.where(name: "Realizar intervenção urbana").first_or_create!
t.update points: 4, category_id: 1
t = TaskType.where(name: "Realizar lobbying do bem").first_or_create!
t.update points: 5, category_id: 1
t = TaskType.where(name: "Organizar hackathon").first_or_create!
t.update points: 80, category_id: 7
t = TaskType.where(name: "Participar de hackathon").first_or_create!
t.update points: 16, category_id: 7
t = TaskType.where(name: "Requerer de informação").first_or_create!
t.update points: 4, category_id: 6
t = TaskType.where(name: "Apurar/Pesquisar informações").first_or_create!
t.update points: 6, category_id: 6
