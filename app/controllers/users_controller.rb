class UsersController < ApplicationController

	before_action :set_user, except: [:index,:new, :create]
	before_action :set_users, except: [:index, :show]

  def index
	 @users = User.all	 
  end


  #Se crea un nuevo elemento
  #ruta => /mostrar/new
  def new
  	@user = User.new
  end

  #metodo para crear y guardar un elemento y usa el metodo POST
  def create
	  	@user = User.new(user_params)

		  	if @user.save
		    redirect_to @user
		 
			else
			render :new	
			end
  end

  def destroy
	  @user.destroy
	  redirect_to users_path

		 userslist = []
	      @users = User.all
	  		@users.all.each do |u|
			  	 usuarios =	{
			  	 	 :id => u.id, :rut => u.rut, :nombre => u.nombre,
			  		 :apellido => u.apellido, :image => u.image,
			  		 :email => u.email, :birth => u.birth,
			  		 :password => u.password
			  		}
			  		userslist << usuarios	
		  	 end

			File.open("public/usuarios.json","w+") do |f|
			  f.write(userslist.to_json)
			end	
  end	

  #metodo para editar la informacion de una elemento usando el metodo PUT
  def update	
 	if @user.update(user_params)
  		redirect_to @user

		   userslist = []
		      @users = User.all
		  		@users.all.each do |u|
				  	 usuarios =	{
				  	 	 :id => u.id, :rut => u.rut, :nombre => u.nombre,
				  		 :apellido => u.apellido, :image => u.image,
				  		 :email => u.email, :birth => u.birth,
				  		 :password => u.password
				  		}
				  		userslist << usuarios	
			  	 end

				File.open("public/usuarios.json","w+") do |f|
				  f.write(userslist.to_json)
				end	
  	else
  		render :edit
  	end	

  end

  private

  def set_user
  	@user = User.find(params[:id])
  end	

   def set_users
     userslist = []
      @users = User.all
  		@users.all.each do |u|
		  	 usuarios =	{
		  	 	 :id => u.id, :rut => u.rut, :nombre => u.nombre,
		  		 :apellido => u.apellido, :image => u.image,
		  		 :email => u.email, :birth => u.birth,
		  		 :password => u.password
		  		}
		  		userslist << usuarios	
	  	 end

		File.open("public/usuarios.json","w+") do |f|
		  f.write(userslist.to_json)
		end	 
  end

  def user_params
  	params.require(:user).permit(:rut,:nombre,:apellido,:image,:email,:birth,:password)
  end	

end