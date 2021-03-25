class JobsController < ApplicationController
    #Get all Jobs
    def index
        user = User.find(params["id"])
        if user && user['role'] == 'admin'
            jobs = Job.all
            render json: {status: 'SUCCESS', message: 'Loaded jobs', data:jobs},status: :ok
        else
    
        render json: { status: 'not authorized' }
        end
    end

     #get job by id
     def show
        job = Job.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded job', data:job},status: :ok
    end

    #create new job
    def create
        user = User.find(params["id"])
        if user && user['role'] == 'admin'
            jobs = Job.new(job_params)
            if jobs.save
                render json: {status: 'SUCCESS', message:'Saved Jobs', data:jobs},status: :ok
            else
                render json: {status: 'ERROR', message:'Jobs not saved', data:jobs.errors},status: :unprocessable_entity

        end
    else
        render json: { status: 'not authorized' }
    end
    end

    #update job
    def update
        user = User.find(params["userid"])
        if user && user["role"] == "admin"
        job = Job.find_by(params["id"])
        job.update_attributes(job_params)
            render json: {status: 'SUCCESS', message: 'Updated Job', data:job},status: :ok
    else
        render json: { status: 'not authorized' }
    end
    end
    
    #delete one job
    def destroy
        user = User.find(params["userid"])
        if user && user["role"] == "admin"
        job = Job.find(params[:id])
        job.destroy
        render json: {status: 'SUCCESS', message:'Deleted Job', data:job},status: :ok
        else
            render json: { status: 'not authorized' }
        end

    end

    private
    def job_params
        params.permit(:name, :job_code, :description, :date_publishe)
    end
end

    