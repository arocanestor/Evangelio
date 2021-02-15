Rails.application.routes.draw do
   namespace 'api' do
    namespace 'ur1' do
      resources :users
    end    
   end
end
