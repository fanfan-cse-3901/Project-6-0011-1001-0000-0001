# frozen_string_literal: true

# File created on 07/26/2020 by Kevin Dong
# On server init
module Globals
  # Application wide variables
  class Filters
    SUB_CAT = ['All', 'Tables and Desks', 'Couches and Chairs', 'Beds and Bedding', 'Patio', 'Tech', 'Other'].freeze
    COLORS = %w[All Red Blue Yellow Green Orange Purple Brown Pink White Black].freeze
    QUALITY = %w[All New Like-New Used Acceptable Poor].freeze
    LOCATION = %w[All North East South West Other].freeze
  end

  class Items
    SUB_CAT = ['Tables and Desks', 'Couches and Chairs', 'Beds and Bedding', 'Patio', 'Tech', 'Other'].freeze
    COLORS = %w[Red Blue Yellow Green Orange Purple Brown Pink White Black].freeze
    QUALITY = %w[New Like-New Used Acceptable Poor].freeze
    LOCATION = %w[North East South West Other].freeze
  end
end
