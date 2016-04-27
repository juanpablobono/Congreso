class Localidad < ActiveRecord::Base
  belongs_to :provincia
  # Ver config/initializers/inflections.rb
  self.table_name = "localidades"
end
