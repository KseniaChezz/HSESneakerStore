# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

def upload_fake_logo
  uploader = LogoUploader.new(Logo.new, :logo)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/brands', '*')).sample))
  uploader
end

@sneaker_models = ['Air Max', 'Cortez', 'Blazer', 'Dunk', 'Zoom']
@brand_names = ['Nike', 'Adidas', 'New Balance', 'Reebok', 'Puma', 'Yonex', 'Merrell', 'Columbia']
@sneaker_sex = ['male', 'female', 'unisex']


def sneaker_price
  rand(8000..25000)
end

def create_sneaker
  Sneaker.create(
    brand_id: random_brand_id,
    model: @sneaker_models.sample,
    sex: @sneaker_sex.sample,
    price: sneaker_price,
    image: upload_fake_image
  )
end

def create_brand
  Brand.create(
    logo: upload_fake_logo,
    name: @brand_names.sample
  )
end

8.times do
  brand = create_brand
  puts "Brand #{brand.id} created"
end

75.times do
  sneaker = create_sneaker
  puts "Sneaker #{sneaker.id} created"
end
