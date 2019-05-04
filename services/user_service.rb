# modulo do usuario
module UserService
  include HTTParty
  base_uri 'https://api.spotify.com/v1'
  format :json
  headers Authorization: 'Bearer BQDNWcx6Yj7jpx612FpoTIJCnjO1F9ZVe57LTp3uWfgA6ssBf_ZO7lzwTyugSmahTo82VNFm8t6uprHQQQ8m7KxCjngcHBNZejuBi1HR4gxy6B2xto7HiFnnJYB4oh4Ea5Kk9IMmRjkkzssEGXlhGGtXnp2LpkEEwy8BHks_5wP_czzTNL9ZI7DJfXy43vTNrrMdk7_MS-kgIMHZ-zCywmRJUJF-3Z9ubJLSt6bR7u6DuJc_K4kyjCEJjyewe-lkQN-gMLPuT1QD3JXQ104-evVSmVvneuYCQW4',
          'Content-Type': 'application/json'
end
