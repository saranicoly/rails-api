require 'rails_helper' 
describe User do 
    it "é válido quando o usuário insere email e senha e a senha tem mais de  caracteres" do
        user = User.new( email: 'bruce@ironmaiden.com', 
            password: '123456' ) 
            expect(user).to be_valid 
    end
    it "verifica se o token foi gerado" do
        user = User.new( email: 'bruce@ironmaiden.com', 
            password: '123456') 
        expect(user.authentication_token.nil?) == "false"
    end
end