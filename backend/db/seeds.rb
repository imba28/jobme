# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.create(name: 'sport', icon_url: 'sport.url', chilhood: '1')
Category.create(name: 'natrue', icon_url: 'nature.url', chilhood: '1')
Category.create(name: 'crative', icon_url: 'creative.url', chilhood: '1')
Category.create(name: 'transport', icon_url: 'transport.url', chilhood: '0')
Category.create(name: 'worker', icon_url: 'worker.url', chilhood: '0')
Category.create(name: 'indoor', icon_url: 'indoor.url', chilhood: '0')

@sub1 = Subcategory.create(name: 'football', icon_url: 'football.url', category_id: '1')
@sub2 = Subcategory.create(name: 'hill', icon_url: 'hill.url', category_id: '2')
@sub3 = Subcategory.create(name: 'dog', icon_url: 'dog.url', category_id: '2')
@sub4 = Subcategory.create(name: 'screw', icon_url: 'screw.url', category_id: '5')
@sub5 = Subcategory.create(name: 'saw', icon_url: 'saw.url', category_id: '5')
@sub6 = Subcategory.create(name: 'stecker', icon_url: 'stecker.url', category_id: '5')

@job1 = Job.create(name: 'Legobauer', gif_url: 'hello1.gif', description: 'description')
@job2 = Job.create(name: 'Lehrer', gif_url: 'hello2.gif', description: 'description')
@job3 = Job.create(name: 'Metalltechniker', gif_url: 'hello3.gif', description: 'description')
@job4 = Job.create(name: 'Gärtner', gif_url: 'hello.gif4', description: 'description')
@job5 = Job.create(name: 'Tesdummy', gif_url: 'hello.gif5', description: 'description')

@job1.subcategories << @sub4
@job1.subcategories << @sub5
@job1.subcategories << @sub6
@job2.subcategories << @sub3
@job2.subcategories << @sub1
@job2.subcategories << @sub2
