# frozen_string_literal: true

Product.destroy_all
Genre.destroy_all
Label.destroy_all

arr_products = [
  { title: 'Name1', price: 20, release_date: Time.current },
  { title: 'Name2', price: 34, release_date: Time.current - 1.year },
  { title: 'Name3', price: 69, release_date: Time.current - 2.days },
  { title: 'Name4', price: 555, release_date: Time.current - 3.days }
]

genre_arr = [{ name: 'Category1' }, { name: 'Category2' }]
label_arr = [{ name: 'Company1' }, { name: 'Company2' }]

# could be done in some transaction?
arr_products.each { |el| Product.create!(el) }
label_arr.each { |el| Label.create!(el) }
genre_arr.each { |el| Genre.create!(el) }

Product.first.genres << Genre.first
Product.second.genres << Genre.first
Product.third.genres << Genre.second
Product.fourth.genres << Genre.second

Product.first.update!(label_id: Label.first.id)
Product.second.update!(label_id: Label.first.id)
Product.third.update!(label_id: Label.second.id)
Product.fourth.update!(label_id: Label.second.id)
