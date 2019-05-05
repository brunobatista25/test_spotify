# modulo do usuario
module UserService
  include HTTParty
  base_uri 'https://api.spotify.com/v1'
  format :json
  headers Authorization: 'Bearer BQC7AW42xOS2LCeKZ2NLHcSVguHLbxo1zGdg_5GjY4z8JQFxdS3wF2DA-4JoUVYt85ynjZ76PcgzX0VR2MZYlT8QqX0faVY62d7V-HrZgRFdQkMqX6y6W0rh3izf2g_AL1vMwiHlmfCyoUsU3VhZcU5vHTMUja6xt6is36yoNZ1ikyhLnuUUiJ64I4fZyBm-ZcHQmKTm6nmiMcvqokc_p-EUjDhlhEgqr0goIQPCrrJViqAhmF_Y7xRplCtkD82lCe4f_uDQ68EYDgwGwUu0HaEzBtj9Q_S2ghs',
          'Content-Type': 'application/json'
end
