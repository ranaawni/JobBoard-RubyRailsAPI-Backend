class CategoriesController < ApplicationController
    #Get all categories
    def index
        @categories = Category.all
        render json: {status: 'SUCCESS', message: 'Loaded categories', data:@categories},status: :ok
    end
     #get category by id
     def show
        category = Category.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded category', data:category},status: :ok
    end

    #create new category
    def create
        user = User.find(params["userid"])
        if user && user['role'] == 'admin'
        categories = Category.new(category_params)
        categories.save
            render json: {status: 'SUCCESS', message:'Saved Category', data:categories},status: :ok
        else
            render json: { status: 'not authorized' }
        end
    end

    #update category
    def update
        user = User.find(params["userid"])
        if user && user['role'] == 'admin'
        category = Category.find(params[:id])
        category.update_attributes(category_params)
            render json: {status: 'SUCCESS', message: 'Updated article', data:category},status: :ok
        else
            render json: { status: 'not authorized' }
        end
    end

    
    #delete one category
    def destroy
        user = User.find(params["userid"])
        if user && user['role'] == 'admin'
        category = Category.find(params[:id])
        category.destroy
        render json: {status: 'SUCCESS', message:'Deleted Category', data:category},status: :ok
        else
        render json: { status: 'not authorized' }
        end
    end
   

    private
    def category_params
        params.permit(:cat_name)
    end
end

    