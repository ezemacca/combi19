json.extract! calificacion, :id, :puntaje, :comentario, :created_at, :updated_at
json.url calificacion_url(calificacion, format: :json)
