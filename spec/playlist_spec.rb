describe 'Playlist' do
  let(:name) { Faker::Name.name }
  let(:description) { Faker::ChuckNorris.fact }

  def method_body(name_field, public_field,
                  collaborative_field, description_field)
    @body = {
      "name": name_field,
      "public": public_field,
      "collaborative": collaborative_field,
      "description": description_field
    }.to_json
  end

  context 'Criar' do
    it 'com sucesso' do
      @playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm0l/playlists',
                                   body: method_body(name, 'true',
                                                     'false', description)

      expect(@playlist['name']).to eq name
      expect(@playlist['description']).to eq description
    end
  end

  context 'sem sucesso' do
    it 'sem campo obrigatorio' do
      @playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm0l/playlists',
                                   body: method_body('', 'true',
                                                     'false', description)

      expect(@playlist.code).to eq 400
      expect(@playlist['error']['message']).to eq 'Missing required field: name'
    end

    it 'id do usuario errado' do
      @playlist = UserService.post '/users//playlists',
                                   body: method_body(name, 'true',
                                                     'false', description)
      expect(@playlist.code).to eq 404
      expect(@playlist['error']['message']).to eq 'Invalid username'
    end

    it 'playlist colaborativa nao privada' do
      @playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm0l/playlists',
                                   body: method_body(name, true,
                                                     true, description)
      expect(@playlist.code).to eq 400
      expect(@playlist['error']['message']).to eq 'Collaborative playlists can only be private.'
    end

    it 'outro usuario' do
     @playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm/playlists',
                                   body: method_body(name, 'true',
                                                     'false', description) 
      expect(@playlist.code).to eq 403
      expect(@playlist['error']['message']).to eq 'You cannot create a playlist for another user.'
    end
  end

  context 'Adicionar' do
    before {
      @add_playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm0l/playlists',
                                       body: method_body(name, true,
                                                         false, description)
    }
    it 'Um track na playlist' do
      @body = { uris: [ 'spotify:track:6EJiVf7U0p1BBfs0qqeb1f' ] }.to_json
      @add_traker = UserService.post "/playlists/#{@add_playlist['id']}/tracks",
                                     body: @body
      expect(@add_traker.code).to eq 201
    end
  end

  it 'listar playlists' do
    @add_playlists = UserService.get '/me/playlists'
    expect(@add_playlists['items']).not_to be_empty
  end

  it 'ver detalhes de uma playlist' do
    @detail_playlist = UserService.get '/playlists/1aK5wLlb1so1RSmVJqfurq'
    expect(@detail_playlist['name']).to eq 'Mrs. Jerrold Mayert'
    expect(@detail_playlist['description']).to eq 'Chuck Norris finished World of Warcraft.'
    expect(@detail_playlist['id']).to eq '1aK5wLlb1so1RSmVJqfurq'
    expect(@detail_playlist['href']).to eq 'https://api.spotify.com/v1/playlists/1aK5wLlb1so1RSmVJqfurq'
    expect(@detail_playlist['tracks']['items']).not_to be_empty
  end


  context 'remover' do
    before {
      @add_playlist = UserService.post '/users/2ivrc43hzntxfl1wuxy9kvm0l/playlists',
                                       body: method_body(name, true,
                                                         false, description)
      @body = { uris: [ 'spotify:track:6EJiVf7U0p1BBfs0qqeb1f' ] }.to_json
      @add_traker = UserService.post "/playlists/#{@add_playlist['id']}/tracks",
                                     body: @body
    }

    it 'um track' do
      @body = {
        "tracks": [
          {
            "uri": 'spotify:track:6EJiVf7U0p1BBfs0qqeb1f'
          }
        ]
      }.to_json

     @remover_traker = UserService.delete "/playlists/#{@add_playlist['id']}/tracks",
                                          body: @body

     expect(@remover_traker.code).to eq 200
    end
  end
end
