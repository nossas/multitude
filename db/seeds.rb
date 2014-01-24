# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TaskType.create name: "Conceituar/Redigir de roteiro de filme", points: 720
TaskType.create name: "Produzir/Dirigir filme",                 points: 600
TaskType.create name: "Editar/Finalizar filme",                 points: 600
TaskType.create name: "Escrever/Distribuir press releases",     points: 120
TaskType.create name: "Conceituar/Criar memes/imagens",         points: 120
TaskType.create name: "Mapear redes",                           points: 180
TaskType.create name: "Desenvolver features para apps",         points: 1440
TaskType.create name: "Desenhar projetos web",                  points: 1440
TaskType.create name: "Participar de brainstorms para apps",    points: 360
TaskType.create name: "Participar de programa beta-testers",    points: 4
TaskType.create name: "Realizar pesquisa/avaliação técnica",    points: 600
TaskType.create name: "Realizar pesquisa/avaliação jurídica",   points: 600
TaskType.create name: "Organizar coletiva de imprensa",         points: 8
TaskType.create name: "Fotografar evento/temática",             points: 360
TaskType.create name: "Realizar streaming de evento",           points: 6
TaskType.create name: "Organizar evento de rua",                points: 12
TaskType.create name: "Participar de evento de rua",            points: 240
TaskType.create name: "Realizar intervenção urbana",            points: 4
TaskType.create name: "Realizar lobbying do bem",               points: 5
TaskType.create name: "Organizar hackathon",                    points: 80
TaskType.create name: "Participar de hackathon",                points: 16
TaskType.create name: "Requerer de informação",                 points: 4
TaskType.create name: "Apurar/Pesquisar informações",           points: 6
