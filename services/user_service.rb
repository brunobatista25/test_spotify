# modulo do usuario
module UserService
  include HTTParty
  base_uri 'https://api.spotify.com/v1'
  format :json
  headers Authorization: 'Bearer BQDpHMvCB3PJ0Tt2MbmjrfC5DNMDDcXnACwjn8F2u0l7BIns0YKZ25j_N5lz7Hez1bCwdJ5-qE_Bs71sATJgFk-thMJcnqEScnl_8-720BqjA67ualf8kTmaeJcGEuaAOzvV2ZAzsuiDYqFEXaPDTE4zlqeBvG1fHKGacqrxd2GHQxcdBwEGU9S-sYKu4OC-_-aCBoHpaA4d8a7U5-pnb_tNwexrrQ2LckubkeEn2ChTnqI6NzGdUtP-fhZWEzWLF0LGkzdiLH2gJxAMCTxpygVuVR0IEnN7Lxg',
          'Content-Type': 'application/json'
end
