class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    list_id= 'b99c3718609f2c545912b7d1ea7b12d6'
    date=''
    page=1
    page_size=100
    order_field='email'
    order_direction='asc'
    auth={:password=>'x', :username=>'8b5b621996e34dd3e919bfb31499e590'}
    @blah = HTTParty.get("https://api.createsend.com/api/v3.1/lists/#{list_id}/active.json?date=#{date}&page=#{page}&pagesize=#{page_size}&orderfield=#{order_field}&orderdirection=#{order_direction}", 
                     :basic_auth => auth, :verify => false).as_json
    @ready= JSON.parse( @blah.to_json, {:symbolize_names => true} )
    @data=@ready[:Results]
    
    @data.each do |dat|
      @user=User.new
      @user.name=dat[:Name]
      @user.email=dat[:EmailAddress]
      @user.save
    end
    
    





    #cs = CreateSend::List.get({:api_key => ENV['8b5b621996e34dd3e919bfb31499e590']}, ENV['CM_LIST_ID'])
    #@lists.each do |list|
     #@data=list.methods
     #active(date="",page = 1, page_size= 100, order_field="email", order_direction="asc").to_json
    

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
