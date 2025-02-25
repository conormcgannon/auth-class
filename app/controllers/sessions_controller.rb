class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # where we're going to do the work to authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"]})
    # 2. if the user exists -> check if they know their password
      if @user != nil #asks if the user is nil or not. Can also do if @user != nil
    # 3. if they know their password -> login is successful
        if @user["password"] == params["password"]
         flash["notice"] = "Welcome."
         redirect_to "/companies"
        else
          flash["notice"] = "Wrong username/password combination."
          redirect_to "/login"
    # 4. if the user doesn't exist or they don't know their password -> login fails
      end
    
    else
      flash["notice"] = "No user."
      redirect_to "/login"
  end
end


  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
