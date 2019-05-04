describe 'Criar' do
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

  context 'Playlist' do
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
end
