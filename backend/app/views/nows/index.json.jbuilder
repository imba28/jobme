# frozen_string_literal: true

json.array! @nows, partial: 'categories/category', as: :category

# json.array! @nows, partial: 'nows/now', as: :now
