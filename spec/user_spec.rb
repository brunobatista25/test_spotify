describe 'Buscar Perfil' do
  context 'com sucesso' do
    it 'pelo id' do
      @usuario = UserService.get '/users/2ivrc43hzntxfl1wuxy9kvm0l'
      expect(@usuario.code).to eq  200
      expect(@usuario['display_name']).to eq 'bruno'
      expect(@usuario['id']).to eq '2ivrc43hzntxfl1wuxy9kvm0l'
    end  

    it 'pelo atual' do
      @usuario_atual = UserService.get '/me'
      expect(@usuario_atual.code).to eq  200
      expect(@usuario_atual['display_name']).to eq 'bruno'
      expect(@usuario_atual['email']).to eq 'brunobatista@mailinator.com'
      expect(@usuario_atual.code).to eq  200
    end
  end

  context 'sem sucesso' do
    it 'com id errado' do
     @usuario = UserService.get '/users/2ivrc43hzntxfl1wuxy9kvm0'
     expect(@usuario.code).to eq  404
    end
  end
end