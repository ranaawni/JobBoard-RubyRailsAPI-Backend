class JobsController < ApplicationController
    #Get all Jobs
    def index
        @jobs = Job.all
        render json: {status: 'SUCCESS', message: 'Loaded jobs', data:@jobs},status: :ok
    end
     #get job by id
     def show
        job = Job.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded job', data:job},status: :ok
    end

    #create new job
    def create
        jobs = Job.new(job_params)
        if jobs.save
            render json: {status: 'SUCCESS', message:'Saved Job', data:jobs},status: :ok
        else
            render json: {status: 'ERROR', message:'Job not saved', data:jobs.errors},status: :unprocessable_entity
        end
    end

    #update job
    def update
        job = Job.find(params[:id])
        if job.update_attributes(job_params)
            render json: {status: 'SUCCESS', message: 'Updated Job', data:job},status: :ok
        else
            render json: {status: 'ERROR', message:'Job not updated', data:job.errors},status: :unprocessable_entity
        end
    end
    
    #delete one job
    def destroy
        job = Job.find(params[:id])
        job.destroy
        render json: {status: 'SUCCESS', message:'Deleted Job', data:job},status: :ok

    end

    private
    def job_params
        params.permit(:name)
    end
end

    