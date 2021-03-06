class RegistrationsController < ApplicationController
#     def create
#         user = User.find_by(email: params["user"]["email"])
#                    .try(:authenticate, params["user"]["password"])
#     if user
#         session[:user_id] = user.id
#         render json: {
#             status: :created,
#             logged_in: true,
#             user: user
#         }
#     else
#         render json: {
#             status: 401
#         }
#     end
#   end
   def create
    user = User.create!(user_params)
    if user
        session[:user_id] = user.id
        render json: {
            status: :created,
            user: user
        }
    else
        render json: {status: 'ERROR', message:'User not saved', data:user.errors},status: :unprocessable_entity
    end
   end
   private
   def user_params
       params.permit(:first_name, :last_name, :email, :mobile_number, :password, :password_confirmation, :role)
   end
end
