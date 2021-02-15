module Api
    module Ur1
        class UsersController < ApplicationController
            def add(key)
                if User.find_by(email: key)
                    return false
                else
                    return true
                end
            end
            def index
                users = User.order('created_at');
                render json: {
                    status: 'Exitoso',
                    message: 'usuarios cargados',
                    data: users
                }, status: :ok
            end
            def show
                user = User.find(params[:id])
                render json: {
                    status: 'Exitoso',
                    message: 'usuarios cargados',
                    data: user
                }, status: :ok
            end

            def create
                user = User.new(user_params)

                if add(params[:email])
                    if user.save
                        render json: {
                            status: 'Exitoso',
                            message: 'usuario creado',
                            data: user
                        }, status: :ok
                                          
                    else
                        render json: {
                            status: 'Fallido',
                            message: 'usuario no creado',
                            data: user.errors
                        }, status: :unprocessable_entity 
                    end
                else
                    render json: {
                        status: 'Fallido',
                        message: 'usuario existente',
                        data:'usuario existente',                    
                    }
                end
               
            end
            def destroy
                user = user = User.find(params[:id])
                if user.destroy
                    render json: {
                        status: 'Exitoso',
                        message: 'usuario eliminado',
                        data: user
                    }, status: :ok
                                      
                else
                    render json: {
                        status: 'Fallido',
                        message: 'usuario no eliminado',
                        data: user.errors
                    }, status: :unprocessable_entity 
                end
            end
            def update
                user = user = User.find(params[:id])
                if user.update_attributes(user_params)
                    render json: {
                        status: 'Exitoso',
                        message: 'usuario actualizado',
                        data: user
                    }, status: :ok                 
                else
                    render json: {
                        status: 'Fallido',
                        message: 'usuario no actualizado',
                        data: user.errors
                    }, status: :unprocessable_entity
                end
            end

            private
            def user_params
                params.permit(:nombre, :email, :tel)
            end

        end
    end    
end