# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#add some data to the tables
Category.create({
    cat_name: 'Management'
})

Job.create({
    name: 'Software Engineer', job_code: '#1234', description: '
    Compile and analyze data, processes, and codes to troubleshoot problems
     and identify areas for improvement. Collaborating with the front-end developers
      and other team members to establish objectives and design more functional, 
      cohesive codes to enhance the user experience.', date_published: '3/22/2021',cat_id:'1'
})

User.create({
    first_name: 'Rana', last_name: 'Alhmoud' , email: 'ranaalhmoud92@gmail.com', mobile_number: '0797828117', password:'123456', password_confirmation:'123456'
    role: 'admin'
})

#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
