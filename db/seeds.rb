# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


videoExamples = [
    { title: 'Zype Playout Demo', link: 'https://www.youtube.com/embed/gawU9syyhT8', video_type: 'free' },
    { title: 'Zype Overview', link: 'https://www.youtube.com/embed/rPc7RPS-KEs', video_type: 'free' },
    { title: 'Zype Playout Showcase (featuring Vevo)', link: 'https://www.youtube.com/embed/BaUOCKUjk0U', video_type: 'premium' },
    { title: 'Import & Upload Videos in the Zype Platform', link: 'https://www.youtube.com/embed/hakEa95vPgk', video_type: 'premium' }
]

Video.create(videoExamples)
