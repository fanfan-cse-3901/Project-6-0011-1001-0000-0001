# frozen_string_literal: true

# File created on 07/26/2020 by Kevin Dong
# On server init
module Globals
  # Application wide variables
  class Filters
    SUB_CAT = ['Tables and Desks', 'Couches and Chairs', 'Beanbags', 'Beds and Bedding', 'Patio', 'Tech', 'Other'].freeze
    COLORS = %w[red blue yellow green orange purple brown pink white black].freeze
    QUALITY = %w[new used old].freeze
    LOCATION = %w[north east south west].freeze
  end
end
