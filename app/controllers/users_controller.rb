class UsersController < ApplicationController

	#Acciones para antes y despues de hacer algo
	before_action :set_user, except: [:index,:new, :create]
	before_action :set_users, except: [:index, :show]
	after_action :set_users, except: [:index, :show]

	  def index
		 @users = User.all	 
	  end


	  #Se crea un nuevo element para luego rellenar sus campos
	  def new
	  	@user = User.new
	  end

	  #Metodo para guardar un elemento 
	  def create
		  	@user = User.new(user_params)

			  	if @user.save
			    redirect_to @user
			 
				else
				render :new	
				end
	  end

	  #Metodo para Borrar un elemnto de la base de datos 
	  def destroy
		  @user.destroy
		  redirect_to users_path
	  end	

	  #Metodo para editar la informacion de una elemento 
	  def update	
	 	if @user.update(user_params)
	  		redirect_to @user
	  	else
	  		render :edit
	  	end	

	  end

	  #Funciones privadas
	  private

	  #Mucho del codigo era repetitivo asi que se crearon
	  #las siguientes funciones para evitar inclumplir con
	  #el modelo de ruby on rails basado en el metodo Dry
	  #que trata de no repetir tanto codigo

	  #Busca un usuario con toda su informacion
	  def set_user
	  	@user = User.find(params[:id])
	  end	

	  #Metodo que obtiene todos los usuarios y para
	  #antes o despues de una accion se guarda en un archivo 
	  #publico llamado usuarios.json y de esta forma tener un Api
	  #de la informacion de la base de datos
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

	  #Asignacion de parametros al momento de crear o guardar
	  def user_params
	  	params.require(:user).permit(:rut,:nombre,:apellido,:image,:email,:birth,:password)
	  end	

end