json.array!(@administradores) do |administrador|
  json.extract! administrador, :id, :nombre, :apellido, :usuario, :tipo, :telefono, :email, :activo
  json.url administrador_url(administrador, format: :json)
end
