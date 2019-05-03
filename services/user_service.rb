module UserService
  include HTTParty
  base_uri 'https://api.spotify.com/v1'
  format :json
  headers Authorization: 'Bearer BQASCfSyQEbzOtQMYashO7uHPXEx_M3iAM7KkGPYWgW6hXdbWB-AGhEc7p-WuDejbLgQ1XO2oHt1nvaWclXJqArG0ikz85l006qwhqSGhhkWyS04X-6felq67lPaRLCmZzcG3QcCNMoX_kqSqSw_uHdTIb6bmoWI1BMxODgZUJT0Q9_xCWKDlYLc8VkPOoDd-C7o_XNT-6uYM4TxNVX7HOZnR5vxTLmABYK32i8wkvUItyQHNsB5vqhFhKcbe116sdeF5dYMO5-Qek5-ukSGaCTAulsANailuBA',
          'Content-Type': 'application/json' 
end