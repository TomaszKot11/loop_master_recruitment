describe ProductsController do 
    let!(:products) { create_list :product, 5 }

    context '#index' do 
        subject(:get_index) { get :index }

        before :each do
            get_index
        end

        it 'should render index template' do
            expect(response).to render_template('index')
        end

        it 'shoudl assign @products variable' do
            expect(assigns(:products)).not_to be_nil
        end

        it '@products variable should consist of all products' do 
            expect(assigns(:products)).to match_array(products)
        end
    end
end