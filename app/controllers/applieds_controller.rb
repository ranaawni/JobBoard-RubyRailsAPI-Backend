class AppliedsController < ApplicationController
    # include UsersController
    # include Jobs
    
    #get all jobs inside user page
    def index
        user = User.find(params["id"])

        if user
            jobs = Job.all
            render json: {status: 'SUCCESS', message: 'Loaded jobs For user', data:jobs},status: :ok
        else
            render json: { status: 401 }
        end

    end
    
    #apply for job 
    def create
        user = User.find(params["id"])
        if user
        applied = Applied.new(apply_params)
        if applied.save
            render json: {status: 'SUCCESS', message:'Saved Applied Job', data:applied},status: :ok
        else
            render json: {status: 'ERROR', message:'Applied not saved', data:applied.errors},status: :unprocessable_entity
        end
    else
        render json: { status: 401 }
    end
    end
    
    #find applied jobs for specific user
    def index
        user = User.find(params[:id])
        # render json: {status: 'SUCCESS', message: 'Loaded jobs For user', data:user['id']},status: :ok

        if user
            userId = user['id']
            jobs = Applied.find_by(user_id: params[:id])
            jobname = Job.find(jobs["job_id"])
            render json: {status: 'SUCCESS', message: 'Job for user', data:jobname},status: :ok

        else
            render json: {status: 'Error', message: 'Can not find jobs for user', data:jobs.error},status: :unprocessable_entity
        end
    end

    private
    def apply_params
        params.permit(:user_id, :job_id)
    end

end