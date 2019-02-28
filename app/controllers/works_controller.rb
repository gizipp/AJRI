class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /works
  # GET /works.json
  def index
    if current_user.role?("admin")
      @works = Work.all.order("created_at").page(params[:page]).per(5)
    else
      @works = current_user.works.page(params[:page]).per(5)
    end
    @user = User.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @todo_list = TodoList.where(work_id: params[:id]).order('created_at')
    @contributor = Contributor.to_con(params[:id])
    
    # # Select the user who not already assigned as contributor
    @u = User.all.where.not(id: current_user.id)
    @ids = @contributor.map{|x| x.user_id}
    @user = @u.reject{|x| @ids.include? x.id}
    
    #filter user
    #@user = Contributor.filter_contributed_works(params[:id], current_user.id)
    # @user = Contributor.to_con(1)
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:title, :description, :user_id )
    end
end
