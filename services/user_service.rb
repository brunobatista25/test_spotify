# modulo do usuario
module UserService
  include HTTParty
  base_uri 'https://api.spotify.com/v1'
  format :json
  headers Authorization: 'Bearer BQDlWGFl5ek9w3okcTO-bPg-wC31G8Pb-j74cmmlTBCefa9bYKww658coZ1YimcDqZpdthlc6e9ndOnYx6ejUL5IZ3rtvKV_1LUqodZ7cFB6895bwkWUlkx_ihUkLhptP9N1tR1KkQc-Eda05LqjYcQby6F5O2hA1Im62OE11egs_26S9i3PhIZmXjRu1__x-3in0Fl9Wpuod1UvfJqiVzh723QP4V6M8-JEULhJcXcVGuV7xMCda2FAE_0nswpFJUY3y1cGytwuJaCS54sd3i2K2qZAbl-CVkE',
          'Content-Type': 'application/json'
end
