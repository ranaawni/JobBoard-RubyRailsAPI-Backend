Rails.application.routes.draw do
 #routes of the app
  post '/signup', to: "registrations#create"   #signup rout + registrations controller
  post '/signin', to: "sessions#create"        #signin rout + sessions controller
  delete '/logout', to: "sessions#logout"      #logout rout
  get '/logged_in', to: "sessions#logged_in"   #logged in rout

  #Categories Routes
  get '/categories', to: "categories#index"    #get categories rout
  get '/categories/:id', to: "categories#show"    #get categories rout
  put '/editcategories/:id', to: "categories#update" #edit one category
  delete '/deletecategories/:id', to: "categories#destroy" #edit one category

  #Jobs Routes
  get '/jobs', to: "jobs#index"                #get jobs rout
  post '/createjobs', to: "jobs#index"                #create new job rout
  put '/editjobs/:id', to: "jobs#update"       #route for edit one job
  get '/:id/jobs', to: "applieds#index"       #route to get all jobs in seeker page (First page)
  get '/:id/appliedjobs', to: "applieds#index"       #route to get applied jobs for seeker  
  post '/:id/jobs/apply', to: "applieds#create"       #route to create applied job 
end





