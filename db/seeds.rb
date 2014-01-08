# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TaskType.create name: "Organizar coletiva de imprensa", points: 8
TaskType.create name: "Realizar cobertura fotográfica de evento", points: 6
TaskType.create name: "Realizar streaming de evento", points: 6
TaskType.create name: "Filmar e pré-produzir", points: 6

TaskType.create name: "Avaliação técnica", points: 6
TaskType.create name: "Avaliação jurídica", points: 6

TaskType.create name: "Desenvolver funcionalidade", points: 24
TaskType.create name: "Desenhar projetos web", points: 24
TaskType.create name: "Participar de brainstorms para plataformas", points: 6
TaskType.create name: "Participar de programa beta-testers", points: 4

TaskType.create name: "Redigir de roteiro de filme", points: 12
TaskType.create name: "Editar e pós produzir filme", points: 10
TaskType.create name: "Escrever e distribuir releases para imprensa", points: 2
TaskType.create name: "Conceituar e desenhar imagens para uma mobilização", points: 2
TaskType.create name: "Divulgar online", points: 2
TaskType.create name: "Mapeamento de redes", points: 4

TaskType.create name: "Organizar evento de rua", points: 12
TaskType.create name: "Participar de evento de rua", points: 4
TaskType.create name: "Realizar intervenção urbana", points: 4
TaskType.create name: "Realizar pressão", points: 5

TaskType.create name: "Organizar hackathon", points: 80
TaskType.create name: "Participar de hackathon", points: 16
TaskType.create name: "Participar beta tester", points: 6

TaskType.create name: "Requerer de informação", points: 4
TaskType.create name: "Apurar com parlamentares", points: 6
TaskType.create name: "Apurar com especialistas", points: 8
