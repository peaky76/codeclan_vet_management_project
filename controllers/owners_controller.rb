require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

# INDEX
get '/owners' do
    @owners = Owner.all
    erb ( :"owners/index" )
end

# REGISTER
get '/owners/register' do
    @owners = Owner.all()
    erb( :"owners/registration" ) 
end

# NEW
get '/owners/new' do
    erb ( :"owners/new" )
end

# CREATE
post '/owners' do
    @owner = Owner.new(params)
    @owner.save()
    erb ( :"owners/create")
end

# SHOW
get '/owners/:id' do
    @owner = Owner.find(params['id'])
    erb ( :"owners/show" )    
end

# EDIT
get '/owners/:id/edit' do
    @owner = Owner.find(params['id'])
    erb ( :"owners/edit" )
end

# UPDATE
post '/owners/:id' do
    @owner = Owner.new(params)
    @owner.update()
    erb ( :"owners/update" )    
end

# DESTROY
post '/owners/:id/delete' do
    # Delete pets, otherwise cannot delete from database
    for pet in @owner.pets
        pet.delete()
    end
    @owner.delete()
    erb ( :"owners/destroy" ) 
end
