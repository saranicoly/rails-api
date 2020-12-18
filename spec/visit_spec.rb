require 'rails_helper' 
describe Visit do 
    it "é válido se a visita for válida" do
        visit = Visit.new(name: 'loja 1', data_visita: '3/4/2021')
        visit.create_user!(email:' testando@gmail.com', password: '1234567')
        expect(visit).to be_valid 
    end
    it "verifica se a data de visita está sendo inserida" do
        visit = Visit.new(name: 'loja 1', data_visita: '3/4/2021')
        visit.create_user!(email:' testando@gmail.com', password: '1234567')
        expect(visit.data_visita.nil?) == false
    end
    it "verifica se o id está sendo inserido automaticamente" do
        visit = Visit.new(name: 'loja 1', data_visita: '3/4/2021')
        visit.create_user!(email:' testando@gmail.com', password: '1234567')
        expect(visit.id_came_from_user?) == false
    end
    it "verifica se tem um usuário atribuído a visita" do
        visit = Visit.new(name: 'loja 1', data_visita: '3/4/2021')
        visit.create_user!(email:' testando@gmail.com', password: '1234567')
        expect(visit.user_id.nil?) == false
    end

end