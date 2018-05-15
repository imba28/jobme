# frozen_string_literal: true

json.array! @childhoods, partial: 'categories/category', as: :category

# json.array! @childhoods, partial: 'childhoods/childhood', as: :childhood
